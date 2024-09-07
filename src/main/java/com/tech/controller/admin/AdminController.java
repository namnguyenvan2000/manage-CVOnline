package com.tech.controller.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.Flow.Publisher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tech.entity.Account;
import com.tech.entity.Employer;
import com.tech.entity.Job_detail;
import com.tech.entity.Job_posting;
import com.tech.repository.JobPostingDAO;
import com.tech.repository.accountDAO;
import com.tech.repository.cvDAO;
import com.tech.repository.employerDAO;
import com.tech.repository.jobDetailDAO;
import com.tech.service.AccountService;
import com.tech.service.AdminService;
import com.tech.service.DashBoardService;
import com.tech.service.EmailSerivce;
import com.tech.service.EmployerService;
import com.tech.service.JobDetailService;
import com.tech.service.JobPostingService;
import com.tech.service.SessionService;

@Controller
public class AdminController {

	@Autowired
	private JobPostingDAO jobPostingDao;

	@Autowired
	private jobDetailDAO jobDetailDAO;

	@Autowired
	private JobPostingService jobPostingService;

	@Autowired
	private JobDetailService jobDetailService;

	@Autowired
	private employerDAO employerDAO;
	
	@Autowired
    private cvDAO cvDAO;
	
	@Autowired
	private accountDAO accountDAO;

	@Autowired
	AccountService accService;

	@Autowired
	SessionService sesionService;

	@Autowired
	EmployerService empService;
	
	@Autowired
	DashBoardService dashBoardService;
	
	@Autowired
	AdminService adminService;
	
	@GetMapping("/admin/index")
    public String trangChu(Model model){
    	long jobPostingCount = jobPostingDao.countJobPostings();
        long cvCount = cvDAO.countCVs();
        long accountCount = accountDAO.countAccounts();

        model.addAttribute("jobPostingCount", jobPostingCount);
        model.addAttribute("cvCount", cvCount);
        model.addAttribute("accountCount", accountCount);
        return "admin/index/indexadmin";
    }
    
    @GetMapping("/admin/chartTinTuyenDung")
    public String chartTTD(Model model) {
    	long jobPostingCount = jobPostingDao.countJobPostings();
        model.addAttribute("jobPostingCount", jobPostingCount);
    	return "admin/index/ChartTinTuyenDung";
    }
    
    @GetMapping("/api/dashboard/statsTTD")
    public ResponseEntity<Map<String, Integer>> getDashboardStats() {
        Map<String, Integer> stats = dashBoardService.getDashboardStats();
        return ResponseEntity.ok(stats);
    }
    
    @GetMapping("/admin/chartCV")
    public String chartCV(Model model) {
    	long jobPostingCount = jobPostingDao.countJobPostings();
        model.addAttribute("jobPostingCount", jobPostingCount);
    	return "admin/index/ChartTinTuyenDung";
    }
    
    @GetMapping("/admin/nhatuyendung")
    public String nhaTuyenDung(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        List<Employer> employers;
        if (keyword != null && !keyword.isEmpty()) {
            employers = empService.searchEmployersByKeyword(keyword);
        } else {
            employers = empService.getAllEmployers();
        }
        model.addAttribute("employers", employers);
        return "admin/nhatuyendung/view_nhatuyendung";
    }
    
	@GetMapping("/admin/tintuyendung")
	public String tinTuyenDung(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
		jobPostingService.updateJobStatuses();
		List<Job_posting> activeJobs = jobPostingService.getCurrentJobPostings();
		if (keyword != null && !keyword.isEmpty()) {
			activeJobs = jobPostingService.searchJobPostingsByKeyword(keyword);
		} else {
			activeJobs = jobPostingService.getCurrentJobPostings();
		}
		model.addAttribute("jobs_posting", activeJobs);
		return "admin/tintuyendung/view_tintuyendung";
	}

	@GetMapping("/admin/tintuyendung/chuyentrangthai")
	public String chuyenTrangThai(Model model, @RequestParam("id") Integer id) {
		jobPostingService.changeStatusToFilled(id);
		model.addAttribute("status_change_success", "Chuyển trạng thái thành công");
		jobPostingService.updateJobStatuses();
		List<Job_posting> activeJobs = jobPostingService.getCurrentJobPostings();
		model.addAttribute("jobs_posting", activeJobs);
		return "admin/tintuyendung/view_tintuyendung";
	}

	@GetMapping("/admin/tinhethan")
	public String tinHetHan(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
		jobPostingService.updateJobStatuses(); // Update job statuses
		List<Job_posting> filledJobs = jobPostingService.getFilledJobPostings();
		List<Job_posting> expiredJobs = jobPostingService.getExpiredJobPostings();
		// Combine both lists
		List<Job_posting> combinedJobs = new ArrayList<>();
		combinedJobs.addAll(filledJobs);
		combinedJobs.addAll(expiredJobs);

		model.addAttribute("combined_jobs", combinedJobs);
		return "admin/tintuyendung/view_tinhethan";
	}

