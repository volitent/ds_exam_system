package com.systemlkr.paper.domain;

import lombok.Data;

import java.util.List;

@Data
public class PaperGenerateRequest {
    private String paperTitle;
    private List<QuestionSelectTask> tasks;
}
