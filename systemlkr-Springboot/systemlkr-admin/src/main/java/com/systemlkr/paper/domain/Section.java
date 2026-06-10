package com.systemlkr.paper.domain;

import com.systemlkr.testpaper.domain.Question;
import lombok.Data;

import java.util.List;

@Data
public class Section {
    private String type;
    private String title;
    private List<Question> questions;
}
