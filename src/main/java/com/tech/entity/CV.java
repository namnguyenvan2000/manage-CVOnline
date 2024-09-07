package com.tech.entity;

import java.sql.Date;
import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@Entity
@NoArgsConstructor
@AllArgsConstructor

public class CV {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String pdffile;
	LocalDate creationDate;
	@ManyToOne@JoinColumn(name = "applicant_id")
	private Applicant applicant;
	@ManyToOne@JoinColumn(name = "jobPosting_id")
	private Job_posting jobPosting;
}
