package com.systemlkr.web.controller.system;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.systemlkr.common.core.controller.BaseController;
import com.systemlkr.common.core.domain.AjaxResult;
import com.systemlkr.common.core.domain.model.RegisterBody;
import com.systemlkr.common.utils.StringUtils;
import com.systemlkr.framework.web.service.SysRegisterService;
import com.systemlkr.system.service.ISysConfigService;

/**
 * 注册验证
 * 
 * @author lkr
 */
@RestController
public class SysRegisterController extends BaseController
{
    @Autowired
    private SysRegisterService registerService;

    @Autowired
    private ISysConfigService configService;

    @PostMapping("/register")
    public AjaxResult register(@RequestBody RegisterBody user)
    {
        if (!("true".equals(configService.selectConfigByKey("sys.account.registerUser"))))
        {
            return error("错误；请联系管理员");
        }
        String msg = registerService.register(user);
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }
}
