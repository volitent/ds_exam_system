package com.systemlkr.paper.controller;

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
import com.systemlkr.paper.domain.Paper;
import com.systemlkr.paper.service.IPaperService;
import com.systemlkr.common.utils.poi.ExcelUtil;
import com.systemlkr.common.core.page.TableDataInfo;

/**
 * 试卷表管理Controller
 * 
 * @author lkr
 * @date 2025-04-18
 */
@RestController
@RequestMapping("/paper/paperlist")
public class PaperController extends BaseController
{
    @Autowired
    private IPaperService paperService;

    /**
     * 查询试卷表管理列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Paper paper)
    {
        startPage();
        List<Paper> list = paperService.selectPaperList(paper);
        return getDataTable(list);
    }

    /**
     * 导出试卷表管理列表
     */
    @Log(title = "试卷表管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Paper paper)
    {
        List<Paper> list = paperService.selectPaperList(paper);
        ExcelUtil<Paper> util = new ExcelUtil<Paper>(Paper.class);
        util.exportExcel(response, list, "试卷表管理数据");
    }

    /**
     * 获取试卷表管理详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(paperService.selectPaperById(id));
    }

    /**
     * 新增试卷表管理
     */
    @Log(title = "试卷表管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Paper paper)
    {
        return toAjax(paperService.insertPaper(paper));
    }

    /**
     * 修改试卷表管理
     */
    @Log(title = "试卷表管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Paper paper)
    {
        return toAjax(paperService.updatePaper(paper));
    }

    /**
     * 删除试卷表管理
     */
    @PreAuthorize("@ss.hasPermi('paper:paperlist:remove')")
    @Log(title = "试卷表管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(paperService.deletePaperByIds(ids));
    }
}
