package com.systemlkr.testpaper.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.systemlkr.common.annotation.Excel;
import com.systemlkr.common.core.domain.BaseEntity;

/**
 * 知识点对象 knowledge_point
 * 
 * @author lkr
 * @date 2025-03-08
 */
public class KnowledgePoint extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 知识点 */
    private Long id;

    /** 知识点名称，如“树”、“图”、“排序”等 */
    @Excel(name = "知识点名称，如“树”、“图”、“排序”等")
    private String kpName;

    /** 知识点描述或备注 */
    @Excel(name = "知识点描述或备注")
    private String kpDesc;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setKpName(String kpName) 
    {
        this.kpName = kpName;
    }

    public String getKpName() 
    {
        return kpName;
    }

    public void setKpDesc(String kpDesc) 
    {
        this.kpDesc = kpDesc;
    }

    public String getKpDesc() 
    {
        return kpDesc;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("kpName", getKpName())
            .append("kpDesc", getKpDesc())
            .toString();
    }
}
