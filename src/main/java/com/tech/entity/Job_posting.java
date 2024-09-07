package com.tech.entity;

import java.time.LocalDate;
import java.util.List;

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
@NoArgsConstructor
@AllArgsConstructor

public class Job_posting {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String jobTitle;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String jobLocation;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String status;
	@Column(columnDefinition = "NVARCHAR(MAX)")
	String majorName;
	LocalDate jobPostingDate;
	LocalDate dealine;
	@ManyToOne
	@JoinColumn(name = "employer_id")
	private Employer employer;
	@OneToOne(mappedBy = "jobPosting")
	private Job_detail jobDetail;
	@OneToMany(mappedBy = "jobPosting")
	private List<CV> cvs;
	
	public boolean isExpired() {
        LocalDate now = LocalDate.now();
        return status.equals("Hết hạn") || dealine.isBefore(now) || dealine.isEqual(now);
    }
	public boolean isFilled() {
        // Giả sử bạn có logic để kiểm tra xem tin tuyển dụng đã đủ số lượng ứng viên hay chưa
        return false;
    }
	 public void setStatus(String status) {
	        this.status = status;
	}
}
