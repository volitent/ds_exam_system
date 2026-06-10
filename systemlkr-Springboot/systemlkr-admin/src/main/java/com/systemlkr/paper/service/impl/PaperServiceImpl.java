package com.systemlkr.paper.service.impl;

import java.util.List;
import com.systemlkr.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.systemlkr.paper.mapper.PaperMapper;
import com.systemlkr.paper.domain.Paper;
import com.systemlkr.paper.service.IPaperService;

/**
 * 试卷表管理Service业务层处理
 * 
 * @author lkr
 * @date 2025-04-18
 */
@Service
public class PaperServiceImpl implements IPaperService 
{
    @Autowired
    private PaperMapper paperMapper;

    /**
     * 查询试卷表管理
     * 
     * @param id 试卷表管理主键
     * @return 试卷表管理
     */
    @Override
    public Paper selectPaperById(Long id)
    {
        return paperMapper.selectPaperById(id);
    }

    /**
     * 查询试卷表管理列表
     * 
     * @param paper 试卷表管理
     * @return 试卷表管理
     */
    @Override
    public List<Paper> selectPaperList(Paper paper)
    {
        return paperMapper.selectPaperList(paper);
    }

    /**
     * 新增试卷表管理
     * 
     * @param paper 试卷表管理
     * @return 结果
     */
    @Override
    public int insertPaper(Paper paper)
    {
        paper.setCreateTime(DateUtils.getNowDate());
        return paperMapper.insertPaper(paper);
    }

    /**
     * 修改试卷表管理
     * 
     * @param paper 试卷表管理
     * @return 结果
     */
    @Override
    public int updatePaper(Paper paper)
    {
        return paperMapper.updatePaper(paper);
    }

    /**
     * 批量删除试卷表管理
     * 
     * @param ids 需要删除的试卷表管理主键
     * @return 结果
     */
    @Override
    public int deletePaperByIds(Long[] ids)
    {
        return paperMapper.deletePaperByIds(ids);
    }

    /**
     * 删除试卷表管理信息
     * 
     * @param id 试卷表管理主键
     * @return 结果
     */
    @Override
    public int deletePaperById(Long id)
    {
        return paperMapper.deletePaperById(id);
    }
}
