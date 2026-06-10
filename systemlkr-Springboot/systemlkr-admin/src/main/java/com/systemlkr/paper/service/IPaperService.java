package com.systemlkr.paper.service;

import java.util.List;
import com.systemlkr.paper.domain.Paper;

/**
 * 试卷表管理Service接口
 * 
 * @author lkr
 * @date 2025-04-18
 */
public interface IPaperService 
{
    /**
     * 查询试卷表管理
     * 
     * @param id 试卷表管理主键
     * @return 试卷表管理
     */
    public Paper selectPaperById(Long id);

    /**
     * 查询试卷表管理列表
     * 
     * @param paper 试卷表管理
     * @return 试卷表管理集合
     */
    public List<Paper> selectPaperList(Paper paper);

    /**
     * 新增试卷表管理
     * 
     * @param paper 试卷表管理
     * @return 结果
     */
    public int insertPaper(Paper paper);

    /**
     * 修改试卷表管理
     * 
     * @param paper 试卷表管理
     * @return 结果
     */
    public int updatePaper(Paper paper);

    /**
     * 批量删除试卷表管理
     * 
     * @param ids 需要删除的试卷表管理主键集合
     * @return 结果
     */
    public int deletePaperByIds(Long[] ids);

    /**
     * 删除试卷表管理信息
     * 
     * @param id 试卷表管理主键
     * @return 结果
     */
    public int deletePaperById(Long id);
}
