package com.systemlkr.web.controller.system;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.systemlkr.common.annotation.Log;
import com.systemlkr.common.core.controller.BaseController;
import com.systemlkr.common.core.domain.AjaxResult;
import com.systemlkr.common.core.page.TableDataInfo;
import com.systemlkr.common.enums.BusinessType;
import com.systemlkr.system.domain.SysNotice;
import com.systemlkr.system.service.ISysNoticeService;

/**
 * 公告信息管理控制器
 * 提供对通知公告的增删改查及列表展示功能
 */
@RestController
@RequestMapping("/system/notice")
public class SysNoticeController extends BaseController
{
    @Autowired
    private ISysNoticeService noticeService;

    /**
     * 分页查询通知公告列表
     * 
     * @param notice 查询条件封装对象
     * @return TableDataInfo 分页数据结果
     */
    @GetMapping("/list")
    public TableDataInfo list(SysNotice notice)
    {
        startPage();
        List<SysNotice> list = noticeService.selectNoticeList(notice);
        return getDataTable(list);
    }

    /**
     * 根据ID获取通知公告详细信息
     * 
     * @param noticeId 公告ID
     * @return AjaxResult 包含公告详情的操作结果
     */
    @GetMapping(value = "/{noticeId}")
    public AjaxResult getInfo(@PathVariable Long noticeId)
    {
        return success(noticeService.selectNoticeById(noticeId));
    }

    /**
     * 新增通知公告
     */
    @Log(title = "通知公告", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody SysNotice notice)
    {
        notice.setCreateBy(getUsername());
        return toAjax(noticeService.insertNotice(notice));
    }

    /**
     * 修改已有通知公告
     * 
     * @param notice 包含更新信息的公告实体
     * @return AjaxResult 操作结果
     */
    @Log(title = "通知公告", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody SysNotice notice)
    {
        notice.setUpdateBy(getUsername());
        return toAjax(noticeService.updateNotice(notice));
    }

    /**
     * 删除指定通知公告
     * 
     * @param noticeIds 需要删除的公告ID数组
     * @return AjaxResult 操作结果
     */
    @PreAuthorize("@ss.hasPermi('system:notice:remove')")
    @Log(title = "通知公告", businessType = BusinessType.DELETE)
    @DeleteMapping("/{noticeIds}")
    public AjaxResult remove(@PathVariable Long[] noticeIds)
    {
        return toAjax(noticeService.deleteNoticeByIds(noticeIds));
    }
}
