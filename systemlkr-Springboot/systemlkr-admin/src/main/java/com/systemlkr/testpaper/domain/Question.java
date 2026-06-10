package com.systemlkr.testpaper.domain;

import com.systemlkr.common.annotation.Excel;
import com.systemlkr.common.core.domain.BaseEntity;

import java.util.List;

/**
 * 问题表对象 question
 *
 * @author lkr
 * @date 2025-03-08
 */
public class Question extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 题目ID */
    private Long id;

    /** 题型 */
    @Excel(name = "题型")
    private String questionType;

    /** 题目标题或题干 */
    @Excel(name = "题目标题或题干")
    private String title;

    /** 难度等级，如 1=易，2=中，3=难 */
    @Excel(name = "难度等级，如 1=易，2=中，3=难")
    private Integer difficulty;

    /** 正确答案或参考答案（对简答/填空/编程题等生效） */
    @Excel(name = "正确答案或参考答案", readConverterExp = "对=简答/填空/编程题等生效")
    private String answer;

    /** 答案解析或思路讲解 */
    @Excel(name = "答案解析或思路讲解")
    private String analysis;

    /** 创建者的用户ID（若需要追溯） */
    @Excel(name = "创建者的用户ID", readConverterExp = "若=需要追溯")
    private Long creatorId;
    private String creatorName; // 创建者昵称

    /** 备注信息，或题目来源 */
    @Excel(name = "备注信息，或题目来源")
    private String remarks;


    /** 多个选项（针对选择题） */
    private List<QuestionOption> optionList;

    /** 多个知识点名，或直接用 KnowledgePoint 实体 */
    private List<String> knowledgePoints;
    /**
     * 用于查询的知识点关键词（模糊搜索）
     */
    private String kpName;

    /** 多张图片的路径或对象 */
    private List<QuestionImage> imageList;

    public List<QuestionOption> getOptionList() {
        return optionList;
    }

    public void setOptionList(List<QuestionOption> optionList) {
        this.optionList = optionList;
    }

    public List<String> getKnowledgePoints() {
        return knowledgePoints;
    }

    public void setKnowledgePoints(List<String> knowledgePoints) {
        this.knowledgePoints = knowledgePoints;
    }

    public List<QuestionImage> getImageList() {
        return imageList;
    }

    public void setImageList(List<QuestionImage> imageList) {
        this.imageList = imageList;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }

    public void setQuestionType(String questionType)
    {
        this.questionType = questionType;
    }

    public String getQuestionType()
    {
        return questionType;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getTitle()
    {
        return title;
    }

    public void setDifficulty(Integer difficulty)
    {
        this.difficulty = difficulty;
    }

    public Integer getDifficulty()
    {
        return difficulty;
    }

    public void setAnswer(String answer)
    {
        this.answer = answer;
    }

    public String getAnswer()
    {
        return answer;
    }

    public void setAnalysis(String analysis)
    {
        this.analysis = analysis;
    }

    public String getAnalysis()
    {
        return analysis;
    }

    public void setCreatorId(Long creatorId)
    {
        this.creatorId = creatorId;
    }

    public Long getCreatorId()
    {
        return creatorId;
    }

    public void setRemarks(String remarks)
    {
        this.remarks = remarks;
    }

    public String getRemarks()
    {
        return remarks;
    }

    public String getCreatorName() {
        return creatorName;
    }

    public void setCreatorName(String creatorName) {
        this.creatorName = creatorName;
    }

    public String getKpName() {
        return kpName;
    }

    public void setKpName(String kpName) {
        this.kpName = kpName;
    }

    @Override
    public String toString() {
        return "Question{" +
                "id=" + id +
                ", questionType='" + questionType + '\'' +
                ", title='" + title + '\'' +
                ", difficulty=" + difficulty +
                ", answer='" + answer + '\'' +
                ", analysis='" + analysis + '\'' +
                ", creatorId=" + creatorId +
                ", creatorName='" + creatorName + '\'' +
                ", remarks='" + remarks + '\'' +
                ", optionList=" + optionList +
                ", knowledgePoints=" + knowledgePoints +
                ", imageList=" + imageList +
                '}';
    }
}
