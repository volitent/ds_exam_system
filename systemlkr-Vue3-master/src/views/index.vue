<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :sm="24" :lg="24" style="padding-left: 20px">
        <h2>题库管理系统</h2>
      </el-col>
    </el-row>
    <el-row :gutter="20">
        <el-col :xs="24" :sm="24" :md="12" :lg="24">
            <el-card class="update-log">
                <template #header>
                    <div class="clearfix">
                        <span> 公告</span>
                    </div>
                </template>

                <el-scrollbar max-height="300px">
                    <ul class="notice-list">
                        <li
                                v-for="(item, index) in noticeList"
                                :key="index"
                                class="notice-item"
                        >
                            <el-icon class="notice-icon"><Document /></el-icon>

                            <span
                                    class="notice-title clickable"
                                    @click="toggleNotice(index)"
                            >
            {{ item.noticeTitle }}
          </span>

                            <span class="notice-date">
            {{ parseTime(item.createTime, '{y}-{m}-{d}') }}
          </span>

                            <!-- 可展开公告内容 -->
                            <div
                                    v-show="expandedIndex === index"
                                    class="notice-content"
                                    v-html="item.noticeContent"
                            />
                        </li>
                    </ul>
                </el-scrollbar>
            </el-card>
        </el-col>

      <el-divider />

      <el-col :xs="24" :sm="24" :md="12" :lg="24" >
          <el-row :gutter="20" class="dashboard-row">
              <!-- 左侧图表 -->
              <el-col :xs="24" :sm="12">
                  <el-card>
                      <template #header><b>题型统计</b></template>
                      <v-chart :option="typeChartOption" style="height: 300px; width: 100%;" />
                  </el-card>
              </el-col>

              <!-- 右侧图表 -->
              <el-col :xs="24" :sm="12">
                  <el-card>
                      <template #header><b>难度分布</b></template>
                      <v-chart :option="difficultyChartOption" style="height: 300px; width: 100%;" />
                  </el-card>
              </el-col>
          </el-row>

          <!-- 下方独占一行 -->
          <el-row style="margin-top: 20px">
              <el-col :span="24">
                  <el-card>
                      <template #header><b>知识点统计</b></template>
                      <v-chart :option="kpChartOption" style="height: 360px; width: 100%;" />
                  </el-card>
              </el-col>
          </el-row>

      </el-col>
    </el-row>
  </div>
</template>

<script setup name="Index">
const version = ref('3.8.9')
// 引入接口
import { listNotice } from '@/api/system/notice';
import { Document } from '@element-plus/icons-vue'
import { listQuestion } from '@/api/testpaper/question'

const noticeList = ref([]); // 公告数据
const loading = ref(false); // 加载中状态（可选）
import { onMounted, ref } from 'vue'
import VChart from 'vue-echarts'
import { use } from 'echarts/core'
import {
    CanvasRenderer
} from 'echarts/renderers'
import {
    PieChart,
    BarChart,
    RadarChart
} from 'echarts/charts'
import {
    TitleComponent,
    TooltipComponent,
    LegendComponent,
    GridComponent  // ✅ 必须添加这个
} from 'echarts/components'

use([
    CanvasRenderer,
    PieChart,
    BarChart,
    TitleComponent,
    TooltipComponent,
    LegendComponent,
    RadarChart,
    GridComponent  // ✅ 注册此组件支持 xAxis/yAxis
])

const typeChartOption = ref({})
const difficultyChartOption = ref({})
const kpChartOption = ref({})

