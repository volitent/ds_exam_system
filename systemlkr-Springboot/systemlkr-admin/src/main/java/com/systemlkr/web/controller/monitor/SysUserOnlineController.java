package com.systemlkr.web.controller.monitor;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.systemlkr.common.annotation.Log;
import com.systemlkr.common.constant.CacheConstants;
import com.systemlkr.common.core.controller.BaseController;
import com.systemlkr.common.core.domain.AjaxResult;
import com.systemlkr.common.core.domain.model.LoginUser;
import com.systemlkr.common.core.page.TableDataInfo;
import com.systemlkr.common.core.redis.RedisCache;
import com.systemlkr.common.enums.BusinessType;
import com.systemlkr.common.utils.StringUtils;
import com.systemlkr.system.domain.SysUserOnline;
import com.systemlkr.system.service.ISysUserOnlineService;

/**
 * 在线用户监控
 * 
 * @author systemlkr
 */
@RestController
@RequestMapping("/monitor/online")
public class SysUserOnlineController extends BaseController
{
    @Autowired
    private ISysUserOnlineService userOnlineService;

    @Autowired
    private RedisCache redisCache;


    /**
     * 在线用户列表接口
     * 
     * 根据请求参数筛选在线用户信息，支持通过IP地址和用户名进行过滤。
     * 从Redis缓存中获取所有登录用户的token键值，然后逐个解析每个用户的信息。
     * 支持多种查询条件组合：
     * - 同时提供ipaddr和userName：精确匹配指定IP和用户名的用户
     * - 只提供ipaddr：匹配指定IP的用户
     * - 只提供userName：匹配指定用户名的用户（需确保用户信息非空）
     * - 两者均未提供：返回所有在线用户的基本信息
     * 
     * 查询结果默认按逆序排列，并移除无效数据后返回分页格式的结果
     * 
     * @param ipaddr   登录IP地址（可选）
     * @param userName 用户名称（可选）
     * @return TableDataInfo 分页格式的在线用户信息
     */
    @GetMapping("/list")
    public TableDataInfo list(String ipaddr, String userName)
    {
        // 获取所有在线用户的token键集合
        Collection<String> keys = redisCache.keys(CacheConstants.LOGIN_TOKEN_KEY + "*");
        List<SysUserOnline> userOnlineList = new ArrayList<>();

        for (String key : keys)
        {
            LoginUser user = redisCache.getCacheObject(key);
            
            // 根据不同的查询条件选择对应的服务方法
            if (StringUtils.isNotEmpty(ipaddr) && StringUtils.isNotEmpty(userName))
            {
                // IP地址与用户名同时存在时调用selectOnlineByInfo方法
                userOnlineList.add(userOnlineService.selectOnlineByInfo(ipaddr, userName, user));
            }
            else if (StringUtils.isNotEmpty(ipaddr))
            {
                // 只有IP地址存在时调用selectOnlineByIpaddr方法
                userOnlineList.add(userOnlineService.selectOnlineByIpaddr(ipaddr, user));
            }
            else if (StringUtils.isNotEmpty(userName) && StringUtils.isNotNull(user.getUser()))
            {
                // 只有用户名存在且用户信息有效时调用selectOnlineByUserName方法
                userOnlineList.add(userOnlineService.selectOnlineByUserName(userName, user));
            }
            else
            {
                // 默认情况获取完整的在线用户信息
                userOnlineList.add(userOnlineService.loginUserToUserOnline(user));
            }
        }

        // 对结果进行逆序排序并清理空数据
        Collections.reverse(userOnlineList);
        userOnlineList.removeAll(Collections.singleton(null));

        // 返回分页处理后的数据
        return getDataTable(userOnlineList);
    }
    /**
     * 强退用户
     */
    @PreAuthorize("@ss.hasPermi('monitor:online:forceLogout')")
    @Log(title = "在线用户", businessType = BusinessType.FORCE)
    @DeleteMapping("/{tokenId}")
    public AjaxResult forceLogout(@PathVariable String tokenId)
    {
        redisCache.deleteObject(CacheConstants.LOGIN_TOKEN_KEY + tokenId);
        return success();
    }
}
