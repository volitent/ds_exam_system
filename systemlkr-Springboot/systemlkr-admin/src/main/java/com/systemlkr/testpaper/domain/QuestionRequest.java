package com.systemlkr.testpaper.domain;

import java.util.List;

public class QuestionRequest {
    private String kpName;
    private String questionType;
    private Integer score;
    private Integer limit;

    // Getters and Setters
    public String getKpName() {
        return kpName;
    }

    public void setKpName(String kpName) {
        this.kpName = kpName;
    }

    public String getQuestionType() {
        return questionType;
    }

    public void setQuestionType(String questionType) {
        this.questionType = questionType;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    @Override
    public String toString() {
        return "QuestionRequest{" +
                "kpName='" + kpName + '\'' +
                ", questionType='" + questionType + '\'' +
                ", score=" + score +
                ", limit=" + limit +
                '}';
    }
}