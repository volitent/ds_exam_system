package com.systemlkr.testpaper.mapper;

import java.util.List;
import com.systemlkr.testpaper.domain.Question;
import org.apache.ibatis.annotations.Param;

/**
 * 问题表Mapper接口
 * 
 * @author lkr
 * @date 2025-03-08
 */
public interface QuestionMapper
{
    /**
     * 查找所有的问题
     * @return
     */
    public List<Question> selectQuestionVo();

    /**
     * 联表查找所有的问题
     * @return
     */
    public List<Question> selectQuestionAll();


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
     * 删除问题表
     * 
     * @param id 问题表主键
     * @return 结果
     */
    public int deleteQuestionById(Long id);

    /**
     * 批量删除问题表
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteQuestionByIds(Long[] ids);

    List<Question> selectQuestionDetailByIds(@Param("ids") List<Long> ids);

    List<Question> selectQuestionListWithDetail(Question question);

    List<Question> selectQuestionListBase(Question question);

    List<Question> selectQuestionSubList(List<Long> ids);

    List<Question> selectByKnowledgeTypeScore(@Param("kpName") String kpName,
                                              @Param("questionType") String questionType,
                                              @Param("limit") Integer limit);
}
