package com.systemlkr.paper.service;

import com.systemlkr.common.core.domain.AjaxResult;
import com.systemlkr.paper.domain.QuestionSelectTask;

import java.util.List;

public interface BaiLianService {
    AjaxResult generateQuestions(List<QuestionSelectTask> tasks, String paperTitle);
}