const loadChartData = async () => {
    const res = await listQuestion({ pageNum: 1, pageSize: 1000 }) // 加载全部或前几页
    const data = res.rows

    // 1. 题型分布统计（带映射）
    const typeMap = {};
    const typeLabelMap = {
        single_choice: '选择题',
        fill_blank: '填空题',
        short_answer: '简答题',
        code: '编程题',
        未分类: '未分类'
    };

    data.forEach(q => {
        const type = q.questionType || "未分类";
        typeMap[type] = (typeMap[type] || 0) + 1;
    });

    typeChartOption.value = {
        tooltip: { trigger: 'item' },
        legend: {
            top: 'bottom',
            formatter: function (name) {
                // 显示中文
                return typeLabelMap[name] || name;
            }
        },
        series: [
            {
                name: '题型',
                type: 'pie',
                radius: '50%',
                data: Object.entries(typeMap).map(([type, count]) => ({
                    name: typeLabelMap[type] || type, // 中文名作为 name 显示
                    value: count
                }))
            }
        ]
    };


    // 2. 难度分布
    const difficultyMap = { 易: 0, 中: 0, 难: 0 }
    data.forEach(q => {
        const d = q.difficulty
        if (d == 1) difficultyMap.易++
        else if (d == 2) difficultyMap.中++
        else if (d == 3) difficultyMap.难++
    })

    difficultyChartOption.value = {
        xAxis: { type: 'category', data: Object.keys(difficultyMap) },
        yAxis: { type: 'value' },
        tooltip: {},
        series: [
            {
                data: Object.values(difficultyMap),
                type: 'bar',
                barWidth: '50%',
                itemStyle: {
                    color: '#409EFF'
                }
            }
        ]
    }
    console.log('chart option:', typeChartOption.value)


    // 3. 知识点统计
    const kpMap = {}
    data.forEach(q => {
        (q.knowledgePoints || []).forEach(kp => {
            const name = typeof kp === 'object' ? kp.kpName : kp
            kpMap[name] = (kpMap[name] || 0) + 1
        })
    })

    const sortedKp = Object.entries(kpMap).sort((a, b) => b[1] - a[1]).slice(0, 10)

    const xAxisLabels = sortedKp.map(([kp]) => kp)
    const yAxisValues = sortedKp.map(([_, count]) => count)

    kpChartOption.value = {
        tooltip: {},
        legend: { show: false },
        radar: {
            indicator: xAxisLabels.map(kp => ({
                name: kp,
                max: Math.max(...yAxisValues) + 2  // 设置合理最大值
            })),
            radius: '60%'
        },
        series: [
            {
                name: '知识点数量',
                type: 'radar',
                data: [
                    {
                        value: yAxisValues,
                        name: '题目数量'
                    }
                ],
                areaStyle: {
                    opacity: 0.2
                },
                itemStyle: {
                    color: '#E6A23C'
                }
            }
        ]
    }



}

onMounted(() => {
    loadChartData()
})
// 获取公告数据（你可以限制前5条）

const expandedIndex = ref(null);

function toggleNotice(index) {
    expandedIndex.value = expandedIndex.value === index ? null : index;
}
const fetchNotices = async () => {
    loading.value = true;
    try {
        const { rows } = await listNotice({
            pageNum: 1,
            pageSize: 5,
            status: '0' // 只查“正常”状态的公告（若状态字段代表启用）
        });
        noticeList.value = rows || [];
    } catch (e) {
        console.error('获取公告失败', e);
    } finally {
        loading.value = false;
    }
};

// 页面加载时执行
onMounted(() => {
    fetchNotices();
});

function goTarget(url) {
  window.open(url, '__blank')
}
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    ol {
      display: block;
      list-style-type: decimal;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 40px;
    }
  }
}
.notice-list {
  list-style: none;
  padding: 0;
  margin: 0;

  .notice-item {
    border-bottom: 1px solid #eee;
    padding: 10px 0;

    .notice-icon {
      margin-right: 8px;
      color: #409EFF;
      font-size: 16px;
    }

    .notice-title {
      font-weight: 500;
      cursor: pointer;
      color: #333;
    }

    .notice-title.clickable:hover {
      color: #409EFF;
      text-decoration: underline;
    }

    .notice-date {
      float: right;
      color: #999;
      font-size: 12px;
    }

    .notice-content {
      margin-top: 10px;
      color: #666;
      line-height: 1.6;
      font-size: 14px;
    }
  }
}
.dashboard-container {
  padding: 20px;
}
.dashboard-row {
  margin-top: 10px;
  margin-bottom: 10px;
}
h2 {
  border-left: 5px solid #409EFF;
  padding-left: 10px;
  font-weight: bold;
}

</style>

