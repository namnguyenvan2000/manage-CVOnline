package com.tech.controller.employer;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.Flow.Publisher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tech.entity.Account;
import com.tech.entity.Applicant;
import com.tech.entity.CV;
import com.tech.entity.Employer;
import com.tech.entity.Job_detail;
import com.tech.entity.Job_posting;
import com.tech.entity.Password;
import com.tech.repository.JobPostingDAO;
import com.tech.repository.accountDAO;
import com.tech.repository.applicantDAO;
import com.tech.repository.employerDAO;
import com.tech.repository.jobDetailDAO;
import com.tech.service.AccountService;
import com.tech.service.ApplicantService;
import com.tech.service.CvService;
import com.tech.service.EmployerService;
import com.tech.service.JobDetailService;
import com.tech.service.JobPostingService;
import com.tech.service.SessionService;

import jakarta.servlet.http.HttpServletResponse;

@Controller
public class EmployeerController {

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	@Autowired
	JobPostingDAO jobDao;
	@Autowired
	SessionService session;
	@Autowired
	employerDAO empDao;
	@Autowired
	EmployerService empService;
	@Autowired
	applicantDAO appDao;
	@Autowired
	accountDAO accountDAO;
	@Autowired
	JobPostingDAO jobPostingDAO;
	@Autowired
	JobPostingService jobPostingService;
	@Autowired
	JobDetailService jobDetailService;
	@Autowired
	EmployerService employerService;
	@Autowired
	AccountService accountService;
	@Autowired
	ApplicantService applicantService;
	@Autowired
	CvService cvService;

	@GetMapping("/employer/change-password-employer")
	public String doimatkhau(Model model) {
		model.addAttribute("account", new Account());
		return "employer_N/change-password-employer";
	}

	@PostMapping("/change-password-employer")
	public String changePassword(@ModelAttribute("passwordForm") Password passwordForm, Principal principal,
			Model model) {
		try {
			// Lấy email người dùng từ Principal
			String email = principal.getName();

			if (email == null || email.isEmpty()) {
				model.addAttribute("errorMessage", "User is not logged in");
				return "employer_N/change-password-employer";
			}

			// Tìm tài khoản người dùng từ cơ sở dữ liệu
			Account account = accountService.findByEmail(email);

			if (account != null) {
				// So sánh mật khẩu cũ với mật khẩu hiện tại
				String currentPassword = account.getPassword();

				if (passwordEncoder.matches(passwordForm.getOldPassword(), currentPassword)) {
					// Kiểm tra mật khẩu mới không trùng với mật khẩu cũ
					if (passwordEncoder.matches(passwordForm.getNewPassword(), currentPassword)) {
						model.addAttribute("errorMessage", "Mật khẩu mới không được trùng với mật khẩu cũ!");
					} else if (passwordForm.getNewPassword().equals(passwordForm.getConfirmNewPassword())) {
						// Mã hóa mật khẩu mới và cập nhật vào tài khoản
						String encodedPassword = passwordEncoder.encode(passwordForm.getNewPassword());
						account.setPassword(encodedPassword);
						accountDAO.save(account); // Lưu tài khoản với mật khẩu đã thay đổi
						model.addAttribute("successMessage", "Đổi mật khẩu thành công!");
						model.addAttribute("passwordChanged", true);
						return "redirect:/login";
					} else {
						model.addAttribute("errorMessage", "Mật khẩu mới và mật khẩu xác nhận không khớp!");
					}
				} else {
					model.addAttribute("errorMessage", "Mật khẩu cũ không hợp lệ!");
				}
			} else {
				model.addAttribute("errorMessage", "Không tìm thấy tài khoản người dùng!");
			}
		} catch (Exception e) {
			model.addAttribute("errorMessage", "Lỗi đổi mật khẩu không đúng hoặc chưa nhập!");
			e.printStackTrace();
		}

		return "redirect:/change-password-employer";
	}

	@GetMapping("/employer/JobPosting")
	public String showPub(Model model, Principal principal) {

		// Lấy Employer bằng email (sử dụng Principal để lấy email)
		String employerEmail = principal.getName();
		// Lấy thông tin Employer từ cơ sở dữ liệu dựa trên email
		Account account = accountService.findByEmail(employerEmail);
		// Lấy thông tin Employer từ account
		Employer employer = empService.findbyAccountId(account.getId());

		model.addAttribute("employer", employer);
		model.addAttribute("JobCount", employer.getJob_postings().size());
		// Truyền đường dẫn hình ảnh
	    String logoUrl;
	    if (employer.getLogo() != null && !employer.getLogo().isEmpty()) {
	        // Sử dụng đường dẫn URL để truy cập file
	        logoUrl = "/images/" + employer.getLogo(); 
	    } else {
	        logoUrl = "/images/default.png"; // Đường dẫn tới ảnh mặc định nếu không có logo
	    }

	    model.addAttribute("logoUrl", logoUrl);
		return "employer_N/tintuyendung_N/save_JobPosting";
	}

