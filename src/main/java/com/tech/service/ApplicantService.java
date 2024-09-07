package com.tech.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.entity.Applicant;
import com.tech.entity.CV;
import com.tech.repository.applicantDAO;
import com.tech.repository.cvDAO;
@Service
public class ApplicantService {
	@Autowired
	applicantDAO applicantDao;
	@Autowired
	cvDAO cvDAO;
	
	public Applicant getApplicantById(Integer id) {
        return applicantDao.findById(id).orElse(null);
    }
	
	public Applicant save(Applicant applicant) {
        return applicantDao.save(applicant);
    }
	
	public Applicant findByAccountId(Integer accountId) {
        return applicantDao.findByAccountId(accountId);
    }
	
	public Applicant findByEmail(String email) {
        return applicantDao.findByEmail(email);
    }
	
	public List<CV> getCVsByJobPostingId(Integer jobPostingId) {
        return cvDAO.findByJobPostingId(jobPostingId);
    }

	public List<CV> searchCVsByKeywordAndDate(Integer jobPostingId, String keyword, LocalDate date) {
	    // Tìm kiếm dựa trên keyword và date
	    return cvDAO.findByJobPostingIdAndKeywordAndDate(jobPostingId, keyword, date);
	}

	
}
