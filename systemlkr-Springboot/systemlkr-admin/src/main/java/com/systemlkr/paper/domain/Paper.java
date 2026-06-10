package com.systemlkr.paper.domain;

import com.systemlkr.common.annotation.Excel;
import com.systemlkr.common.core.domain.BaseEntity;

/**
 * 试卷表管理对象 paper
 * 
 * @author lkr
 * @date 2025-04-18
 */
public class Paper extends BaseEntity
{
    private static final long serialVersionUID = 1L;
    private String creatorName; // 创建者昵称

    /** 试卷ID */
    private Long id;

    /** 试卷名称 */
    @Excel(name = "试卷名称")
    private String paperName;

    /** 创建者ID，可关联 user(id) */
    @Excel(name = "创建者ID，可关联 user(id)")
    private Long creatorId;

    /** 该试卷的总分（可动态计算，也可存固定值） */
    @Excel(name = "该试卷的总分", readConverterExp = "可=动态计算，也可存固定值")
    private Long totalScore;

    /** 备注或考试说明 */
    @Excel(name = "备注或考试说明")
    private String remarks;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setPaperName(String paperName) 
    {
        this.paperName = paperName;
    }

    public String getPaperName() 
    {
        return paperName;
    }

    public void setCreatorId(Long creatorId) 
    {
        this.creatorId = creatorId;
    }

    public Long getCreatorId() 
    {
        return creatorId;
    }

    public void setTotalScore(Long totalScore) 
    {
        this.totalScore = totalScore;
    }

    public Long getTotalScore() 
    {
        return totalScore;
    }

    public void setRemarks(String remarks) 
    {
        this.remarks = remarks;
    }

    public String getRemarks() 
    {
        return remarks;
    }

    public String getCreatorName() {
        return creatorName;
    }

    public void setCreatorName(String creatorName) {
        this.creatorName = creatorName;
    }

    @Override
    public String toString() {
        return "Paper{" +
                "creatorName='" + creatorName + '\'' +
                ", id=" + id +
                ", paperName='" + paperName + '\'' +
                ", creatorId=" + creatorId +
                ", totalScore=" + totalScore +
                ", remarks='" + remarks + '\'' +
                '}';
    }
}
