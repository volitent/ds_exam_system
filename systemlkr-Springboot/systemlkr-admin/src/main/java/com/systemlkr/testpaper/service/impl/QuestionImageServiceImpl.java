package com.systemlkr.testpaper.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.systemlkr.testpaper.mapper.QuestionImageMapper;
import com.systemlkr.testpaper.domain.QuestionImage;
import com.systemlkr.testpaper.service.IQuestionImageService;

/**
 * 题目图片Service业务层处理
 * 
 * @author lkr
 * @date 2025-03-15
 */
@Service
public class QuestionImageServiceImpl implements IQuestionImageService 
{
    @Autowired
    private QuestionImageMapper questionImageMapper;

    /**
     * 查询题目图片
     * 
     * @param id 题目图片主键
     * @return 题目图片
     */
    @Override
    public QuestionImage selectQuestionImageById(Long id)
    {
        return questionImageMapper.selectQuestionImageById(id);
    }

    /**
     * 查询题目图片列表
     * 
     * @param questionImage 题目图片
     * @return 题目图片
     */
    @Override
    public List<QuestionImage> selectQuestionImageList(QuestionImage questionImage)
    {
        return questionImageMapper.selectQuestionImageList(questionImage);
    }

    /**
     * 新增题目图片
     * 
     * @param questionImage 题目图片
     * @return 结果
     */
    @Override
    public int insertQuestionImage(QuestionImage questionImage)
    {
        return questionImageMapper.insertQuestionImage(questionImage);
    }

    /**
     * 修改题目图片
     * 
     * @param questionImage 题目图片
     * @return 结果
     */
    @Override
    public int updateQuestionImage(QuestionImage questionImage)
    {
        return questionImageMapper.updateQuestionImage(questionImage);
    }

    /**
     * 批量删除题目图片
     * 
     * @param ids 需要删除的题目图片主键
     * @return 结果
     */
    @Override
    public int deleteQuestionImageByIds(Long[] ids)
    {
        return questionImageMapper.deleteQuestionImageByIds(ids);
    }

    /**
     * 删除题目图片信息
     * 
     * @param id 题目图片主键
     * @return 结果
     */
    @Override
    public int deleteQuestionImageById(Long id)
    {
        return questionImageMapper.deleteQuestionImageById(id);
    }

    @Override
    public int deleteQuestionImageByQuestionId(Long questionId)
    {
        return questionImageMapper.deleteQuestionImageByQuestionId(questionId);
    }
}
