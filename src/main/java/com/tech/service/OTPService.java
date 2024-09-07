package com.tech.service;

import org.springframework.stereotype.Service;

import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@Service
public class OTPService {
    private final Map<String, OTPDetails> otpStorage = new HashMap<>();
    private final SecureRandom secureRandom = new SecureRandom();

    public String generateOTP(String email) {
        String otp = String.format("%06d", secureRandom.nextInt(1000000));
        LocalDateTime expiryTime = LocalDateTime.now().plusMinutes(5); // OTP valid for 5 minutes
        otpStorage.put(email, new OTPDetails(otp, expiryTime));
        return otp;
    }

    public boolean validateOTP(String email, String otp) {
        OTPDetails otpDetails = otpStorage.get(email);
        if (otpDetails == null) {
            return false;
        }
        if (LocalDateTime.now().isAfter(otpDetails.getExpiryTime())) {
            otpStorage.remove(email);
            return false;
        }
        return otpDetails.getOtp().equals(otp);
    }

    public void clearOTP(String email) {
        otpStorage.remove(email);
    }

    private static class OTPDetails {
        private final String otp;
        private final LocalDateTime expiryTime;

        public OTPDetails(String otp, LocalDateTime expiryTime) {
            this.otp = otp;
            this.expiryTime = expiryTime;
        }

        public String getOtp() {
            return otp;
        }

        public LocalDateTime getExpiryTime() {
            return expiryTime;
        }
    }
}