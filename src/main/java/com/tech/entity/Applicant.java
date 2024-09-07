package com.tech.entity;

import java.util.List;

import jakarta.annotation.sql.DataSourceDefinitions;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Applicant {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String fullname;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String email;;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String dateofbirth;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String phone;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String status;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String address;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String gender;
	@OneToOne
	@JoinColumn(name = "account_id")
	private Account account;
	@OneToMany(mappedBy = "applicant")
	private List<CV> cvs;
}
