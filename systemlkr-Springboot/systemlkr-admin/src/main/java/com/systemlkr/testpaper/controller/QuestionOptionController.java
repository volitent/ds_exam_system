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
import com.systemlkr.testpaper.domain.QuestionOption;
import com.systemlkr.testpaper.service.IQuestionOptionService;
import com.systemlkr.common.utils.poi.ExcelUtil;
import com.systemlkr.common.core.page.TableDataInfo;

/**
 * 选择题选项Controller
 * 
 * @author lkr
 * @date 2025-03-08
 */
@RestController
@RequestMapping("/testpaper/option")
public class QuestionOptionController extends BaseController
{
    @Autowired
    private IQuestionOptionService questionOptionService;

    /**
     * 查询选择题选项列表
     */
    @GetMapping("/list")
    public TableDataInfo list(QuestionOption questionOption)
    {
        startPage();
        List<QuestionOption> list = questionOptionService.selectQuestionOptionList(questionOption);
        return getDataTable(list);
    }

    /**
     * 导出选择题选项列表
     */
    @Log(title = "选择题选项", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, QuestionOption questionOption)
    {
        List<QuestionOption> list = questionOptionService.selectQuestionOptionList(questionOption);
        ExcelUtil<QuestionOption> util = new ExcelUtil<QuestionOption>(QuestionOption.class);
        util.exportExcel(response, list, "选择题选项数据");
    }

    /**
     * 获取选择题选项详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(questionOptionService.selectQuestionOptionById(id));
    }

    /**
     * 新增选择题选项
     */
    @Log(title = "选择题选项", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody QuestionOption questionOption)
    {
        return toAjax(questionOptionService.insertQuestionOption(questionOption));
    }

    /**
     * 修改选择题选项
     */
    @PreAuthorize("@ss.hasPermi('testpaper:option:edit')")
    @Log(title = "选择题选项", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody QuestionOption questionOption)
    {
        return toAjax(questionOptionService.updateQuestionOption(questionOption));
    }

    /**
     * 删除选择题选项
     */
    @PreAuthorize("@ss.hasPermi('testpaper:option:remove')")
    @Log(title = "选择题选项", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(questionOptionService.deleteQuestionOptionByIds(ids));
    }
}
