package com.systemlkr.framework.security.filter;

import java.io.*;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import com.systemlkr.common.core.domain.model.LoginUser;
import com.systemlkr.common.utils.SecurityUtils;
import com.systemlkr.common.utils.StringUtils;
import com.systemlkr.framework.web.service.TokenService;
import lombok.extern.slf4j.Slf4j;

/**
 * token过滤器 验证token有效性
 * 
 * @author systemlkr
 */
@Component
@Slf4j
public class JwtAuthenticationTokenFilter extends OncePerRequestFilter
{
    @Autowired
    private TokenService tokenService;
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws ServletException, IOException
    {
        log.info("🔐 拦截器收到 Authorization：{}", request.getHeader("Authorization"));
        LoginUser loginUser = tokenService.getLoginUser(request);
        if (StringUtils.isNotNull(loginUser) && StringUtils.isNull(SecurityUtils.getAuthentication()))
        {
            tokenService.verifyToken(loginUser);
            UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(loginUser, null, loginUser.getAuthorities());
            authenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
            SecurityContextHolder.getContext().setAuthentication(authenticationToken);
        }
        chain.doFilter(request, response);
    }
}
