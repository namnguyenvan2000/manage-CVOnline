package com.tech.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tech.entity.Account;
import com.tech.entity.Applicant;
import com.tech.entity.Employer;
import com.tech.entity.Role;
import com.tech.repository.accountDAO;
import com.tech.repository.applicantDAO;
import com.tech.repository.employerDAO;

@Service
public class RegistrationService {
	
	private final Map<String, Account> pendingRegistrations = new HashMap<>();
	
	@Autowired
    private accountDAO accountDAO;

    @Autowired
    private applicantDAO applicantDAO;
    
    @Autowired
    private employerDAO employerDAO;
    
    @Autowired
    private EmailSerivce emailService;

    @Autowired
    private OTPService otpService;
    
    public void signup(Account account) {
        String otp = otpService.generateOTP(account.getEmail());
        emailService.sendEmail(account.getEmail(), "OTP Xác nhận đăng ký", "Mã OTP của bạn là: " + otp);
        pendingRegistrations.put(account.getEmail(), account);
    }

    public void register(Employer employer) {
        String otp = otpService.generateOTP(employer.getAccount().getEmail());
        emailService.sendEmail(employer.getAccount().getEmail(), "OTP Xác nhận đăng ký", "Mã OTP của bạn là: " + otp);
        pendingRegistrations.put(employer.getAccount().getEmail(), employer.getAccount());
    }

    public boolean confirmOTP(String email, String otp) {
        if (otpService.validateOTP(email, otp)) {
            Account account = pendingRegistrations.remove(email);
            if (account != null) {
                saveAccount(account);
                return true;
            }
        }
        return false;
    }

    private void saveAccount(Account account) {
        // Save Account first
        accountDAO.save(account);
        // Then save Applicant or Employer based on role
        if (account.getRole().getId() == 3) {
            Applicant applicant = account.getApplicant();
            if (applicant != null) {
                applicantDAO.save(applicant);
            }
        } else if (account.getRole().getId() == 2) {
            Employer employer = account.getEmployer();
            if (employer != null) {
                employerDAO.save(employer);
            }
        }
    }
	
	//signupApplicant
	public Applicant signupApplicant(Applicant app) {
		return applicantDAO.save(app);
	}
	
	//registerEmployer
	public Employer registerEmployer(Employer emp) {
        return employerDAO.save(emp);
    }
}
