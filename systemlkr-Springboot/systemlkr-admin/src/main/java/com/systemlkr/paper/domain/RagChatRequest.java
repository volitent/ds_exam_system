package com.systemlkr.paper.domain;

import com.alibaba.dashscope.common.Message;
import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
public class RagChatRequest {
    private List<Message> messages;
    private Map<String, Object> bizParams;

    public List<Message> getMessages() {
        return messages;
    }

    public void setMessages(List<Message> messages) {
        this.messages = messages;
    }

    public Map<String, Object> getBizParams() {
        return bizParams;
    }

    public void setBizParams(Map<String, Object> bizParams) {
        this.bizParams = bizParams;
    }
}
