package com.systemlkr.paper.controller;

import com.systemlkr.common.core.domain.AjaxResult;
import com.systemlkr.paper.domain.PaperGenerateRequest;
import com.systemlkr.paper.domain.RagChatRequest;
import com.systemlkr.paper.service.BaiLianService;
import com.systemlkr.paper.service.RagStreamService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.systemlkr.testpaper.domain.Question;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import com.systemlkr.testpaper.service.impl.QuestionServiceImpl;

import java.util.Map;

@RestController
@RequestMapping("/api/rag")
@RequiredArgsConstructor
public class RagController {

    private final RagStreamService ragStreamService;
    private final ObjectMapper objectMapper;
    private final SimpMessagingTemplate messagingTemplate;
    private final QuestionServiceImpl questionService;
    private final BaiLianService baiLianService;

    /**
     * 结构化出题接口（直接返回完整结果）
     */
    @PostMapping("/generate")
    public AjaxResult generate(@RequestBody Map<String, Object> request) {
        try {
            System.out.println("🎯 收到结构化出题请求：");
            System.out.println(request);

            String prompt = (String) request.get("prompt");
            Object bizParamsObj = request.get("bizParams");

            if (!StringUtils.hasText(prompt)) {
                return AjaxResult.error("提示词不能为空！");
            }
            if (bizParamsObj == null) {
                return AjaxResult.error("业务参数不能为空！");
            }

            // 类型安全地转换
            Map<String, Object> bizParams;
            if (bizParamsObj instanceof Map) {
                bizParams = (Map<String, Object>) bizParamsObj;
            } else {
                throw new RuntimeException("bizParams参数格式错误！");
            }

            System.out.println("📝 最终发送 prompt：" + prompt);
            System.out.println("📝 最终发送 bizParams：" + bizParams);

            String result = ragStreamService.generateOnce(prompt, bizParams);
            return AjaxResult.success(result);
        } catch (Exception e) {
            e.printStackTrace(); // 打印堆栈，方便定位
            return AjaxResult.error("生成题目失败：" + e.getMessage());
        }
    }

    /**
     * WebSocket 聊天接口
     */
    @MessageMapping("/chat")
    public void handleWebSocketChat(RagChatRequest request) {
        if (request.getMessages() == null || request.getMessages().isEmpty()) {
            messagingTemplate.convertAndSend("/topic/reply", "消息不能为空");
            return;
        }

        ragStreamService.streamToWebSocket(
                request.getMessages(),
                request.getBizParams(),
                messagingTemplate
        );
    }

    @PostMapping("/saveGeneratedQuestion")
    public AjaxResult saveGeneratedQuestion(@RequestBody Question question) {
        return AjaxResult.success(questionService.insertQuestion(question));
    }

    @PostMapping("/auto-select")
    public AjaxResult autoSelect(@RequestBody PaperGenerateRequest request) {
        try {
            return baiLianService.generateQuestions(request.getTasks(), request.getPaperTitle());
        } catch (Exception e) {
            return AjaxResult.error("组卷失败：" + e.getMessage());
        }
    }


}
