package com.tech.repository;



import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tech.entity.Account;


public interface accountDAO extends JpaRepository<Account, Integer>{
	
	@Query("SELECT a FROM Account a JOIN a.role r WHERE r.nameRole = 'employer'")
	List<Account> findEmployerAccounts();

	@Query("SELECT a FROM Account a JOIN a.role r WHERE r.nameRole = 'applicant'")
	List<Account> findApplicantAccounts();
	
	@Query("SELECT COUNT(a) FROM Account a")
    long countAccounts();
	
	Account findByEmail(String email);
}
