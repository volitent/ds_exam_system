package com.systemlkr.testpaper.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.systemlkr.testpaper.domain.QuestionRequest;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.systemlkr.common.annotation.Log;
import com.systemlkr.common.core.controller.BaseController;
import com.systemlkr.common.core.domain.AjaxResult;
import com.systemlkr.common.enums.BusinessType;
import com.systemlkr.testpaper.domain.Question;
import com.systemlkr.testpaper.service.IQuestionService;
import com.systemlkr.common.utils.poi.ExcelUtil;
import com.systemlkr.common.core.page.TableDataInfo;

/**
 * 问题表Controller
 * 
 * @author lkr
 * @date 2025-03-08
 */
@RestController
@RequestMapping("/testpaper/question")
public class QuestionController extends BaseController
{
    @Autowired
    private IQuestionService questionService;

    /**
     * 查询问题表列表
     */
    @PreAuthorize("@ss.hasPermi('testpaper:question:list')")
    @GetMapping("/list")
    public TableDataInfo list(Question question)
    {
        startPage();
        List<Question> list = questionService.selectQuestionListBase(question);
        questionService.assembleSubTables(list); // 再查子表组装
        return getDataTable(list);
    }

    /**
     * 查询问题表（分页，带知识点、图片）
     */
    @PreAuthorize("@ss.hasPermi('testpaper:question:list')")
    @GetMapping("/listWithDetail")
    public TableDataInfo listWithDetail(Question question)
    {
        startPage();
        List<Question> list = questionService.selectQuestionListWithDetail(question);
        return getDataTable(list);
    }


    /**
     * 导出问题表列表
     */
    @PreAuthorize("@ss.hasPermi('testpaper:question:export')")
    @Log(title = "问题表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Question question)
    {
        List<Question> list = questionService.selectQuestionList(question);
        ExcelUtil<Question> util = new ExcelUtil<Question>(Question.class);
        util.exportExcel(response, list, "问题表数据");
    }

    /**
     * 获取问题表详细信息
     */
    @PreAuthorize("@ss.hasPermi('testpaper:question:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(questionService.selectQuestionById(id));
    }

    /**
     * 新增问题表
     */
    @PreAuthorize("@ss.hasPermi('testpaper:question:add')")
    @Log(title = "问题表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Question question)
    {
        return toAjax(questionService.insertQuestion(question));
    }

    /**
     * 修改问题表
     */
    @PreAuthorize("@ss.hasPermi('testpaper:question:edit')")
    @Log(title = "问题表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Question question)
    {
        return toAjax(questionService.updateQuestion(question));
    }

    /**
     * 删除问题表
     */
    @PreAuthorize("@ss.hasPermi('testpaper:question:remove')")
    @Log(title = "问题表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(questionService.deleteQuestionByIds(ids));
    }

    /**
     * 批量查询问题详细信息
     */
    @PreAuthorize("@ss.hasPermi('testpaper:question:list')")
    @PostMapping("/batchDetail")
    public AjaxResult batchDetail(@RequestBody List<Long> ids)
    {
        return success(questionService.selectQuestionDetailByIds(ids));
    }

    /**
     * 根据知识点、题型和分值查询题目
     */
    /**
     * 根据知识点、题型和分值查询题目
     */
    @PostMapping("/auto-select")
    public AjaxResult autoSelectQuestions(@RequestBody List<QuestionRequest> requests) {
        try {
            // 遍历所有请求并查询题目
            List<Question> allQuestions = new ArrayList<>();
            for (QuestionRequest request : requests) {
                List<Question> questions = questionService.selectByKnowledgeTypeScore(
                        request.getKpName(),
                        request.getQuestionType(),
                        request.getLimit()
                );
                allQuestions.addAll(questions);
            }
            return AjaxResult.success(allQuestions);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("组卷失败：" + e.getMessage());
        }
    }

}
