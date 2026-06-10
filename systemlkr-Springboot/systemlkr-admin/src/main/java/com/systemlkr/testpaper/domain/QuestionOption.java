package com.systemlkr.testpaper.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.systemlkr.common.annotation.Excel;
import com.systemlkr.common.core.domain.BaseEntity;

/**
 * 选择题选项对象 question_option
 * 
 * @author lkr
 * @date 2025-03-08
 */
public class QuestionOption extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 选项ID */
    private Long id;

    /** 所属题目的ID */
    @Excel(name = "所属题目的ID")
    private Long questionId;

    /** 选项标签，如 A/B/C/D */
    @Excel(name = "选项标签，如 A/B/C/D")
    private String optionLabel;

    /** 选项内容 */
    @Excel(name = "选项内容")
    private String optionContent;

    /** 是否为正确选项，1=正确，0=错误 */
    @Excel(name = "是否为正确选项，1=正确，0=错误")
    private Integer isCorrect;

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

    public void setOptionLabel(String optionLabel) 
    {
        this.optionLabel = optionLabel;
    }

    public String getOptionLabel() 
    {
        return optionLabel;
    }

    public void setOptionContent(String optionContent) 
    {
        this.optionContent = optionContent;
    }

    public String getOptionContent() 
    {
        return optionContent;
    }

    public void setIsCorrect(Integer isCorrect) 
    {
        this.isCorrect = isCorrect;
    }

    public Integer getIsCorrect() 
    {
        return isCorrect;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("questionId", getQuestionId())
            .append("optionLabel", getOptionLabel())
            .append("optionContent", getOptionContent())
            .append("isCorrect", getIsCorrect())
            .toString();
    }
}
