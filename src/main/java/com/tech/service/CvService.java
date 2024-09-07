package com.tech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.entity.CV;
import com.tech.repository.cvDAO;

@Service
public class CvService {

	@Autowired
	cvDAO cvdao;
	
	public CV saveCV(CV cv) {
        return cvdao.save(cv);
    }
	
	public CV getCVById(Integer id) {
        return cvdao.findById(id).orElse(null);
    }
    public List<CV> findByApplicantId(Integer applicantId) {
        return cvdao.findByApplicantId(applicantId);
    }
    
    public List<CV> findCVByApplicantId(Integer applicantId) {
        return cvdao.findCVByApplicantId(applicantId);
    }
}
