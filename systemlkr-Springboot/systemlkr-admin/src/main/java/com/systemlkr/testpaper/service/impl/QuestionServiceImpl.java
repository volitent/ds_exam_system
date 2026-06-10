package com.systemlkr.testpaper.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.systemlkr.common.utils.DateUtils;
import com.systemlkr.common.utils.SecurityUtils;
import com.systemlkr.testpaper.domain.*;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.systemlkr.testpaper.mapper.*;
import com.systemlkr.testpaper.service.IQuestionService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 问题表Service业务层处理
 * 
 * @author lkr
 * @date 2025-03-08
 */
@Service
public class QuestionServiceImpl implements IQuestionService 
{
    @Autowired
    private QuestionMapper questionMapper;

    @Autowired
    private QuestionOptionMapper questionOptionMapper;

    @Autowired
    private KnowledgePointMapper knowledgePointMapper;

    @Autowired
    private QuestionKnowledgeMapper questionKnowledgeMapper;

    @Autowired
    private QuestionImageMapper questionImageMapper;

    /**
     * 查询问题表
     * 
     * @param id 问题表主键
     * @return 问题表
     */
    @Override
    public Question selectQuestionById(Long id)
    {
        return questionMapper.selectQuestionById(id);
    }

    /**
     * 查询问题表列表
     * 
     * @param question 问题表
     * @return 问题表
     */
    @Override
    public List<Question> selectQuestionList(Question question)
    {
        return questionMapper.selectQuestionList(question);
    }

    /**
     * 新增问题表
     * 
     * @param question 问题表
     * @return 结果
     */
    /**
     * 新增问题表 + 同时插入选项、知识点、图片等
     */
    @Override
    @Transactional // 开启事务
    public int insertQuestion(Question question)
    {
        Long userId = SecurityUtils.getUserId();
        question.setCreatorId(userId); // 把当前登录用户ID设置给创建者ID

        // 1) 先插入 question 本身
        question.setCreateTime(DateUtils.getNowDate());
        int rows = questionMapper.insertQuestion(question);
        Long questionId = question.getId();  // MyBatis自动回填自增ID

        // 2) 如果是选择题，或有选项列表，则插入 question_option
        List<QuestionOption> optionList = question.getOptionList();
        if (optionList != null && !optionList.isEmpty()) {
            for (QuestionOption option : optionList) {
                option.setQuestionId(questionId);
                questionOptionMapper.insertQuestionOption(option);
            }
        }

        // 3) 处理知识点
        //    例如 question.getKnowledgePoints() = ["世界地理", "基本常识"] ...
        List<String> kpNames = question.getKnowledgePoints();
        if (kpNames != null && !kpNames.isEmpty()) {
            for (String kpName : kpNames) {
                if (kpName == null || kpName.trim().isEmpty()) {
                    continue;
                }
                // 3.1) 先检查该知识点是否存在
                KnowledgePoint existKp = knowledgePointMapper.selectKnowledgePointByName(kpName);
                if (existKp == null) {
                    // 不存在则插入
                    existKp = new KnowledgePoint();
                    existKp.setKpName(kpName);
                    // 也可设置 existKp.setKpDesc(...) 等更多信息
                    knowledgePointMapper.insertKnowledgePoint(existKp);
                }
                // 3.2) 建立关联 question_knowledge
                QuestionKnowledge qk = new QuestionKnowledge();
                qk.setQuestionId(questionId);
                qk.setKpId(existKp.getId());
                questionKnowledgeMapper.insertQuestionKnowledge(qk);
            }
        }

        // 4) 如果有图片列表，插入 question_image
        if (question.getImageList() != null) {
            for (QuestionImage img : question.getImageList()) {
                img.setQuestionId(questionId);
                // 这里必须调用对应的 Mapper 插入
                questionImageMapper.insertQuestionImage(img);
            }
        }

        // 如果某一步出现 RuntimeException 或抛出异常，事务会回滚
        return rows;
    }
    /**
     * 修改问题表
     * 
     * @param question 问题表
     * @return 结果
     */
    @Override
    @Transactional
    public int updateQuestion(Question question) {
        // 1) 先更新 question 本身
        question.setUpdateTime(DateUtils.getNowDate());
        int rows = questionMapper.updateQuestion(question);
        Long questionId = question.getId();  // 前端必须传回要更新的 questionId

        // 2) 更新选项 question_option
        //    通常做法：先删后插
        //    (若你想做更细粒度的“改/增/删”，需自行编写相应逻辑)
        questionOptionMapper.deleteQuestionOptionByQuestionId(questionId);
        List<QuestionOption> optionList = question.getOptionList();
        if (optionList != null && !optionList.isEmpty()) {
            for (QuestionOption option : optionList) {
                option.setQuestionId(questionId);
                questionOptionMapper.insertQuestionOption(option);
            }
        }

        // 3) 更新知识点 question_knowledge
        //    先删除本题所有旧关联
        questionKnowledgeMapper.deleteQuestionKnowledgeByQuestionId(questionId);
        List<String> kpNames = question.getKnowledgePoints();
        if (kpNames != null && !kpNames.isEmpty()) {
            for (String kpName : kpNames) {
                if (kpName == null || kpName.trim().isEmpty()) {
                    continue;
                }
                // 3.1) 检查知识点是否存在，不存在则插入
                KnowledgePoint existKp = knowledgePointMapper.selectKnowledgePointByName(kpName);
                if (existKp == null) {
                    existKp = new KnowledgePoint();
                    existKp.setKpName(kpName);
                    knowledgePointMapper.insertKnowledgePoint(existKp);
                }
                // 3.2) 重新建立关联
                QuestionKnowledge qk = new QuestionKnowledge();
                qk.setQuestionId(questionId);
                qk.setKpId(existKp.getId());
                questionKnowledgeMapper.insertQuestionKnowledge(qk);
            }
        }

        // 4) 更新图片 question_image
        //    同样，先删旧的再插入新的
        questionImageMapper.deleteQuestionImageByQuestionId(questionId);
        List<QuestionImage> imageList = question.getImageList();
        if (imageList != null && !imageList.isEmpty()) {
            for (QuestionImage img : imageList) {
                img.setQuestionId(questionId);
                questionImageMapper.insertQuestionImage(img);
            }
        }

        // 更新完成后，返回影响行数(仅表示更新 question 表成功与否)
        return rows;
    }

