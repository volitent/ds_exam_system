package com.systemlkr.testpaper.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.systemlkr.testpaper.mapper.PaperQuestionMapper;
import com.systemlkr.testpaper.domain.PaperQuestion;
import com.systemlkr.testpaper.service.IPaperQuestionService;

/**
 * 试卷题目联表Service业务层处理
 * 
 * @author lkr
 * @date 2025-03-08
 */
@Service
public class PaperQuestionServiceImpl implements IPaperQuestionService 
{
    @Autowired
    private PaperQuestionMapper paperQuestionMapper;

    /**
     * 查询试卷题目联表
     * 
     * @param id 试卷题目联表主键
     * @return 试卷题目联表
     */
    @Override
    public PaperQuestion selectPaperQuestionById(Long id)
    {
        return paperQuestionMapper.selectPaperQuestionById(id);
    }

    /**
     * 查询试卷题目联表列表
     * 
     * @param paperQuestion 试卷题目联表
     * @return 试卷题目联表
     */
    @Override
    public List<PaperQuestion> selectPaperQuestionList(PaperQuestion paperQuestion)
    {
        return paperQuestionMapper.selectPaperQuestionList(paperQuestion);
    }

    /**
     * 新增试卷题目联表
     * 
     * @param paperQuestion 试卷题目联表
     * @return 结果
     */
    @Override
    public int insertPaperQuestion(PaperQuestion paperQuestion)
    {
        return paperQuestionMapper.insertPaperQuestion(paperQuestion);
    }

    /**
     * 修改试卷题目联表
     * 
     * @param paperQuestion 试卷题目联表
     * @return 结果
     */
    @Override
    public int updatePaperQuestion(PaperQuestion paperQuestion)
    {
        return paperQuestionMapper.updatePaperQuestion(paperQuestion);
    }

    /**
     * 批量删除试卷题目联表
     * 
     * @param ids 需要删除的试卷题目联表主键
     * @return 结果
     */
    @Override
    public int deletePaperQuestionByIds(Long[] ids)
    {
        return paperQuestionMapper.deletePaperQuestionByIds(ids);
    }

    /**
     * 删除试卷题目联表信息
     * 
     * @param id 试卷题目联表主键
     * @return 结果
     */
    @Override
    public int deletePaperQuestionById(Long id)
    {
        return paperQuestionMapper.deletePaperQuestionById(id);
    }
}