	@PostMapping("/employer/save_Job-posting")
	public String saveJob_posting(Model model, Job_posting job_posting, Job_detail job_detail) {
		// Retrieve the logged-in user's details
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName(); // Get the email of the logged-in user

		// Fetch the Account associated with the email
		Account account = accountDAO.findByEmail(email);

		// Ensure the account has an associated employer
		if (account != null && account.getEmployer() != null) {
			Employer employer = account.getEmployer();
			job_posting.setEmployer(employer);
		} else {
			model.addAttribute("error", "Hãy nhập đầy đủ thông tin");
			return "employer/tintuyendung_N/save_JobPosting";
		}

		// Set other job posting details
		job_posting.setStatus("Còn hạn");
		job_posting.setJobPostingDate(LocalDate.now());

		// Save the job posting along with job details
		jobPostingService.saveJobPostingWithDetails(job_posting, job_detail);

		model.addAttribute("saveJobPosting_success", "Job Posting saved successfully");
		return "redirect:/employer/JobPosting";
	}

	@GetMapping("/employer/recruitment-management")
	public String showRecruitment(@RequestParam(value = "keyword", required = false) String keyword, Model model, Principal principal) {
		// Lấy email của người dùng đã đăng nhập
	    String email = principal.getName();
	    
	    // Lấy thông tin Employer từ cơ sở dữ liệu dựa trên email
	    Account account = accountService.findByEmail(email);
	    Employer employer = empService.findbyAccountId(account.getId());
	    
	    if (employer != null) {
	        Integer employerId = employer.getId();
	        
	        List<Job_posting> activeJobs;
	        if (keyword != null && !keyword.isEmpty()) {
	            activeJobs = employerService.searchJobPostingsByKeyword(keyword);
	        } else {
	            activeJobs = employerService.getActiveJobPostingsByEmployer(employerId);
	        }
	        
	        model.addAttribute("JobPostingList", activeJobs);
	    }
	    model.addAttribute("employer", employer);
        model.addAttribute("JobCount",employer.getJob_postings().size());
     // Truyền đường dẫn hình ảnh
	    String logoUrl;
	    if (employer.getLogo() != null && !employer.getLogo().isEmpty()) {
	        // Sử dụng đường dẫn URL để truy cập file
	        logoUrl = "/images/" + employer.getLogo(); 
	    } else {
	        logoUrl = "/images/default.png"; // Đường dẫn tới ảnh mặc định nếu không có logo
	    }

	    model.addAttribute("logoUrl", logoUrl);
	    return "employer_N/tintuyendung_N/recruitment-management";
	}	

	
	@GetMapping("/employer/recruitment-management/filled")
	public String changeRecruitment(Model model, @RequestParam("id") Integer id) {
		jobPostingService.changeStatusToFilled(id);
		model.addAttribute("status_change_success", "Chuyển trạng thái thành công");
		jobPostingService.updateJobStatuses();
		List<Job_posting> activeJobs = jobPostingService.getCurrentJobPostings();
		model.addAttribute("jobs_posting", activeJobs);
		return "redirect:/employer/recruitment-management";
	}
	
	@GetMapping("/employer/recruitment-management/delete")
	public String deleteJobPosting(Model model, @RequestParam("id") Integer id) {
	    try {
	        jobPostingService.deleteJobPostingAndDetails(id);
	        model.addAttribute("status_delete_success", "Xóa tin tuyển dụng thành công");
	    } catch (Exception e) {
	        model.addAttribute("status_delete_fail", "Xóa tin tuyển dụng thất bại");
	    }
	    List<Job_posting> activeJobs = jobPostingService.getCurrentJobPostings();
	    model.addAttribute("jobs_posting", activeJobs);
	    return "redirect:/employer/recruitment-management";
	}
	
