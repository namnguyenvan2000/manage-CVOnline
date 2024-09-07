package com.tech.service;

import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2UserAuthority;
import org.springframework.stereotype.Service;

import com.tech.entity.Account;
import com.tech.entity.Applicant;
import com.tech.entity.Role;
import com.tech.repository.accountDAO;
import com.tech.repository.applicantDAO;
import com.tech.repository.roleDAO;

import jakarta.transaction.Transactional;

import java.util.Collections;
import java.util.Map;

@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {
	private accountDAO accountRepository;
	private roleDAO roleRepository;
	private applicantDAO appRepository;
	private SessionService session;

	public CustomOAuth2UserService(accountDAO accountRepository, roleDAO roleRepository, SessionService session,applicantDAO appRepository) {
        this.accountRepository = accountRepository;
        this.roleRepository = roleRepository;
        this.appRepository = appRepository;
        this.session = session;
    }
    @Override
    @Transactional
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User oAuth2User = super.loadUser(userRequest);

        // Lấy thông tin người dùng từ Google
        Map<String, Object> attributes = oAuth2User.getAttributes();
        String email = (String) attributes.get("email");

        // Kiểm tra nếu tài khoản đã tồn tại
        Account account = accountRepository.findByEmail(email);
        if (account == null) {
        // Nếu tài khoản chưa tồn tại, tạo mới và lưu vào database
            account = new Account();
            account.setEmail(email);
         // Đặt mật khẩu null vì đăng nhập qua Google không cần mật khẩu
            account.setPassword(null);

         // Gán vai trò mặc định là "Applicant"
            Role role = roleRepository.findByNameRole("APPLICANT");
            account.setRole(role);
            
            
            
            
         // Lưu vào cơ sở dữ liệu
            accountRepository.save(account);
         // Tạo mới đối tượng applicant theo account Google
            Applicant applicant = new Applicant();
            applicant.setEmail(email);
            applicant.setAccount(account);
            applicant.setStatus("Active");
         // Lưu vào cơ sở dữ liệu
            
            appRepository.save(applicant);		
            
        }
        //Lưu ID,Role vào session
        session.set("account",account);
        // Tạo một đối tượng OAuth2User mới với các quyền đã xác định (authorities)
        return new DefaultOAuth2User(
            Collections.singleton(new OAuth2UserAuthority(attributes)),
            attributes,
            "name"
        );
    }
}

