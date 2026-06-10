package com.systemlkr.web.controller.monitor;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.systemlkr.common.annotation.Log;
import com.systemlkr.common.core.controller.BaseController;
import com.systemlkr.common.core.domain.AjaxResult;
import com.systemlkr.common.core.page.TableDataInfo;
import com.systemlkr.common.enums.BusinessType;
import com.systemlkr.common.utils.poi.ExcelUtil;
import com.systemlkr.framework.web.service.SysPasswordService;
import com.systemlkr.system.domain.SysLogininfor;
import com.systemlkr.system.service.ISysLogininforService;

/**
 * 系统访问记录
 * 
 * @author systemlkr
 */
@RestController
@RequestMapping("/monitor/logininfor")
public class SysLogininforController extends BaseController
{
    @Autowired
    private ISysLogininforService logininforService;

    @Autowired
    private SysPasswordService passwordService;

    /**
     * 查询登录日志列表
     * 支持分页查询，基于传入的SysLogininfor对象参数进行条件筛选
     */
    @GetMapping("/list")
    public TableDataInfo list(SysLogininfor logininfor)
    {
        startPage();
        List<SysLogininfor> list = logininforService.selectLogininforList(logininfor);
        return getDataTable(list);
    }

    /**
     * 导出登录日志数据到Excel文件
     * 使用ExcelUtil工具类完成导出操作，并通过response输出流返回给客户端
     */
    @Log(title = "登录日志", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysLogininfor logininfor)
    {
        List<SysLogininfor> list = logininforService.selectLogininforList(logininfor);
        ExcelUtil<SysLogininfor> util = new ExcelUtil<SysLogininfor>(SysLogininfor.class);
        util.exportExcel(response, list, "登录日志");
    }

    /**
     * 删除指定ID数组的登录日志记录
     * 通过@PathVariable接收路径参数中的ID数组并调用服务层删除方法
     */
    @Log(title = "登录日志", businessType = BusinessType.DELETE)
    @DeleteMapping("/{infoIds}")
    public AjaxResult remove(@PathVariable Long[] infoIds)
    {
        return toAjax(logininforService.deleteLogininforByIds(infoIds));
    }

    /**
     * 清空所有登录日志记录
     * 调用服务层cleanLogininfor方法实现数据表清空操作
     */
    @Log(title = "登录日志", businessType = BusinessType.CLEAN)
    @DeleteMapping("/clean")
    public AjaxResult clean()
    {
        logininforService.cleanLogininfor();
        return success();
    }

    /**
     * 解锁用户账户
     * 调用密码服务清除用户的登录失败缓存记录，实现账户解锁功能
     */
    @PreAuthorize("@ss.hasPermi('monitor:logininfor:unlock')")
    @Log(title = "账户解锁", businessType = BusinessType.OTHER)
    @GetMapping("/unlock/{userName}")
    public AjaxResult unlock(@PathVariable("userName") String userName)
    {
        passwordService.clearLoginRecordCache(userName);
        return success();
    }
}
