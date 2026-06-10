package com.systemlkr.testpaper.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.systemlkr.testpaper.mapper.QuestionOptionMapper;
import com.systemlkr.testpaper.domain.QuestionOption;
import com.systemlkr.testpaper.service.IQuestionOptionService;

/**
 * 选择题选项Service业务层处理
 * 
 * @author lkr
 * @date 2025-03-08
 */
@Service
public class QuestionOptionServiceImpl implements IQuestionOptionService 
{
    @Autowired
    private QuestionOptionMapper questionOptionMapper;

    /**
     * 查询选择题选项
     * 
     * @param id 选择题选项主键
     * @return 选择题选项
     */
    @Override
    public QuestionOption selectQuestionOptionById(Long id)
    {
        return questionOptionMapper.selectQuestionOptionById(id);
    }

    /**
     * 查询选择题选项列表
     * 
     * @param questionOption 选择题选项
     * @return 选择题选项
     */
    @Override
    public List<QuestionOption> selectQuestionOptionList(QuestionOption questionOption)
    {
        return questionOptionMapper.selectQuestionOptionList(questionOption);
    }

    /**
     * 新增选择题选项
     * 
     * @param questionOption 选择题选项
     * @return 结果
     */
    @Override
    public int insertQuestionOption(QuestionOption questionOption)
    {
        return questionOptionMapper.insertQuestionOption(questionOption);
    }

    /**
     * 修改选择题选项
     * 
     * @param questionOption 选择题选项
     * @return 结果
     */
    @Override
    public int updateQuestionOption(QuestionOption questionOption)
    {
        return questionOptionMapper.updateQuestionOption(questionOption);
    }

    /**
     * 批量删除选择题选项
     * 
     * @param ids 需要删除的选择题选项主键
     * @return 结果
     */
    @Override
    public int deleteQuestionOptionByIds(Long[] ids)
    {
        return questionOptionMapper.deleteQuestionOptionByIds(ids);
    }

    /**
     * 删除选择题选项信息
     * 
     * @param id 选择题选项主键
     * @return 结果
     */
    @Override
    public int deleteQuestionOptionById(Long id)
    {
        return questionOptionMapper.deleteQuestionOptionById(id);
    }


    /**
     * 根据问题id删除选择题选项
     * @param questionId
     * @return
     */
    @Override
    public int deleteQuestionOptionByQuestionId(Long questionId) {
        return questionOptionMapper.deleteQuestionOptionByQuestionId(questionId);
    }


}
