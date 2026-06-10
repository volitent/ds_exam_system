package com.systemlkr.paper.service;
import com.systemlkr.testpaper.service.impl.QuestionServiceImpl;
import com.alibaba.dashscope.app.*;
import com.alibaba.dashscope.common.Message;
import com.alibaba.dashscope.exception.ApiException;
import com.alibaba.dashscope.exception.InputRequiredException;
import com.alibaba.dashscope.exception.NoApiKeyException;
import io.reactivex.Flowable;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import com.alibaba.dashscope.utils.JsonUtils;
import org.springframework.util.StringUtils;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class RagStreamService {

    @Value("${dashscope.api.key}")
    private String apiKey;

    @Value("${dashscope.app.id1}")
    private String appId;

    @Value("${dashscope.app.id2}")
    private String appId2;

    private final QuestionServiceImpl questionService;
    private final ObjectMapper objectMapper;


    private void checkConfig() {
        if (!StringUtils.hasText(apiKey)) {
            throw new RuntimeException("未配置阿里云百炼API Key");
        }
        if (!StringUtils.hasText(appId)) {
            throw new RuntimeException("未配置阿里云百炼应用ID");
        }
    }

    public void streamToWebSocket(List<Message> messages,
                                  Map<String, Object> bizParams,
                                  SimpMessagingTemplate messagingTemplate) {
        try {
            checkConfig();

            String bizParamStr = JsonUtils.toJson(bizParams);
            ApplicationParam param = ApplicationParam.builder()
                    .apiKey(apiKey)
                    .appId(appId)
                    .messages(messages)
                    .bizParams(JsonUtils.parse(bizParamStr))
                    .incrementalOutput(true)
                    .build();

            Application application = new Application();
            Flowable<ApplicationResult> stream = application.streamCall(param);

            stream.blockingForEach(data -> {
                String output = data.getOutput().getText();
                // 推送到前端指定 topic
                messagingTemplate.convertAndSend("/topic/reply", output);
            });

            // 可选推送 done 消息
            messagingTemplate.convertAndSend("/topic/reply", "[DONE]");
        } catch (Exception e) {
            messagingTemplate.convertAndSend("/topic/reply", "[ERROR] " + e.getMessage());
        }
    }


    /**
     * 一次性调用大模型接口用于结构化出题（非流式）
     *
     * @param prompt 指令内容
     * @param bizParams 模型变量参数
     * @return 模型返回的完整文本
     */
    public String generateOnce(String prompt, Map<String, Object> bizParams) {
        try {
            checkConfig();
            
            String bizParamStr = JsonUtils.toJson(bizParams);
            ApplicationParam param = ApplicationParam.builder()
                    .apiKey(apiKey)
                    .appId(appId)
                    .prompt(prompt)
                    .bizParams(JsonUtils.parse(bizParamStr))
                    .build();

            Application application = new Application();
            ApplicationResult result = application.call(param);
            return result.getOutput().getText();
        } catch (ApiException | NoApiKeyException | InputRequiredException e) {
            throw new RuntimeException("调用大模型服务失败：" + e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("生成题目失败：" + e.getMessage());
        }
    }


}
