package com.tech.entity;

import java.util.List;

import org.hibernate.annotations.Cascade;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor

public class Employer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String namecompany;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String address;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String phone;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String introduction;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String taxcode;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String website;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String logo;
	@OneToOne
	@JoinColumn(name = "account_id")	
	private Account account;
	@OneToMany(mappedBy = "employer",cascade = CascadeType.ALL)
	List<Job_posting> job_postings;
}