	@GetMapping("/employer/recruitment-detail")
	public String showRecruitmentDetail(String status, @RequestParam("id") Integer id, Model model) {
		List<Job_posting> activeJobs = jobPostingService.getCurrentJobPostings();
		model.addAttribute("jobPostings", activeJobs);
		List<Job_detail> jobDetails = jobDetailService.findJobDetailsByJobPostingId(id);
		model.addAttribute("jobs_detail", jobDetails);
		return "employer_N/tintuyendung_N/recruitment-detail";
	}

	@GetMapping("/employer/profile_employer")
	public String showProfile(Model model) {
	    Account account  = session.get("account");
	    Employer employer = empDao.findByAccountId(account.getId());
	    session.set("employer", employer);

	    model.addAttribute("employer", employer);
	    model.addAttribute("JobCount", employer.getJob_postings().size());

	    // Truyền đường dẫn hình ảnh
	    String logoUrl;
	    if (employer.getLogo() != null && !employer.getLogo().isEmpty()) {
	        // Sử dụng đường dẫn URL để truy cập file
	        logoUrl = "/images/" + employer.getLogo(); 
	    } else {
	        logoUrl = "/images/default.png"; // Đường dẫn tới ảnh mặc định nếu không có logo
	    }

	    model.addAttribute("logoUrl", logoUrl);

	    return "employer_N/profile-employer";
	}

	@PostMapping("/employer/profile-employer/update")
	public String updateProfile(RedirectAttributes redirectAttributes, @RequestParam("logoFile") MultipartFile logoFile,
			@ModelAttribute("employer") Employer updatedEmployer, Principal principal) {
		Account account  = session.get("account");
		Employer employer = empDao.findByAccountId(account.getId());
		//Lấy dữ liệu applicant người dùng
		session.set("employer", employer);

		// Cập nhật thông tin
		employer.setNamecompany(updatedEmployer.getNamecompany());
		employer.setAddress(updatedEmployer.getAddress());
		employer.setPhone(updatedEmployer.getPhone());
		employer.setTaxcode(updatedEmployer.getTaxcode());
		employer.setWebsite(updatedEmployer.getWebsite());
		employer.setIntroduction(updatedEmployer.getIntroduction());
		if (logoFile != null && !logoFile.isEmpty()) {
			try {
				String logoFileName = updateLogoFile(logoFile, employer.getLogo());
				employer.setLogo(logoFileName);
			} catch (IOException e) {
				e.printStackTrace();
				redirectAttributes.addFlashAttribute("message", "Upload logo failed!");
				return "redirect:/employer/profile_employer";
			}
		}

		employerService.save_NTD(employer);
		// Thêm thông báo thành công vào model
		redirectAttributes.addFlashAttribute("successMessage", "Thay đổi thông tin thành công.");

		return "redirect:/employer/profile_employer";
	}

	private String updateLogoFile(MultipartFile imageFile, String currentLogoFileName) throws IOException {
		if (imageFile.isEmpty()) {
			throw new IOException("Failed to store empty file.");
		}

		// Directory to save the uploaded files
		String uploadDir = "C:/Users/Bin77/OneDrive/Desktop/testDATN/UploadLogo/";
		Path uploadPath = Paths.get(uploadDir);

		if (!Files.exists(uploadPath)) {
			Files.createDirectories(uploadPath);
		}

		// Get the original file name
		String newFileName = StringUtils.cleanPath(imageFile.getOriginalFilename());
		Path newFilePath = uploadPath.resolve(newFileName);

		// Xóa logo cũ nếu có
		if (currentLogoFileName != null && !currentLogoFileName.isEmpty()) {
			Path oldFilePath = uploadPath.resolve(currentLogoFileName);
			Files.deleteIfExists(oldFilePath);
		}

		// Lưu logo mới
		Files.copy(imageFile.getInputStream(), newFilePath, StandardCopyOption.REPLACE_EXISTING);

		// Return the new file name to store in the database
		return newFileName;
	}

	@PostMapping("/save_NTD")
	public String save_NTD(@RequestParam("logo") MultipartFile logo, @RequestParam("namecompany") String namecompany,
			@RequestParam("address") String address, @RequestParam("phone") String phone,
			@RequestParam("taxcode") String taxcode, @RequestParam("website") String website,
			@RequestParam("introduction") String introduction, Model model) {
		Employer emp = new Employer();
		emp.setNamecompany(namecompany);
		emp.setAddress(address);
		emp.setPhone(phone);
		emp.setTaxcode(taxcode);
		emp.setWebsite(website);
		emp.setIntroduction(introduction);

		try {
			String logoFileName = saveImageFile(logo);
			emp.setLogo(logoFileName); // Store only the file name
		} catch (IOException e) {
			model.addAttribute("message", "Error saving image file");
			return "redirect:/profile_employer";
		}

		empService.save_NTD(emp);
		model.addAttribute("message", "NTD saved successfully");
		return "redirect:/profile_employer";
	}

