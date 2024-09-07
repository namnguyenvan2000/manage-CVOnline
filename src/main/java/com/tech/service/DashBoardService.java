package com.tech.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class DashBoardService {
	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	public Map<String, Integer> getDashboardStats() {
        String totalCurrentJobPostings = "SELECT COUNT(*) FROM Job_posting WHERE status = N'còn hạn'";
        String totalExpiredJobPostings = "SELECT COUNT(*) FROM Job_posting WHERE status = N'hết hạn'";
        String totalFilledJobPostings = "SELECT COUNT(*) FROM Job_posting WHERE status = N'đủ số lượng'";

        Integer totalCurrent = jdbcTemplate.queryForObject(totalCurrentJobPostings, Integer.class);
        Integer totalExpired = jdbcTemplate.queryForObject(totalExpiredJobPostings, Integer.class);
        Integer totalFilled = jdbcTemplate.queryForObject(totalFilledJobPostings, Integer.class);

        Map<String, Integer> stats = new HashMap<>();
        stats.put("totalCurrent", totalCurrent);
        stats.put("totalExpired", totalExpired);
        stats.put("totalFilled", totalFilled);

        return stats;
    }
}
