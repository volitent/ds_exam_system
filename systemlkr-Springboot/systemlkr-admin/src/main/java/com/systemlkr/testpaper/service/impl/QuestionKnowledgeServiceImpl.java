package com.systemlkr.testpaper.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.systemlkr.testpaper.mapper.QuestionKnowledgeMapper;
import com.systemlkr.testpaper.domain.QuestionKnowledge;
import com.systemlkr.testpaper.service.IQuestionKnowledgeService;

/**
 * 知识点题目关联表Service业务层处理
 * 
 * @author lkr
 * @date 2025-03-08
 */
@Service
public class QuestionKnowledgeServiceImpl implements IQuestionKnowledgeService 
{
    @Autowired
    private QuestionKnowledgeMapper questionKnowledgeMapper;

    /**
     * 查询知识点题目关联表
     * 
     * @param id 知识点题目关联表主键
     * @return 知识点题目关联表
     */
    @Override
    public QuestionKnowledge selectQuestionKnowledgeById(Long id)
    {
        return questionKnowledgeMapper.selectQuestionKnowledgeById(id);
    }

    /**
     * 查询知识点题目关联表列表
     * 
     * @param questionKnowledge 知识点题目关联表
     * @return 知识点题目关联表
     */
    @Override
    public List<QuestionKnowledge> selectQuestionKnowledgeList(QuestionKnowledge questionKnowledge)
    {
        return questionKnowledgeMapper.selectQuestionKnowledgeList(questionKnowledge);
    }

    /**
     * 新增知识点题目关联表
     * 
     * @param questionKnowledge 知识点题目关联表
     * @return 结果
     */
    @Override
    public int insertQuestionKnowledge(QuestionKnowledge questionKnowledge)
    {
        return questionKnowledgeMapper.insertQuestionKnowledge(questionKnowledge);
    }

    /**
     * 修改知识点题目关联表
     * 
     * @param questionKnowledge 知识点题目关联表
     * @return 结果
     */
    @Override
    public int updateQuestionKnowledge(QuestionKnowledge questionKnowledge)
    {
        return questionKnowledgeMapper.updateQuestionKnowledge(questionKnowledge);
    }

    /**
     * 批量删除知识点题目关联表
     * 
     * @param ids 需要删除的知识点题目关联表主键
     * @return 结果
     */
    @Override
    public int deleteQuestionKnowledgeByIds(Long[] ids)
    {
        return questionKnowledgeMapper.deleteQuestionKnowledgeByIds(ids);
    }

    /**
     * 删除知识点题目关联表信息
     * 
     * @param id 知识点题目关联表主键
     * @return 结果
     */
    @Override
    public int deleteQuestionKnowledgeById(Long id)
    {
        return questionKnowledgeMapper.deleteQuestionKnowledgeById(id);
    }

    /**
     * 根据问题id删除知识点题目关联表信息
     * @param questionId
     * @return
     */
    @Override
    public int deleteQuestionKnowledgeByQuestionId(Long questionId)
    {
        return questionKnowledgeMapper.deleteQuestionKnowledgeByQuestionId(questionId);
    }
}
