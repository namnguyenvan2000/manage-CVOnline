package com.tech.service;

import java.security.SecureRandom;

public class PasswordGenerator {
	private static final String ALPHANUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    private static final int PASSWORD_LENGTH = 6;

    public static String generateRandomPassword() {
        SecureRandom random = new SecureRandom();
        StringBuilder password = new StringBuilder(PASSWORD_LENGTH);

        for (int i = 0; i < PASSWORD_LENGTH; i++) {
            int index = random.nextInt(ALPHANUMERIC_STRING.length());
            password.append(ALPHANUMERIC_STRING.charAt(index));
        }

        return password.toString();
    }
}
