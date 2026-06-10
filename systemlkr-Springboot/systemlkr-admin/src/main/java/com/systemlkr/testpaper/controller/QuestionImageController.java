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
import com.systemlkr.testpaper.domain.QuestionImage;
import com.systemlkr.testpaper.service.IQuestionImageService;
import com.systemlkr.common.utils.poi.ExcelUtil;
import com.systemlkr.common.core.page.TableDataInfo;

/**
 * 题目图片Controller
 * 
 * @author lkr
 * @date 2025-03-15
 */
@RestController
@RequestMapping("/testpaper/image")
public class QuestionImageController extends BaseController
{
    @Autowired
    private IQuestionImageService questionImageService;

    /**
     * 查询题目图片列表
     */
    @PreAuthorize("@ss.hasPermi('testpaper:image:list')")
    @GetMapping("/list")
    public TableDataInfo list(QuestionImage questionImage)
    {
        startPage();
        List<QuestionImage> list = questionImageService.selectQuestionImageList(questionImage);
        return getDataTable(list);
    }

    /**
     * 导出题目图片列表
     */
    @PreAuthorize("@ss.hasPermi('testpaper:image:export')")
    @Log(title = "题目图片", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, QuestionImage questionImage)
    {
        List<QuestionImage> list = questionImageService.selectQuestionImageList(questionImage);
        ExcelUtil<QuestionImage> util = new ExcelUtil<QuestionImage>(QuestionImage.class);
        util.exportExcel(response, list, "题目图片数据");
    }

    /**
     * 获取题目图片详细信息
     */
    @PreAuthorize("@ss.hasPermi('testpaper:image:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(questionImageService.selectQuestionImageById(id));
    }

    /**
     * 新增题目图片
     */
    @PreAuthorize("@ss.hasPermi('testpaper:image:add')")
    @Log(title = "题目图片", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody QuestionImage questionImage)
    {
        return toAjax(questionImageService.insertQuestionImage(questionImage));
    }

    /**
     * 修改题目图片
     */
    @PreAuthorize("@ss.hasPermi('testpaper:image:edit')")
    @Log(title = "题目图片", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody QuestionImage questionImage)
    {
        return toAjax(questionImageService.updateQuestionImage(questionImage));
    }

    /**
     * 删除题目图片
     */
    @PreAuthorize("@ss.hasPermi('testpaper:image:remove')")
    @Log(title = "题目图片", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(questionImageService.deleteQuestionImageByIds(ids));
    }
}
