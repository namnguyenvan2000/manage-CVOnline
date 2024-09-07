package com.tech.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.tech.entity.CV;

@Repository
public interface cvDAO extends JpaRepository<CV, Integer> {

	List<CV> getApplicantById(Integer id);
	
	List<CV> findByJobPostingId(Integer jobPostingId);

	List<CV> findByApplicantId(Integer applicantId);
	
	List<CV> findCVByApplicantId(Integer applicantId);
	
	@Query("SELECT COUNT(c) FROM CV c")
    long countCVs();
	
	@Query("SELECT cv FROM CV cv WHERE cv.jobPosting.id = :jobPostingId " +
		       "AND ((:keyword IS NULL OR cv.applicant.fullname LIKE %:keyword%) " +
		       "OR (:keyword IS NULL OR cv.jobPosting.jobTitle LIKE %:keyword%)) " +
		       "AND (:date IS NULL OR cv.creationDate = :date)")
	    List<CV> findByJobPostingIdAndKeywordAndDate(@Param("jobPostingId") Integer jobPostingId, 
	                                                 @Param("keyword") String keyword, 
	                                                 @Param("date") LocalDate date);

	
	CV getCVById(Integer id);
	
}
