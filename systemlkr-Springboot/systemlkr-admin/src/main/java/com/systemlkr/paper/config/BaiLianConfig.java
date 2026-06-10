package com.systemlkr.paper.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 这部分是组卷的RAG调用
 */
@Data
@Component
@ConfigurationProperties(prefix = "bailian")
public class BaiLianConfig {
    private String apiKey;
    private String appId;
}
