package com.systemlkr.testpaper.mapper;

import java.util.List;
import com.systemlkr.testpaper.domain.QuestionKnowledge;

/**
 * 知识点题目关联表Mapper接口
 * 
 * @author lkr
 * @date 2025-03-08
 */
public interface QuestionKnowledgeMapper 
{
    /**
     * 查询知识点题目关联表
     * 
     * @param id 知识点题目关联表主键
     * @return 知识点题目关联表
     */
    public QuestionKnowledge selectQuestionKnowledgeById(Long id);

    /**
     * 查询知识点题目关联表列表
     * 
     * @param questionKnowledge 知识点题目关联表
     * @return 知识点题目关联表集合
     */
    public List<QuestionKnowledge> selectQuestionKnowledgeList(QuestionKnowledge questionKnowledge);

    /**
     * 新增知识点题目关联表
     * 
     * @param questionKnowledge 知识点题目关联表
     * @return 结果
     */
    public int insertQuestionKnowledge(QuestionKnowledge questionKnowledge);

    /**
     * 修改知识点题目关联表
     * 
     * @param questionKnowledge 知识点题目关联表
     * @return 结果
     */
    public int updateQuestionKnowledge(QuestionKnowledge questionKnowledge);

    /**
     * 删除知识点题目关联表
     * 
     * @param id 知识点题目关联表主键
     * @return 结果
     */
    public int deleteQuestionKnowledgeById(Long id);

    /**
     * 批量删除知识点题目关联表
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteQuestionKnowledgeByIds(Long[] ids);

    /**
     * 根据题目id删除知识点题目关联表
     * @param questionId
     * @return
     */
    public int deleteQuestionKnowledgeByQuestionId(Long questionId);
}
