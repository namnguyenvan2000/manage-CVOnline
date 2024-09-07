package com.tech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.tech.entity.Account;
import com.tech.repository.accountDAO;

@Service
public class AccountService {
	@Autowired
	accountDAO accDao;
	
	public List<Account> getAllAccount(){
		return accDao.findAll();
	}
	
	public List<Account> getEmployerAccounts() {
        return accDao.findEmployerAccounts();
    }

    public List<Account> getApplicantAccounts() {
        return accDao.findApplicantAccounts();
    }
    
    public Account findByEmail(String email) {
        Account account = accDao.findByEmail(email);
        if (account == null) {	
            throw new UsernameNotFoundException("User not found");
        }
        return account;
    }
    
    public void save(Account account) {
        accDao.save(account);
    }
}
