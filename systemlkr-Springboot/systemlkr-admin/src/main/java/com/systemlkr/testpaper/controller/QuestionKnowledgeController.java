package com.systemlkr.testpaper.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.systemlkr.common.annotation.Log;
import com.systemlkr.common.core.controller.BaseController;
import com.systemlkr.common.core.domain.AjaxResult;
import com.systemlkr.common.enums.BusinessType;
import com.systemlkr.testpaper.domain.QuestionKnowledge;
import com.systemlkr.testpaper.service.IQuestionKnowledgeService;
import com.systemlkr.common.utils.poi.ExcelUtil;
import com.systemlkr.common.core.page.TableDataInfo;

/**
 * 知识点题目关联表Controller
 * 
 * @author lkr
 * @date 2025-03-08
 */
@RestController
@RequestMapping("/testpaper/knowledge")
public class QuestionKnowledgeController extends BaseController
{
    @Autowired
    private IQuestionKnowledgeService questionKnowledgeService;

    /**
     * 查询知识点题目关联表列表
     */
    @PreAuthorize("@ss.hasPermi('testpaper:knowledge:list')")
    @GetMapping("/list")
    public TableDataInfo list(QuestionKnowledge questionKnowledge)
    {
        startPage();
        List<QuestionKnowledge> list = questionKnowledgeService.selectQuestionKnowledgeList(questionKnowledge);
        return getDataTable(list);
    }

    /**
     * 导出知识点题目关联表列表
     */
    @PreAuthorize("@ss.hasPermi('testpaper:knowledge:export')")
    @Log(title = "知识点题目关联表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, QuestionKnowledge questionKnowledge)
    {
        List<QuestionKnowledge> list = questionKnowledgeService.selectQuestionKnowledgeList(questionKnowledge);
        ExcelUtil<QuestionKnowledge> util = new ExcelUtil<QuestionKnowledge>(QuestionKnowledge.class);
        util.exportExcel(response, list, "知识点题目关联表数据");
    }

    /**
     * 获取知识点题目关联表详细信息
     */
    @PreAuthorize("@ss.hasPermi('testpaper:knowledge:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(questionKnowledgeService.selectQuestionKnowledgeById(id));
    }

    /**
     * 新增知识点题目关联表
     */
    @PreAuthorize("@ss.hasPermi('testpaper:knowledge:add')")
    @Log(title = "知识点题目关联表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody QuestionKnowledge questionKnowledge)
    {
        return toAjax(questionKnowledgeService.insertQuestionKnowledge(questionKnowledge));
    }

    /**
     * 修改知识点题目关联表
     */
    @PreAuthorize("@ss.hasPermi('testpaper:knowledge:edit')")
    @Log(title = "知识点题目关联表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody QuestionKnowledge questionKnowledge)
    {
        return toAjax(questionKnowledgeService.updateQuestionKnowledge(questionKnowledge));
    }

    /**
     * 删除知识点题目关联表
     */
    @PreAuthorize("@ss.hasPermi('testpaper:knowledge:remove')")
    @Log(title = "知识点题目关联表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(questionKnowledgeService.deleteQuestionKnowledgeByIds(ids));
    }
}
