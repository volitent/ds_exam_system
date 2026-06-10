package com.systemlkr.paper.tools;

import com.google.gson.Gson;
import com.google.gson.JsonParser;
import com.systemlkr.paper.domain.PaperData;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class JsonMultiPaperExtractor {

    public static PaperData extractSinglePaper(String text) {
        try {
            // 可选：处理 unicode 转义字符（如 \u003d -> =）
            String normalized = unescapeUnicodeHtmlEntities(text);

            // 校验是否为合法 JSON
            JsonParser.parseString(normalized); // 如果非法会抛异常

            return new Gson().fromJson(normalized, PaperData.class); // ✅ 使用 Gson 替代 fastjson2
        } catch (Exception e) {
            log.error("❌ 无法解析试卷 JSON：{}", e.getMessage(), e);
            return null;
        }
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
