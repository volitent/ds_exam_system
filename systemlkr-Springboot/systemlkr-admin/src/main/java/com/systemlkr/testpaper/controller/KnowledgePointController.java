package com.systemlkr.testpaper.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.systemlkr.common.annotation.Log;
import com.systemlkr.common.core.controller.BaseController;
import com.systemlkr.common.core.domain.AjaxResult;
import com.systemlkr.common.enums.BusinessType;
import com.systemlkr.testpaper.domain.KnowledgePoint;
import com.systemlkr.testpaper.service.IKnowledgePointService;
import com.systemlkr.common.utils.poi.ExcelUtil;
import com.systemlkr.common.core.page.TableDataInfo;

/**
 * 知识点Controller
 * 
 * @author lkr
 * @date 2025-03-08
 */
@RestController
@RequestMapping("/testpaper/knowledge_point")
public class KnowledgePointController extends BaseController
{
    @Autowired
    private IKnowledgePointService knowledgePointService;

    /**
     * 查询知识点列表
     */
    @PreAuthorize("@ss.hasPermi('testpaper:knowledge_point:list')")
    @GetMapping("/list")
    public TableDataInfo list(KnowledgePoint knowledgePoint)
    {
        startPage();
        List<KnowledgePoint> list = knowledgePointService.selectKnowledgePointList(knowledgePoint);
        return getDataTable(list);
    }

    /**
     * 导出知识点列表
     */
    @PreAuthorize("@ss.hasPermi('testpaper:knowledge_point:export')")
    @Log(title = "知识点", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, KnowledgePoint knowledgePoint)
    {
        List<KnowledgePoint> list = knowledgePointService.selectKnowledgePointList(knowledgePoint);
        ExcelUtil<KnowledgePoint> util = new ExcelUtil<KnowledgePoint>(KnowledgePoint.class);
        util.exportExcel(response, list, "知识点数据");
    }

    /**
     * 获取知识点详细信息
     */
    @PreAuthorize("@ss.hasPermi('testpaper:knowledge_point:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(knowledgePointService.selectKnowledgePointById(id));
    }

    /**
     * 新增知识点
     */
    @PreAuthorize("@ss.hasPermi('testpaper:knowledge_point:add')")
    @Log(title = "知识点", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody KnowledgePoint knowledgePoint)
    {
        return toAjax(knowledgePointService.insertKnowledgePoint(knowledgePoint));
    }

    /**
     * 修改知识点
     */
    @PreAuthorize("@ss.hasPermi('testpaper:knowledge_point:edit')")
    @Log(title = "知识点", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody KnowledgePoint knowledgePoint)
    {
        return toAjax(knowledgePointService.updateKnowledgePoint(knowledgePoint));
    }

    /**
     * 删除知识点
     */
    @PreAuthorize("@ss.hasPermi('testpaper:knowledge_point:remove')")
    @Log(title = "知识点", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(knowledgePointService.deleteKnowledgePointByIds(ids));
    }
}
