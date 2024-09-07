package com.tech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.entity.Job_detail;
import com.tech.repository.jobDetailDAO;

@Service
public class JobDetailService {
	@Autowired
    private jobDetailDAO jobDetailRepository;
	
	public List<Job_detail> findJobDetailsByJobPostingId(Integer id) {
        return jobDetailRepository.findByJobPostingId(id);
    }
	
	public Job_detail saveJobDetail(Job_detail jobDetail) {
        return jobDetailRepository.save(jobDetail);
    }

}
