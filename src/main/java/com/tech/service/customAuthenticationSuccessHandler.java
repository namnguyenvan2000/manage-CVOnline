package com.tech.service;

import java.io.IOException;
import java.util.Collection;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.tech.entity.CustomUserDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class customAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        // Lấy thông tin người dùng từ Authentication
        Object principal = authentication.getPrincipal();

        // Kiểm tra nếu principal là một instance của CustomUserDetails
        if (principal instanceof CustomUserDetails) {
            CustomUserDetails customUserDetails = (CustomUserDetails) principal;

            // Lấy URL gốc từ session
            String redirectURL = (String) request.getSession().getAttribute("redirectURL");
            if (redirectURL == null || redirectURL.isEmpty()) {
                redirectURL = request.getContextPath(); // fallback to home page
            }
            //Lưu ID account
            request.getSession().setAttribute("account", customUserDetails.getAccount());
            
            // Điều hướng dựa trên vai trò của người dùng
            Collection<? extends GrantedAuthority> authorities = customUserDetails.getAuthorities();
            for (GrantedAuthority authority : authorities) {
                String role = authority.getAuthority();

                if (role.equals("ROLE_ADMIN")) {
                    redirectURL = "/admin/index";
                    break;
                } else if (role.equals("ROLE_EMPLOYER")) {
                    redirectURL = "/public/index";
                    break;
                } else if (role.equals("ROLE_APPLICANT")) {
                    redirectURL = "/public/index";
                    break;
                }
            }

            // Xóa URL gốc khỏi session
            request.getSession().removeAttribute("redirectURL");

            // Chuyển hướng đến URL tương ứng với vai trò
            response.sendRedirect(redirectURL);
        }
    }
}
