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
import com.systemlkr.testpaper.domain.PaperQuestion;
import com.systemlkr.testpaper.service.IPaperQuestionService;
import com.systemlkr.common.utils.poi.ExcelUtil;
import com.systemlkr.common.core.page.TableDataInfo;

/**
 * 试卷题目联表Controller
 * 
 * @author lkr
 * @date 2025-03-08
 */
@RestController
@RequestMapping("/testpaper/paperquestion")
public class PaperQuestionController extends BaseController
{
    @Autowired
    private IPaperQuestionService paperQuestionService;

    /**
     * 查询试卷题目联表列表
     */
    @PreAuthorize("@ss.hasPermi('testpaper:paperquestion:list')")
    @GetMapping("/list")
    public TableDataInfo list(PaperQuestion paperQuestion)
    {
        startPage();
        List<PaperQuestion> list = paperQuestionService.selectPaperQuestionList(paperQuestion);
        return getDataTable(list);
    }

    /**
     * 导出试卷题目联表列表
     */
    @PreAuthorize("@ss.hasPermi('testpaper:paperquestion:export')")
    @Log(title = "试卷题目联表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PaperQuestion paperQuestion)
    {
        List<PaperQuestion> list = paperQuestionService.selectPaperQuestionList(paperQuestion);
        ExcelUtil<PaperQuestion> util = new ExcelUtil<PaperQuestion>(PaperQuestion.class);
        util.exportExcel(response, list, "试卷题目联表数据");
    }

    /**
     * 获取试卷题目联表详细信息
     */
    @PreAuthorize("@ss.hasPermi('testpaper:paperquestion:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(paperQuestionService.selectPaperQuestionById(id));
    }

    /**
     * 新增试卷题目联表
     */
    @PreAuthorize("@ss.hasPermi('testpaper:paperquestion:add')")
    @Log(title = "试卷题目联表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PaperQuestion paperQuestion)
    {
        return toAjax(paperQuestionService.insertPaperQuestion(paperQuestion));
    }

    /**
     * 修改试卷题目联表
     */
    @PreAuthorize("@ss.hasPermi('testpaper:paperquestion:edit')")
    @Log(title = "试卷题目联表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PaperQuestion paperQuestion)
    {
        return toAjax(paperQuestionService.updatePaperQuestion(paperQuestion));
    }

    /**
     * 删除试卷题目联表
     */
    @PreAuthorize("@ss.hasPermi('testpaper:paperquestion:remove')")
    @Log(title = "试卷题目联表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(paperQuestionService.deletePaperQuestionByIds(ids));
    }
}
