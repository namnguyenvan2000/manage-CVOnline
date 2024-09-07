package com.tech.entity;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class Account {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	String email;
	String password;
	@ManyToOne
	@JoinColumn(name = "role_id")
	private Role role;
	@OneToOne(mappedBy = "account")
	private Applicant applicant;
	@OneToOne(mappedBy = "account")
	private Employer employer;
}
