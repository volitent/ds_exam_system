package com.systemlkr.testpaper.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.systemlkr.common.annotation.Excel;
import com.systemlkr.common.core.domain.BaseEntity;

/**
 * 知识点题目关联表对象 question_knowledge
 * 
 * @author lkr
 * @date 2025-03-08
 */
public class QuestionKnowledge extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 题目id */
    @Excel(name = "题目id")
    private Long questionId;

    /** 知识点id */
    @Excel(name = "知识点id")
    private Long kpId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setQuestionId(Long questionId) 
    {
        this.questionId = questionId;
    }

    public Long getQuestionId() 
    {
        return questionId;
    }

    public void setKpId(Long kpId) 
    {
        this.kpId = kpId;
    }

    public Long getKpId() 
    {
        return kpId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("questionId", getQuestionId())
            .append("kpId", getKpId())
            .toString();
    }
}
