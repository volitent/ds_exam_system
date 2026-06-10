package com.systemlkr.testpaper.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.systemlkr.common.annotation.Excel;
import com.systemlkr.common.core.domain.BaseEntity;

/**
 * 题目图片对象 question_image
 * 
 * @author lkr
 * @date 2025-03-15
 */
public class QuestionImage extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 关联题目ID */
    @Excel(name = "关联题目ID")
    private Long questionId;

    /** 图片路径或URL */
    @Excel(name = "图片路径或URL")
    private String imagePath;

    /** 1-对应题目，0-对应答案 */
    @Excel(name = "1-对应题目，0-对应答案")
    private Long type;

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

    public void setImagePath(String imagePath) 
    {
        this.imagePath = imagePath;
    }

    public String getImagePath() 
    {
        return imagePath;
    }

    public void setType(Long type) 
    {
        this.type = type;
    }

    public Long getType() 
    {
        return type;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("questionId", getQuestionId())
            .append("imagePath", getImagePath())
            .append("type", getType())
            .toString();
    }
}
