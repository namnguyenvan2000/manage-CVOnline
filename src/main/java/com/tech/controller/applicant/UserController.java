package com.tech.controller.applicant;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import org.springframework.util.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.tech.entity.Account;
import com.tech.entity.Applicant;
import com.tech.entity.CV;
import com.tech.entity.Employer;
import com.tech.entity.Job_detail;
import com.tech.entity.Job_posting;
import com.tech.entity.Password;
import com.tech.entity.Role;
import com.tech.repository.JobPostingDAO;
import com.tech.repository.accountDAO;
import com.tech.repository.applicantDAO;
import com.tech.repository.cvDAO;
import com.tech.repository.employerDAO;
import com.tech.service.AccountService;
import com.tech.service.ApplicantService;
import com.tech.service.CvService;
import com.tech.service.EmailSerivce;
import com.tech.service.EmployerService;
import com.tech.service.JobDetailService;
import com.tech.service.JobPostingService;
import com.tech.service.OTPService;
import com.tech.service.PasswordGenerator;
import com.tech.service.RegistrationService;
import com.tech.service.SessionService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.data.domain.Pageable;

@Controller
public class UserController {

	@Autowired
	private JobPostingService jobPostingService;
	
	@Autowired
	private cvDAO cvDAO;
	
	@Autowired
	SessionService session;
	
	@Autowired
	applicantDAO appdao;
	
	@Autowired
	accountDAO accountDAO;
	
	@Autowired
	employerDAO employerDAO;
	
	@Autowired
	JobPostingDAO jobPostingDAO;
	
	@Autowired
	CvService cvservice;
	
	@Autowired
	ApplicantService appService;
	
	@Autowired
	AccountService accountService;

	@Autowired
	EmployerService empService;

	@Autowired
	JobDetailService jobDetailService;

	@Autowired
	RegistrationService registrationService;

	@Autowired
	EmailSerivce emailService;

	@Autowired
	OTPService otpService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@GetMapping("/")
	public String home () {
		return "redirect:public/index";
	}

	@GetMapping("/public/index")
	public String showIndexPage(
	        Model model,
	        @RequestParam(value = "page", defaultValue = "1") int page,
	        @RequestParam(value = "size", defaultValue = "6") int size
	        ) {

	    // Paginated active job postings
		Pageable pageable = PageRequest.of(page - 1, size);
	    Page<Job_posting> activeJobsPage = jobPostingService.getCurrentJobPostings(pageable);

	    List<Job_posting> latestJobs = jobPostingDAO.findLatestJobPostings();
		List<Job_posting> highestSalaryJobs = jobPostingDAO.findJobPostingsByHighestSalary();

	    // Add paginated job postings to the model
	    model.addAttribute("jobPostings", activeJobsPage.getContent());
	    model.addAttribute("latestJobs", latestJobs);
        model.addAttribute("highestSalaryJobs", highestSalaryJobs);

	    // Add pagination info to the model
	    model.addAttribute("totalPages", activeJobsPage.getTotalPages());
	    model.addAttribute("currentPage", page - 1);
	    return "public/index";
	}

	@GetMapping("/login")
	public String showLogin(@RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout,
            Model model) {
		if (error != null) {
            model.addAttribute("errorMessage", "Email hoặc mật khẩu không đúng!");
        }
        if (logout != null) {
            model.addAttribute("logoutMessage", "Bạn đã đăng xuất thành công.");
        }
		return "public/login";
	}

	@GetMapping("/user/change-password")
	public String changePassword(Model model) {	
		model.addAttribute("account", new Account());
		return "user/change-password";
	}
	
	@PostMapping("/user/change-password")
	public String changePassword(@ModelAttribute("passwordForm") Password passwordForm,
	                             Principal principal, Model model) {
	    try {
	        // Lấy email người dùng từ Principal
	        String email = principal.getName();

	        if (email == null || email.isEmpty()) {
	            model.addAttribute("errorMessage", "User is not logged in");
	            return "user/change-password";
	        }

	        // Tìm tài khoản người dùng từ cơ sở dữ liệu
	        Account account  = session.get("account");
	        Applicant applicant = appdao.findByAccountId(account.getId());
			//Lấy dữ liệu applicant người dùng
			session.set("applicant", applicant);

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
	        }
	    } catch (Exception e) {
	        model.addAttribute("errorMessage", "Lỗi đổi mật khẩu không đúng hoặc chưa nhập!");
	        e.printStackTrace();
	    }

