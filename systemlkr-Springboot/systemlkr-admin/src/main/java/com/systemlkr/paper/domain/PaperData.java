package com.systemlkr.paper.domain;

import lombok.Data;

import java.util.List;

@Data
public class PaperData {
    private String paperTitle;
    private Integer totalScore;
    private Integer duration;
    private List<Section> sections;
}