	private String saveImageFile(MultipartFile imageFile) throws IOException {
		if (imageFile.isEmpty()) {
			throw new IOException("Failed to store empty file.");
		}

		// Directory to save the uploaded files
		String uploadDir = "C:/Users/Bin77/OneDrive/Desktop/testDATN/UploadLogo/";
		Path uploadPath = Paths.get(uploadDir);

		if (!Files.exists(uploadPath)) {
			Files.createDirectories(uploadPath);
		}

		// Get the original file name
		String fileName = StringUtils.cleanPath(imageFile.getOriginalFilename());
		Path filePath = uploadPath.resolve(fileName);

		// Save the file to the specified directory
		Files.copy(imageFile.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

		// Return only the file name to store in the database
		return fileName;
	}

	@GetMapping("/employer/candidate-management")
	public String showApplicant(@RequestParam(value = "keyword", required = false) String keyword, 
					            @RequestParam(value = "date", required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date,
					            Model model, Principal principal){
		// Lấy Employer bằng email (sử dụng Principal để lấy email)
        String employerEmail = principal.getName();
        // Lấy thông tin Employer từ cơ sở dữ liệu dựa trên email
	    Account account = accountService.findByEmail(employerEmail);
	    // Lấy thông tin Employer từ account
        Employer employer = empService.findbyAccountId(account.getId());

     // Lấy danh sách các Job_posting của Employer
        List<Job_posting> jobPostings = employer.getJob_postings();
        
        // Tạo danh sách để chứa tất cả CV của các Job_posting
        List<CV> cvs = new ArrayList<>();
        
     // Nếu từ khóa hoặc ngày nộp không null, tìm kiếm ứng viên
        if ((keyword != null && !keyword.isEmpty()) || date != null) {
            for (Job_posting jobPosting : jobPostings) {
                List<CV> cvsForJob = applicantService.searchCVsByKeywordAndDate(jobPosting.getId(), keyword, date);
                cvs.addAll(cvsForJob);
            }
        } else {
            // Không có tìm kiếm, lấy tất cả CV
            for (Job_posting jobPosting : jobPostings) {
                List<CV> cvsForJob = applicantService.getCVsByJobPostingId(jobPosting.getId());
                cvs.addAll(cvsForJob);
            }
        }

        // Truyền danh sách CV vào model để hiển thị trên trang
        model.addAttribute("cvs", cvs);
        model.addAttribute("employer", employer);
        model.addAttribute("JobCount",employer.getJob_postings().size());
     // Truyền đường dẫn hình ảnh
	    String logoUrl;
	    if (employer.getLogo() != null && !employer.getLogo().isEmpty()) {
	        // Sử dụng đường dẫn URL để truy cập file
	        logoUrl = "/images/" + employer.getLogo(); 
	    } else {
	        logoUrl = "/images/default.png"; // Đường dẫn tới ảnh mặc định nếu không có logo
	    }

	    model.addAttribute("logoUrl", logoUrl);
   
		return "employer_N/tintuyendung_N/candidate-management";
	}


	@GetMapping("/employer/view_cv")
	public void viewCV(@RequestParam("id") Integer id, HttpServletResponse response) {
		try {
			// Lấy thông tin CV dựa trên ID
			CV cv = cvService.getCVById(id);

			if (cv == null || cv.getPdffile() == null) {
				throw new IOException("CV not found or file is missing");
			}

			// Đường dẫn tới file PDF
			String fileName = cv.getPdffile();
			Path filePath = Paths.get("src/main/resources/static/UploadPDF/", fileName);

			// Kiểm tra xem file có tồn tại không
			if (!Files.exists(filePath)) {
				throw new IOException("File not found");
			}

			// Thiết lập các thuộc tính của phản hồi
			response.setContentType("application/pdf");
			response.setHeader("Content-Disposition", "inline; filename=" + fileName);

			// Đọc file và gửi dữ liệu qua phản hồi
			Files.copy(filePath, response.getOutputStream());
			response.getOutputStream().flush();
		} catch (IOException ex) {
			// Xử lý lỗi khi không tìm thấy file hoặc lỗi khác
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			try {
				response.getWriter().write("Error: " + ex.getMessage());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