    /**
     * 批量删除问题表
     * 
     * @param ids 需要删除的问题表主键
     * @return 结果
     */
    @Override
    public int deleteQuestionByIds(Long[] ids)
    {
        return questionMapper.deleteQuestionByIds(ids);
    }

    /**
     * 删除问题表信息
     * 
     * @param id 问题表主键
     * @return 结果
     */
    @Override
    public int deleteQuestionById(Long id)
    {
        return questionMapper.deleteQuestionById(id);
    }

    /**
     * 批量查询详细题目信息（带知识点、图片、选项）
     */
    @Override
    public List<Question> selectQuestionDetailByIds(List<Long> ids)
    {
        return questionMapper.selectQuestionDetailByIds(ids);
    }

    @Override
    public List<Question> selectQuestionListWithDetail(Question question)
    {
        return questionMapper.selectQuestionListWithDetail(question);
    }
    @Override
    public List<Question> selectQuestionListBase(Question question)
    {
        return questionMapper.selectQuestionListBase(question);
    }

    @Override
    public void assembleSubTables(List<Question> questionList)
    {
        if (CollectionUtils.isEmpty(questionList)) return;
        List<Long> ids = questionList.stream().map(Question::getId).collect(Collectors.toList());

        // 🔥 先初始化每道题目的三个集合
        for (Question question : questionList) {
            if (question.getOptionList() == null) {
                question.setOptionList(new ArrayList<>());
            }
            if (question.getKnowledgePoints() == null) {
                question.setKnowledgePoints(new ArrayList<>());
            }
            if (question.getImageList() == null) {
                question.setImageList(new ArrayList<>());
            }
        }

        List<Question> subList = questionMapper.selectQuestionSubList(ids);

        Map<Long, Question> idToQuestion = questionList.stream().collect(Collectors.toMap(Question::getId, q -> q));

        for (Question q : subList) {
            Question main = idToQuestion.get(q.getId());
            if (main != null) {
                if (q.getOptionList() != null) main.getOptionList().addAll(q.getOptionList());
                if (q.getKnowledgePoints() != null) main.getKnowledgePoints().addAll(q.getKnowledgePoints());
                if (q.getImageList() != null) main.getImageList().addAll(q.getImageList());
            }
        }
    }

    @Override
    public List<Question> selectByKnowledgeTypeScore(String kpName, String questionType,Integer limit) {
        return questionMapper.selectByKnowledgeTypeScore(kpName, questionType, limit);
    }

}
