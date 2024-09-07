package com.tech.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tech.entity.Job_detail;
import com.tech.entity.Job_posting;
import com.tech.repository.JobPostingDAO;
import com.tech.repository.jobDetailDAO;

@Service
public class JobPostingService {

    @Autowired
    private JobPostingDAO jobPostingRepository;

    @Autowired
    private jobDetailDAO jobDetailRepository;

    public List<Job_posting> getAllJobPostings() {
        return jobPostingRepository.findAll();
    }
    
    public Job_posting getJobPostingById(Integer id) {
        return jobPostingRepository.findById(id).orElse(null);
    }
    
    public Job_posting saveJobPosting(Job_posting jobPosting) {
        return jobPostingRepository.save(jobPosting);
    }
    
    public List<Job_posting> getCurrentJobPostings() {
        return jobPostingRepository.findByStatus("Còn hạn");
    }

    public List<Job_posting> getExpiredJobPostings() {
        return jobPostingRepository.findByStatus("Hết hạn");
    }
    
    public List<Job_posting> getFilledJobPostings() {
        return jobPostingRepository.findByStatus("Đủ số lượng");
    }
    
    public List<Job_posting> getJobPostingsByStatus(String status) {
        return jobPostingRepository.findByStatus(status);
    }
    
    @Scheduled(cron = "0 0 7 * * ?")
    public void updateJobStatuses() {
        List<Job_posting> allJobs = jobPostingRepository.findAll();
        for (Job_posting job : allJobs) {
            if (job.isExpired()) {
                job.setStatus("Hết hạn");
                jobPostingRepository.save(job);
            } else if (job.isFilled()) {
                job.setStatus("Đủ số lượng");
                jobPostingRepository.save(job);
            }
        }
    }
    
    public void updateJobStatus(Integer id, String status) {
        Job_posting jobPosting = getJobPostingById(id);
        if (jobPosting != null) {
            jobPosting.setStatus(status);
            jobPostingRepository.save(jobPosting);
        }
    }
    
    @Transactional
    public void deleteJobPostingAndDetails(Integer id) {
    	jobDetailRepository.deleteByJobPostingId(id);
    	jobPostingRepository.deleteById(id);
    }
    
    @Transactional
    public Job_posting saveJobPostingWithDetails(Job_posting jobPosting, Job_detail jobDetail) {
        Job_posting savedJobPosting = jobPostingRepository.save(jobPosting);
        jobDetail.setJobPosting(savedJobPosting);
        jobDetailRepository.save(jobDetail);
        return savedJobPosting;
    }
    
    public void changeStatusToFilled(Integer id) {
        Optional<Job_posting> optionalJobPosting = jobPostingRepository.findById(id);
        if (optionalJobPosting.isPresent()) {
            Job_posting jobPosting = optionalJobPosting.get();
            jobPosting.setStatus("Đủ số lượng");
            jobPostingRepository.save(jobPosting);
        }
    }
    
    public List<Job_posting> searchJobPostingsByKeyword(String keyword) {
        return jobPostingRepository.findByKeyword(keyword).stream()
                .filter(jobPosting -> !jobPosting.isExpired())
                .collect(Collectors.toList());
    }
    
    public List<Job_posting> findJobPostingbyEmployerId(Integer id){
		return jobPostingRepository.findByEmployerId(id);  	
    }
    
    public List<Job_posting> searchJobsByEmployer(String employerName) {
		return jobPostingRepository.findByEmployerName(employerName);
	}
    
    public Page<Job_posting> getCurrentJobPostings(Pageable pageable) {
        return jobPostingRepository.findAll(pageable); // This uses pagination
    }
    
    public List<Job_posting> searchJobs(String keyword,String jobLocation, String majorName, String experience, String jobType) {
        return jobPostingRepository.searchJobs(keyword,jobLocation, majorName, experience, jobType);
    }
}
