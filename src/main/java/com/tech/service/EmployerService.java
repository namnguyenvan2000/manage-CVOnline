package com.tech.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.tech.repository.*;
import com.tech.entity.Employer;
import com.tech.entity.Job_posting;

@Service
public class EmployerService {
	@Autowired 
	employerDAO empDao;
	@Autowired
	JobPostingDAO jobPostingDao;
    @Autowired
    jobDetailDAO jobDetailRepository;
	
	
	public Employer getEmployerById(Integer id) {
		return empDao.findById(id).orElse(null);
	}
	
	public Employer findbyAccountId(Integer accountId) {
        return empDao.findByAccountId(accountId); 
    }

    public List<Job_posting> getActiveJobPostingsByEmployer(Integer employerId) {
        return jobPostingDao.findByEmployerId(employerId);
    }
    
    public Job_posting getJobPostingById(Integer id) {
        return jobPostingDao.findById(id).orElse(null);
    }
    
    public List<Employer> getAllEmployers() {
		return empDao.findAll();
	}
    
    @Scheduled(cron = "0 0 7 * * ?")
    public void updateJobStatuses() {
        List<Job_posting> allJobs = jobPostingDao.findAll();
        for (Job_posting job : allJobs) {
            if (job.isExpired()) {
                job.setStatus("Hết hạn");
                jobPostingDao.save(job);
            } else if (job.isFilled()) {
                job.setStatus("Đủ số lượng");
                jobPostingDao.save(job);
            }
        }
    }
    
    public void updateJobStatus(Integer id, String status) {
        Job_posting jobPosting = getJobPostingById(id);
        if (jobPosting != null) {
            jobPosting.setStatus(status);
            jobPostingDao.save(jobPosting);
        }
    }
    
    public List<Job_posting> searchJobPostingsByKeyword(String keyword) {
        return jobPostingDao.findByKeyword(keyword).stream()
                .filter(jobPosting -> !jobPosting.isExpired())
                .collect(Collectors.toList());
    }
    
    public List<Job_posting> getActiveJobPostings() {
        return jobPostingDao.findAll();
    }
	
    public Employer save_NTD(Employer emp) {
        return empDao.save(emp);
    }
    
    public List<Employer> searchEmployersByKeyword(String keyword) {
        return empDao.findByKeyword(keyword);
    }
}
