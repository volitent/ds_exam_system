package com.systemlkr.web.controller.system;

import java.util.Map;

import com.systemlkr.common.config.COSConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.systemlkr.common.annotation.Log;
import com.systemlkr.common.config.systemlkrConfig;
import com.systemlkr.common.core.controller.BaseController;
import com.systemlkr.common.core.domain.AjaxResult;
import com.systemlkr.common.core.domain.entity.SysUser;
import com.systemlkr.common.core.domain.model.LoginUser;
import com.systemlkr.common.enums.BusinessType;
import com.systemlkr.common.utils.SecurityUtils;
import com.systemlkr.common.utils.StringUtils;
import com.systemlkr.common.utils.file.FileUploadUtils;
import com.systemlkr.common.utils.file.MimeTypeUtils;
import com.systemlkr.framework.web.service.TokenService;
import com.systemlkr.system.service.ISysUserService;
import com.systemlkr.common.utils.COSUtil;

/**
 * 个人信息 业务处理
 * 
 * @author systemlkr
 */
@RestController
@RequestMapping("/system/user/profile")
public class SysProfileController extends BaseController
{
    @Autowired
    private ISysUserService userService;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private COSUtil cosUtil;

    @Autowired
    private COSConfig cosConfig;
    /**
     * 个人信息
     */
    @GetMapping
    public AjaxResult profile()
    {
        // 获取用户信息
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        AjaxResult ajax = AjaxResult.success(user);
        // 角色组
        ajax.put("roleGroup", userService.selectUserRoleGroup(loginUser.getUsername()));
        ajax.put("postGroup", userService.selectUserPostGroup(loginUser.getUsername()));
        return ajax;
    }

    /**
     * 修改用户
     */
    @Log(title = "个人信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult updateProfile(@RequestBody SysUser user)
    {
        // 获得信息
        LoginUser loginUser = getLoginUser();
        // 用户对象
        SysUser currentUser = loginUser.getUser();
        currentUser.setNickName(user.getNickName());
        currentUser.setEmail(user.getEmail());
        currentUser.setPhonenumber(user.getPhonenumber());
        currentUser.setSex(user.getSex());
        if (StringUtils.isNotEmpty(user.getPhonenumber()) && !userService.checkPhoneUnique(currentUser))
        {
            return error("修改用户'" + loginUser.getUsername() + "'失败，手机号码已存在");
        }
        if (StringUtils.isNotEmpty(user.getEmail()) && !userService.checkEmailUnique(currentUser))
        {
            return error("修改用户'" + loginUser.getUsername() + "'失败，邮箱账号已存在");
        }
        if (userService.updateUserProfile(currentUser) > 0)
        {
            // 更新缓存用户信息
            tokenService.setLoginUser(loginUser);
            return success();
        }
        return error("修改个人信息异常，请联系管理员");
    }

    /**
     * 忘记密码
     */
    @Log(title = "个人信息", businessType = BusinessType.UPDATE)
    @PutMapping("/updatePwd")
    public AjaxResult updatePwd(@RequestBody Map<String, String> params)
    {
        // 获取用户密码 设置新密码
        String oldPassword = params.get("oldPassword");
        String newPassword = params.get("newPassword");
        LoginUser loginUser = getLoginUser();
        String userName = loginUser.getUsername();
        String password = loginUser.getPassword();
        // 密码匹配
        if (!SecurityUtils.matchesPassword(oldPassword, password))
        {
            return error("修改密码失败，旧密码错误");
        }
        if (SecurityUtils.matchesPassword(newPassword, password))
        {
            return error("新密码不能与旧密码相同");
        }
        newPassword = SecurityUtils.encryptPassword(newPassword);
        if (userService.resetUserPwd(userName, newPassword) > 0)
        {
            // 更新缓存用户密码
            loginUser.getUser().setPassword(newPassword);
            tokenService.setLoginUser(loginUser);
            return success();
        }
        return error("修改密码异常，请联系管理员");
    }

    /**
     * 头像上传
     */
    @Log(title = "用户头像", businessType = BusinessType.UPDATE)
    @PostMapping("/avatar")
    public AjaxResult avatar(@RequestParam("avatarfile") MultipartFile file) throws Exception
    {
        if (!file.isEmpty())
        {
            //  上传头像部分
            LoginUser loginUser = getLoginUser();
            String avatar = FileUploadUtils.upload(systemlkrConfig.getAvatarPath(), file, MimeTypeUtils.IMAGE_EXTENSION);
            if (userService.updateUserAvatar(loginUser.getUsername(), avatar))
            {
                AjaxResult ajax = AjaxResult.success();
                ajax.put("imgUrl", avatar);
                // 更新缓存用户头像
                loginUser.getUser().setAvatar(avatar);
                tokenService.setLoginUser(loginUser);
                return ajax;
            }
        }
        return error("上传图片异常，请联系管理员");
    }

    @Log(title = "用户头像", businessType = BusinessType.UPDATE)
    @PostMapping("/avatar/cos")
    public AjaxResult avatarBycos(@RequestBody Map<String, String> body) throws Exception {
        String avatarUrl = body.get("avatar");
        if (avatarUrl == null || avatarUrl.isEmpty()) {
            return AjaxResult.error("头像 URL 不合法");
        }

        LoginUser loginUser = getLoginUser();
        String username = loginUser.getUsername();

        // 1. 获取旧头像地址（完整 URL）
        String oldAvatarUrl = loginUser.getUser().getAvatar();
        logger.info("当前用户旧头像地址为: {}", oldAvatarUrl);

        String prefix = cosConfig.getPrefix();
        logger.info("前缀地址为: {}", prefix);
        // 2. 删除旧头像（确保它在 COS 中）
        if (StringUtils.hasText(oldAvatarUrl) && StringUtils.hasText(prefix) && oldAvatarUrl.contains(prefix)) {
            String oldKey = oldAvatarUrl.replace(prefix + "/", "");
            cosUtil.delete(oldKey);
        }

        // 3. 更新数据库和缓存
        if (userService.updateUserAvatar(username, avatarUrl)) {
            loginUser.getUser().setAvatar(avatarUrl);
            tokenService.setLoginUser(loginUser);

            AjaxResult ajax = AjaxResult.success();
            ajax.put("imgUrl", avatarUrl);
            return ajax;
        }

        return AjaxResult.error("头像保存失败，请联系管理员");
    }


}
