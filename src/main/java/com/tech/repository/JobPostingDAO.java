package com.tech.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tech.entity.Account;
import com.tech.entity.Job_posting;

@Repository
public interface JobPostingDAO extends JpaRepository<Job_posting, Integer> {
    List<Job_posting> findByStatus(String status);
    List<Job_posting> findByEmployerId(Integer employerId);
    Optional<Job_posting> findById(Integer id);

    @Query("SELECT jp FROM Job_posting jp WHERE jp.jobTitle LIKE %:keyword% OR jp.majorName LIKE %:keyword% OR jp.jobLocation LIKE %:keyword%")
    List<Job_posting> findByKeyword(@Param("keyword") String keyword);
    
    @Query("SELECT COUNT(jp) FROM Job_posting jp")
    long countJobPostings();
    
    @Modifying
    @Transactional
    @Query("UPDATE Job_posting jp SET jp.status = :status WHERE jp.id = :id")
    void updateJobStatus(@Param("id") Long id, @Param("status") String status);	
    
    

    @Query(value = "SELECT * FROM Job_posting ORDER BY job_posting_date DESC", nativeQuery = true)
    List<Job_posting> findLatestJobPostings();
    
    @Query(value = "SELECT jp.* FROM Job_posting jp JOIN Job_detail jd ON jp.id = jd.job_posting_id ORDER BY jd.salary DESC ", nativeQuery = true)
	 List<Job_posting> findJobPostingsByHighestSalary();
	 
	 @Query("SELECT jp FROM Job_posting jp WHERE jp.employer.namecompany LIKE %:employerName%")
	 List<Job_posting> findByEmployerName(@Param("employerName") String employerName);
	 
	 @Query("SELECT j FROM Job_posting j WHERE " +
	            "(:keyword IS NULL OR j.jobTitle LIKE %:keyword% OR"
	            + " j.majorName LIKE %:keyword% OR "
	            + " j.jobDetail.jobType LIKE %:keyword%) AND " +
	            "(:job_location IS NULL OR j.jobLocation LIKE %:job_location%) AND " +
	            "(:major_name IS NULL OR j.majorName LIKE %:major_name%) AND " +
	            "(:experience IS NULL OR j.jobDetail.experience LIKE %:experience%) AND " +
	            "(:job_type IS NULL OR j.jobDetail.jobType LIKE %:job_type%) AND " +
	            "(j.dealine >= CURRENT_DATE)")
	    List<Job_posting> searchJobs(@Param("keyword") String keyword,
		                             @Param("job_location") String job_location,
		                             @Param("major_name") String major_name,
		                             @Param("experience") String experience,
		                             @Param("job_type") String job_type);
}