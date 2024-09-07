package com.tech.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor

public class Job_detail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String jobDescription;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String quanlity;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String jobRequirements;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String jobType;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String experience;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String jobVacancy;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String benefits;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String salary;
	@OneToOne@JoinColumn(name = "jobPosting_id")
	private Job_posting jobPosting;
}
