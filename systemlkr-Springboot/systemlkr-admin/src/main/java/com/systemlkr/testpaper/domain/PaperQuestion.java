package com.systemlkr.testpaper.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.systemlkr.common.annotation.Excel;
import com.systemlkr.common.core.domain.BaseEntity;

/**
 * 试卷题目联表对象 paper_question
 * 
 * @author lkr
 * @date 2025-03-08
 */
public class PaperQuestion extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 关联ID */
    private Long id;

    /** 试卷ID */
    @Excel(name = "试卷ID")
    private Long paperId;

    /** 题目ID */
    @Excel(name = "题目ID")
    private Long questionId;

    /** 该题在本试卷中的分值 */
    @Excel(name = "该题在本试卷中的分值")
    private Long questionScore;

    /** 题目在试卷中的排列顺序 */
    @Excel(name = "题目在试卷中的排列顺序")
    private Long sortOrder;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setPaperId(Long paperId) 
    {
        this.paperId = paperId;
    }

    public Long getPaperId() 
    {
        return paperId;
    }

    public void setQuestionId(Long questionId) 
    {
        this.questionId = questionId;
    }

    public Long getQuestionId() 
    {
        return questionId;
    }

    public void setQuestionScore(Long questionScore) 
    {
        this.questionScore = questionScore;
    }

    public Long getQuestionScore() 
    {
        return questionScore;
    }

    public void setSortOrder(Long sortOrder) 
    {
        this.sortOrder = sortOrder;
    }

    public Long getSortOrder() 
    {
        return sortOrder;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("paperId", getPaperId())
            .append("questionId", getQuestionId())
            .append("questionScore", getQuestionScore())
            .append("sortOrder", getSortOrder())
            .toString();
    }
}
