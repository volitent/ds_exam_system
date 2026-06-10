package com.systemlkr.paper.domain;

import lombok.Data;

@Data
public class QuestionSelectTask {
    private String kpName;
    private String questionType;
    private Integer score;
    private Integer limit;
}