	@GetMapping("/admin/tinhethan/deleteID")
	public String tinHetHanDeleteID(Model model, @RequestParam("id") Integer id,
			@ModelAttribute("combined_jobs") Job_posting job_posting) {
		if (jobPostingDao.findById(job_posting.getId()).isEmpty())
			return "redirect:/admin/tinhethan";
		else {
			jobDetailDAO.deleteByJobPostingId(id);
			jobPostingDao.deleteById(id);
			model.addAttribute("delete_success", "Xóa thành công");
		}
		jobPostingService.updateJobStatuses(); // Update job statuses
		List<Job_posting> filledJobs = jobPostingService.getFilledJobPostings();
		List<Job_posting> expiredJobs = jobPostingService.getExpiredJobPostings();
		// Combine both lists
		List<Job_posting> combinedJobs = new ArrayList<>();
		combinedJobs.addAll(filledJobs);
		combinedJobs.addAll(expiredJobs);

		model.addAttribute("combined_jobs", combinedJobs);
		return "admin/tintuyendung/view_tinhethan";
	}
	
	@GetMapping("/admin/thanhvien")
	public String thanhvien(Model model) {
		List<Account> employerAccounts = accService.getEmployerAccounts();
		List<Account> applicantAccounts = accService.getApplicantAccounts();

		model.addAttribute("employerAccounts", employerAccounts);
		model.addAttribute("applicantAccounts", applicantAccounts);
		return "admin/thanhvien/view_thanhvien";
	}

	@GetMapping("/admin/thongtin")
	public String caiDat() {
		return "admin/thongtin_taikhoan";
	}

	@GetMapping("/dangxuat")
	public String dangXuat() {
		return "admin/login";
	}

	@GetMapping("/admin/nhatuyendung/chitiet-nhatuyendung")
	public String chiTiet_nhaTuyenDung(@RequestParam("id") Integer id, Model model) {
		Employer employer = empService.getEmployerById(id);
		model.addAttribute("employer", employer);
		return "admin/nhatuyendung/chitiet_nhatuyendung";
	}
	
	@GetMapping("/admin/nhatuyendung/tintuyendung")
	public String tintuyendung_nhatuyendung(@RequestParam("employerId") int employerId, Model model) {
	    List<Job_posting> jobPostings  = jobPostingService.findJobPostingbyEmployerId(employerId);
	    model.addAttribute("jobPostings", jobPostings);
	    return "admin/nhatuyendung/tintuyendung_NTD";
	}

	@GetMapping("/admin/tintuyendung/chitiet-tintuyendung")
	public String chiTiet_tinTuyenDung(@RequestParam("id") Integer id, Model model) {
		Job_posting jobPosting = jobPostingService.getJobPostingById(id);
		model.addAttribute("job_posting", jobPosting);
		List<Job_detail> jobDetails = jobDetailService.findJobDetailsByJobPostingId(id);
		model.addAttribute("jobs_detail", jobDetails);
		return "admin/tintuyendung/chitiet_tintuyendung";
	}

	@PostMapping("/updateJobStatusToFilled/{id}")
	public String updateJobStatusToFilled(@PathVariable Integer id) {
		jobPostingService.updateJobStatus(id, "Đủ số lượng");
		return "redirect:/admin/tintuyendung"; // Redirect to the job postings page after updating the status
	}

	@GetMapping("/admin/ungvien/chitiet-ungvien")
	public String chiTiet_ungVien() {
		return "admin/ungvien/chitiet_ungvien";
	}

	@GetMapping("/admin/ungvien/chitiet-ungvien/chitiet-hoso")
	public String chiTiet_hoSo() {
		return "admin/ungvien/chitiet_ungvien_hoso";
	}

	@GetMapping("/admin/ungvien/chitiet-ungvien/chitiet-giaoduc-chungchi")
	public String chiTiet_giaoDuc_chungChi() {
		return "admin/ungvien/chitiet_ungvien_giaoduc-chungchi";
	}

	@GetMapping("/admin/ungvien/chitiet-ungvien/chitiet-kynang")
	public String chiTiet_kyNang() {
		return "admin/ungvien/chitiet_ungvien_kynang";
	}

	@GetMapping("/admin/ungvien/chitiet-ungvien/chitiet-kinhnghiem")
	public String chiTiet_kinhNghiem() {
		return "admin/ungvien/chitiet_ungvien_kinhnghiem";
	}

}
