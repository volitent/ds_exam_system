package com.systemlkr.testpaper.mapper;

import java.util.List;
import com.systemlkr.testpaper.domain.QuestionOption;

/**
 * 选择题选项Mapper接口
 * 
 * @author lkr
 * @date 2025-03-08
 */
public interface QuestionOptionMapper 
{
    /**
     * 查询选择题选项
     * 
     * @param id 选择题选项主键
     * @return 选择题选项
     */
    public QuestionOption selectQuestionOptionById(Long id);

    /**
     * 查询选择题选项列表
     * 
     * @param questionOption 选择题选项
     * @return 选择题选项集合
     */
    public List<QuestionOption> selectQuestionOptionList(QuestionOption questionOption);

    /**
     * 新增选择题选项
     * 
     * @param questionOption 选择题选项
     * @return 结果
     */
    public int insertQuestionOption(QuestionOption questionOption);

    /**
     * 修改选择题选项
     * 
     * @param questionOption 选择题选项
     * @return 结果
     */
    public int updateQuestionOption(QuestionOption questionOption);

    /**
     * 删除选择题选项
     * 
     * @param id 选择题选项主键
     * @return 结果
     */
    public int deleteQuestionOptionById(Long id);

    /**
     * 批量删除选择题选项
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteQuestionOptionByIds(Long[] ids);

    /**
     * 根据问题id删除选择题选项
     * @param questionId
     * @return
     */

    public int deleteQuestionOptionByQuestionId(Long questionId);
}
