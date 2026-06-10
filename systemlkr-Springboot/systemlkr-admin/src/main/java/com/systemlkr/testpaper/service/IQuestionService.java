package com.systemlkr.testpaper.service;

import java.util.List;
import com.systemlkr.testpaper.domain.Question;

/**
 * 问题表Service接口
 * 
 * @author lkr
 * @date 2025-03-08
 */
public interface IQuestionService 
{
    /**
     * 查询问题表
     * 
     * @param id 问题表主键
     * @return 问题表
     */
    public Question selectQuestionById(Long id);

    /**
     * 查询问题表列表
     * 
     * @param question 问题表
     * @return 问题表集合
     */
    public List<Question> selectQuestionList(Question question);

    /**
     * 新增问题表
     * 
     * @param question 问题表
     * @return 结果
     */
    public int insertQuestion(Question question);

    /**
     * 修改问题表
     * 
     * @param question 问题表
     * @return 结果
     */
    public int updateQuestion(Question question);

    /**
     * 批量删除问题表
     * 
     * @param ids 需要删除的问题表主键集合
     * @return 结果
     */
    public int deleteQuestionByIds(Long[] ids);

    /**
     * 删除问题表信息
     * 
     * @param id 问题表主键
     * @return 结果
     */
    public int deleteQuestionById(Long id);

    List<Question> selectQuestionDetailByIds(List<Long> ids);

    List<Question> selectQuestionListWithDetail(Question question);

    /**
     * 只查询主表（用于分页）
     */
    List<Question> selectQuestionListBase(Question question);

    /**
     * 组装子表数据（选项、知识点、图片）
     */
    void assembleSubTables(List<Question> questionList);

    List<Question> selectByKnowledgeTypeScore(String kpName, String questionType, Integer limit);

}
