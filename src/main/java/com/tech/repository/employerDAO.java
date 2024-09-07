package com.tech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tech.entity.Employer;

public interface employerDAO extends JpaRepository<Employer, Integer> {
	@Query("select x from Employer x where x.namecompany Like %?1%")
	List<Employer> findByIdOrName(String keywords);
	
	List<Employer> getApplicantById(Integer id);
	
	Employer findByAccountId(Integer accountId);


	@Query("SELECT e FROM Employer e WHERE e.namecompany LIKE %:keyword% OR e.phone LIKE %:keyword% OR e.website LIKE %:keyword%")
	List<Employer> findByKeyword(String keyword);
}