	    return "user/change-password";
	}

	@GetMapping("/public/forgot-password")
	public String forgotPassword() {
		return "public/forgot-password";
	}
	
	@PostMapping("/public/forgot-password")
	public String forgotPassword(@RequestParam("email") String email, RedirectAttributes redirectAttributes, Model model) {
	    try {
	        // Kiểm tra xem email có tồn tại trong cơ sở dữ liệu không
	        Account account = accountService.findByEmail(email);
	        if (account != null) {
	            // Tạo mật khẩu mới
	            String newPassword = PasswordGenerator.generateRandomPassword();
	            
	            // Mã hóa mật khẩu mới
	            String encodedPassword = passwordEncoder.encode(newPassword);

	            // Cập nhật mật khẩu vào cơ sở dữ liệu
	            account.setPassword(encodedPassword);
	            accountService.save(account);
	            
	            // Gửi email với mật khẩu mới
	            emailService.sendPasswordResetEmail(email, newPassword);

	            // Thông báo thành công
	            redirectAttributes.addFlashAttribute("message", "Mật khẩu đã được gửi đến email của bạn.");
	        } else {
	            // Thông báo lỗi nếu email không tồn tại
	        	model.addAttribute("error", "Email không tồn tại trong hệ thống.");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        redirectAttributes.addFlashAttribute("error", "Có lỗi xảy ra. Vui lòng thử lại sau.");
	    }

	    return "redirect:/login";
	}


	@GetMapping("/user/profile-user")
	public String showUserProfile(Model model, Principal principal) {
		Account account  = session.get("account");
		Applicant applicant = appdao.findByAccountId(account.getId());
		//Lấy dữ liệu applicant người dùng
		session.set("applicant", applicant);
        model.addAttribute("applicant", applicant);
        model.addAttribute("cvCount", applicant.getCvs().size());
		return "user/profile-user";
	}
	
	@PostMapping("/profile-user/update")
	public String updateUserProfile(RedirectAttributes redirectAttributes, @ModelAttribute("applicant") Applicant updatedApplicant, Principal principal) {
	    Account account = session.get("account");
	    Applicant applicant = appdao.findByAccountId(account.getId());
	    session.set("applicant", applicant);
	   
	    
	    // Cập nhật thông tin của Applicant
	    applicant.setFullname(updatedApplicant.getFullname());
	    applicant.setDateofbirth(updatedApplicant.getDateofbirth());
	    applicant.setPhone(updatedApplicant.getPhone());
	    applicant.setGender(updatedApplicant.getGender());
	    applicant.setAddress(updatedApplicant.getAddress());
	    
	    // Lưu thay đổi vào cơ sở dữ liệu
	    appService.save(applicant);
	    // Thêm thông báo thành công vào model
	    redirectAttributes.addFlashAttribute("successMessage", "Thay đổi thông tin thành công.");
	    
	    return "redirect:/user/profile-user";
	}

	@GetMapping("/public/register")
	public String showRegisterEmployer() {
		return "public/register-employer";
	}

	@PostMapping("/public/registerEmployer")
	public String registerEmployer(@RequestParam String email, @RequestParam String password,
			@RequestParam String confirmPassword, @RequestParam String namecompany, @RequestParam String address,
			@RequestParam String phone, @RequestParam String introduction, @RequestParam String taxcode,
			@RequestParam String website, @RequestParam("logo") MultipartFile logo, RedirectAttributes redirectAttributes, HttpSession session) {
		if (!password.equals(confirmPassword)) {
			redirectAttributes.addFlashAttribute("error", "2 Mật khẩu không trùng khớp");
			return "redirect:/public/register";
		}

		if (logo.isEmpty()) {
			redirectAttributes.addFlashAttribute("error", "Please select a logo file to upload.");
			return "redirect:/public/register";
		}

		Account accounts = accountDAO.findByEmail(email);
		Optional<Account> existingAccount = Optional.ofNullable(accounts);

		if (existingAccount.isPresent()) {
			redirectAttributes.addFlashAttribute("error", "Email đã tồn tại. Vui lòng chọn email khác.");
			return "redirect:/public/register";
		}

		Role role = new Role();
		role.setId(2);

		Account account = new Account();
		account.setEmail(email);
		account.setPassword(passwordEncoder.encode(password));
		account.setRole(role);

		Employer employer = new Employer();
		employer.setNamecompany(namecompany);
		employer.setAddress(address);
		employer.setPhone(phone);
		employer.setIntroduction(introduction);
		employer.setTaxcode(taxcode);
		employer.setWebsite(website);
		employer.setAccount(account);

		try {
			String logoFileName = saveImageFile(logo);
			employer.setLogo(logoFileName);

			// Store account and employer in session
			session.setAttribute("tempAccount", account);
			session.setAttribute("tempEmployer", employer);

			// Send OTP
			registrationService.register(employer);

			redirectAttributes.addFlashAttribute("message", "OTP đã được gửi đến email của bạn. Vui lòng kiểm tra và xác nhận.");
			return "redirect:/verifyOtp?email=" + email;
		} catch (IOException e) {
			e.printStackTrace();
			return "redirect:/public/register";
		}
	}

	@GetMapping("/public/signup")
	public String showRegisterApplicant() {
		return "public/register-applicant";
	}

	@PostMapping("/public/signup")
	public String registerUser(@RequestParam String email, @RequestParam String password,
			@RequestParam String confirmPassword, 
			@RequestParam String fullname, 
			@RequestParam String phone, 
			@RequestParam String address,
			@RequestParam String gender,
			Model model, HttpSession session,
			RedirectAttributes redirectAttributes){
		if (!password.equals(confirmPassword)) {
			model.addAttribute("error", "Xác nhận mật khẩu không trùng khớp");
			return "public/register-applicant";
		}

		Account accounts = accountDAO.findByEmail(email);
		Optional<Account> existingAccount = Optional.ofNullable(accounts);

		if (existingAccount.isPresent()) {
			model.addAttribute("error", "Email đã tồn tại. Vui lòng chọn email khác.");
			return "public/register-applicant";
		}

		Role role = new Role();
		role.setId(3);

		Account account = new Account();
		account.setEmail(email);
		account.setPassword(passwordEncoder.encode(password));
		account.setRole(role);

		Applicant applicant = new Applicant();
		applicant.setStatus("Active");		applicant.setEmail(email);
		applicant.setAddress(address);
		applicant.setFullname(fullname);
		applicant.setPhone(phone);
		applicant.setGender(gender);
		applicant.setAccount(account);

		// Store the account and applicant in the session
		session.setAttribute("tempAccount", account);
		session.setAttribute("tempApplicant", applicant);

		// Send OTP
		registrationService.signup(account);

		redirectAttributes.addFlashAttribute("message", "OTP đã được gửi đến email của bạn. Vui lòng kiểm tra và xác nhận.");
		return "redirect:/verifyOtp?email=" + email;
	}

	@GetMapping("/verifyOtp")
	public String showConfirmOtpPage(@RequestParam String email, Model model, HttpSession session) {
		model.addAttribute("email", email);
		return "public/verify-otp";
	}

	@PostMapping("/public/verifyOtp")
	public String confirmOtp(@RequestParam String email, @RequestParam String otp, RedirectAttributes redirectAttributes, HttpSession session) {
		boolean isOtpValid = registrationService.confirmOTP(email, otp);
		if (isOtpValid) {
			Account account = (Account) session.getAttribute("tempAccount");

			if (session.getAttribute("tempApplicant") != null) {
				Applicant applicant = (Applicant) session.getAttribute("tempApplicant");
				accountDAO.save(account);
				appdao.save(applicant);

				// Log or print session details for verification
				System.out.println("Applicant: " + applicant.toString());
				System.out.println("Account: " + account.toString());

				session.removeAttribute("tempApplicant");
			} else if (session.getAttribute("tempEmployer") != null) {
				Employer employer = (Employer) session.getAttribute("tempEmployer");
				accountDAO.save(account);
				employerDAO.save(employer);

				// Log or print session details for verification
				System.out.println("Employer: " + employer.toString());
				System.out.println("Account: " + account.toString());

				session.removeAttribute("tempEmployer");
			} else {
				redirectAttributes.addFlashAttribute("error", "Không tìm thấy thông tin người dùng trong phiên. Vui lòng thử lại.");
			}

			// Clear session attributes
			session.removeAttribute("tempAccount");

			// Invalidate session to remove session ID and attributes
			session.invalidate();

			redirectAttributes.addFlashAttribute("message", "Đăng ký thành công");
			return "redirect:/login";
		} else {
			redirectAttributes.addFlashAttribute("error", "Mã OTP không chính xác hoặc đã hết hạn");
			return "redirect:/verifyOtp?email=" + email;
		}
	}

	@GetMapping("/public/jd-page")
	public String showJd(Model model, String status, @RequestParam("id") Integer id) {
		List<Job_posting> activeJobs = jobPostingService.getCurrentJobPostings();
		model.addAttribute("jobPostings", activeJobs);
		List<Job_detail> jobDetails = jobDetailService.findJobDetailsByJobPostingId(id);
		model.addAttribute("jobs_detail", jobDetails);
		return "public/jd-page";
	}

	@GetMapping("/public/search")
    public String showSearch(Model model) {
        return "public/search";
    }
	
	@PostMapping("public/searchkey")
	public String searchJobPostings(@RequestParam("keywords") String keyword,
									@RequestParam(value ="jobLocation",required =false) String jobLocation,
									@RequestParam(value ="majorName",required =false) String majorName,
									@RequestParam(value ="jobType",required =false) String jobType,
									@RequestParam(value ="experience",required =false) String experience
									,RedirectAttributes redirectAttributes ) {
		List<Job_posting> jobpostings;
		
		jobpostings = jobPostingService.searchJobs(keyword,jobLocation, majorName, experience, jobType);
	   
		redirectAttributes.addFlashAttribute("jobPostings",jobpostings);

	    return "redirect:/public/search";
	}
		
	@GetMapping("/user/add_CV")
	public String add_CV(Model model, CV cv) {
		return "user/add_CV";
	}

	@PostMapping("/user/saveCV")
	public String saveCV(@RequestParam("pdffile") MultipartFile pdffile,
	                     @RequestParam("id") Integer jobPostingId, Model model,RedirectAttributes redirectAttributes){
	    Account account = session.get("account");
	    Applicant applicant = appdao.findByAccountId(account.getId());
	    session.set("applicant", applicant);

	    Job_posting jobPosting = jobPostingDAO.findById(jobPostingId).get();

	    CV cv = new CV();
	    cv.setCreationDate(LocalDate.now());
	    cv.setApplicant(applicant);
	    cv.setJobPosting(jobPosting);

	    try {
	        String pdfFileName = savePDFFile(pdffile);
	        cv.setPdffile(pdfFileName);
	    } catch (IOException e) {
	    	redirectAttributes.addFlashAttribute("message", "Error saving PDF file");
	        return "redirect:/public/jd-page?id=" + jobPostingId;
	    }

	    cvservice.saveCV(cv);
	    redirectAttributes.addFlashAttribute("message", "Bạn đã ứng tuyển thành công");
	    return "redirect:/public/jd-page?id=" + jobPostingId;
	}

	private String savePDFFile(MultipartFile pdfFile) throws IOException {
		if (pdfFile.isEmpty()) {
			throw new IOException("Failed to store empty file.");
		}

		String uploadDir = "src/main/resources/static/UploadPDF/";
		Path uploadPath = Paths.get(uploadDir);

		if (!Files.exists(uploadPath)) {
			Files.createDirectories(uploadPath);
		}

		String fileName = StringUtils.cleanPath(pdfFile.getOriginalFilename());
		Path filePath = uploadPath.resolve(fileName);

		Files.copy(pdfFile.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

		return fileName;
	}

	private String saveImageFile(MultipartFile imageFile) throws IOException {
		if (imageFile.isEmpty()) {
			throw new IOException("Failed to store empty file.");
		}

		// Directory to save the uploaded files
		String uploadDir = "src/main/resources/static/UploadLogo/";
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
	
	@GetMapping("/user/CV")
	public String managementCV(Principal principal, Model model) {
		Account account  = session.get("account");
		Applicant applicant = appdao.findByAccountId(account.getId());
		//Lấy dữ liệu applicant người dùng
		session.set("applicant", applicant);

	    // Lấy danh sách CV mà ứng viên đã ứng tuyển
	    List<CV> appliedCVs = cvservice.findByApplicantId(applicant.getId());

	    // Thêm danh sách CV vào mô hình để hiển thị
	    model.addAttribute("cvs", appliedCVs);
	    model.addAttribute("applicant", applicant);
        model.addAttribute("cvCount", applicant.getCvs().size());

	    return "user/management-CV";
	}
	
	@GetMapping("/user/chi_tiet_CV")
	public void viewCV1(@RequestParam("id") Integer id, HttpServletResponse response) {
	    try {
	        // Lấy thông tin CV dựa trên ID ứng viên
	        CV cv = cvservice.getCVById(id);

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
	    }
	}
	
	@GetMapping("/user/CV-applied")
	public String CV_applied(Model model, Principal principal) {
		Account account  = session.get("account");
		Applicant applicant = appdao.findByAccountId(account.getId());
		//Lấy dữ liệu applicant người dùng
		session.set("applicant", applicant);
        
        // Lấy danh sách CV của Applicant
        List<CV> cvs = cvservice.findCVByApplicantId(applicant.getId());
        
        // Thêm danh sách CV vào mô hình
        model.addAttribute("cvs", cvs);
        // Thêm applicant và số lượng CV vào model
        model.addAttribute("applicant", applicant);
        model.addAttribute("cvCount", applicant.getCvs().size());
	    return "user/CV-applied";
	}


}
