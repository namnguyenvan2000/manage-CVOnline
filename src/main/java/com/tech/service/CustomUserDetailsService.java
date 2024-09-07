package com.tech.service;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.tech.entity.Account;
import com.tech.entity.CustomUserDetails;
import com.tech.repository.accountDAO;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private accountDAO accountRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Account account = accountRepository.findByEmail(email);
        if (account == null) {
            throw new UsernameNotFoundException("Người dùng không tìm thấy");
        }
        System.out.println("User: " + account.getEmail());
        System.out.println("Role: " + account.getRole().getNameRole());
        System.out.println("ID: " +  account.getId());
        
        return new CustomUserDetails(account);
        
    }
}

