package com.systemlkr.testpaper.service;

import java.util.List;
import com.systemlkr.testpaper.domain.QuestionImage;

/**
 * 题目图片Service接口
 * 
 * @author lkr
 * @date 2025-03-15
 */
public interface IQuestionImageService 
{
    /**
     * 查询题目图片
     * 
     * @param id 题目图片主键
     * @return 题目图片
     */
    public QuestionImage selectQuestionImageById(Long id);

    /**
     * 查询题目图片列表
     * 
     * @param questionImage 题目图片
     * @return 题目图片集合
     */
    public List<QuestionImage> selectQuestionImageList(QuestionImage questionImage);

    /**
     * 新增题目图片
     * 
     * @param questionImage 题目图片
     * @return 结果
     */
    public int insertQuestionImage(QuestionImage questionImage);

    /**
     * 修改题目图片
     * 
     * @param questionImage 题目图片
     * @return 结果
     */
    public int updateQuestionImage(QuestionImage questionImage);

    /**
     * 批量删除题目图片
     * 
     * @param ids 需要删除的题目图片主键集合
     * @return 结果
     */
    public int deleteQuestionImageByIds(Long[] ids);

    /**
     * 删除题目图片信息
     * 
     * @param id 题目图片主键
     * @return 结果
     */
    public int deleteQuestionImageById(Long id);

    int deleteQuestionImageByQuestionId(Long questionId);
}
