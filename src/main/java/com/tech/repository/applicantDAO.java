package com.tech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tech.entity.Applicant;

public interface applicantDAO extends JpaRepository<Applicant, Integer>{
	@Query("select x from Applicant x where x.fullname Like %?1%")
	List<Applicant> findByIdOrName(String keywords);
	Applicant findByAccountId(Integer accountId);
	Applicant findByEmail(String email);
}
