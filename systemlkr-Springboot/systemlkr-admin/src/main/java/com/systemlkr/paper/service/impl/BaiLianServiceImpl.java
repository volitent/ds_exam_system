package com.systemlkr.paper.service.impl;

import com.alibaba.dashscope.app.Application;
import com.alibaba.dashscope.app.ApplicationParam;
import com.alibaba.dashscope.app.ApplicationResult;
import com.alibaba.dashscope.exception.ApiException;
import com.alibaba.dashscope.exception.InputRequiredException;
import com.alibaba.dashscope.exception.NoApiKeyException;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.systemlkr.common.core.domain.AjaxResult;
import com.systemlkr.paper.config.BaiLianConfig;
import com.systemlkr.paper.domain.PaperData;
import com.systemlkr.paper.domain.QuestionSelectTask;
import com.systemlkr.paper.service.BaiLianService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class BaiLianServiceImpl implements BaiLianService {

    @Autowired
    private BaiLianConfig baiLianConfig;

    private static final Gson gson = new Gson();

    @Override
    public AjaxResult generateQuestions(List<QuestionSelectTask> tasks, String paperTitle) {
        log.info("【组卷请求】收到任务数量: {}", tasks.size());

        if (tasks == null || tasks.isEmpty()) {
            return AjaxResult.error("任务列表不能为空");
        }

        String prompt = "请根据 tasks 参数智能试卷及答案，返回纯 JSON，严格按照 System Prompt 执行。";

        Map<String, Object> bizParams = Map.of(
                "paperTitle", paperTitle,
                "tasks", tasks
        );

        String rawOutput = generateOnce(prompt, bizParams);
        log.info("【模型原始输出】{}", rawOutput);

        String cleanedOutput = cleanMarkdownJson(rawOutput);
        cleanedOutput = unescapeUnicodeHtmlEntities(cleanedOutput);
        log.info("【清洗后 JSON】{}", cleanedOutput);

        PaperData paper = extractPaperFromJson(cleanedOutput);
        if (paper == null) {
            return AjaxResult.error("模型未返回有效 JSON 结构");
        }

        return AjaxResult.success(paper);
    }

    public String generateOnce(String prompt, Map<String, Object> bizParams) {
        try {
            JsonObject gsonObj = gson.toJsonTree(bizParams).getAsJsonObject();
            ApplicationParam param = ApplicationParam.builder()
                    .apiKey(baiLianConfig.getApiKey())
                    .appId(baiLianConfig.getAppId())
                    .prompt(prompt)
                    .bizParams(gsonObj)
                    .build();

            Application application = new Application();
            ApplicationResult result = application.call(param);
            return result.getOutput().getText();
        } catch (ApiException | NoApiKeyException | InputRequiredException e) {
            throw new RuntimeException("调用大模型服务失败：" + e.getMessage(), e);
        } catch (Exception e) {
            throw new RuntimeException("生成题目失败：" + e.getMessage(), e);
        }
    }

    private PaperData extractPaperFromJson(String text) {
        try {
            JsonParser.parseString(text); // 校验合法性
            return gson.fromJson(text, PaperData.class);
        } catch (Exception e) {
            log.error("❌ 无法解析试卷 JSON：{}", e.getMessage(), e);
            return null;
        }
    }

    private static String cleanMarkdownJson(String rawText) {
        if (rawText == null) return "";
        if (!rawText.contains("```")) return rawText;
        return rawText
                .replaceAll("(?s)```json\\s*(\\{.*?\\})\\s*```", "$1")
                .replaceAll("(?s)```\\s*(\\{.*?\\})\\s*```", "$1");
    }

    private static String unescapeUnicodeHtmlEntities(String text) {
        if (text == null) return null;
        return text
                .replace("\\u003d", "=")
                .replace("\\u003c", "<")
                .replace("\\u003e", ">")
                .replace("\\u0026", "&");
    }
}
