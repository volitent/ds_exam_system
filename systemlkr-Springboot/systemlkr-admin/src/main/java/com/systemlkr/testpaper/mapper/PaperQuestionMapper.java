package com.systemlkr.testpaper.mapper;

import java.util.List;
import com.systemlkr.testpaper.domain.PaperQuestion;

/**
 * 试卷题目联表Mapper接口
 * 
 * @author lkr
 * @date 2025-03-08
 */
public interface PaperQuestionMapper 
{
    /**
     * 查询试卷题目联表
     * 
     * @param id 试卷题目联表主键
     * @return 试卷题目联表
     */
    public PaperQuestion selectPaperQuestionById(Long id);

    /**
     * 查询试卷题目联表列表
     * 
     * @param paperQuestion 试卷题目联表
     * @return 试卷题目联表集合
     */
    public List<PaperQuestion> selectPaperQuestionList(PaperQuestion paperQuestion);

    /**
     * 新增试卷题目联表
     * 
     * @param paperQuestion 试卷题目联表
     * @return 结果
     */
    public int insertPaperQuestion(PaperQuestion paperQuestion);

    /**
     * 修改试卷题目联表
     * 
     * @param paperQuestion 试卷题目联表
     * @return 结果
     */
    public int updatePaperQuestion(PaperQuestion paperQuestion);

    /**
     * 删除试卷题目联表
     * 
     * @param id 试卷题目联表主键
     * @return 结果
     */
    public int deletePaperQuestionById(Long id);

    /**
     * 批量删除试卷题目联表
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePaperQuestionByIds(Long[] ids);
}
