package com.tech.entity;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class Password {
	 private String oldPassword;
	    private String newPassword;
	    private String confirmNewPassword;

	    // Getter và Setter cho oldPassword
	    public String getOldPassword() {
	        return oldPassword;
	    }

	    public void setOldPassword(String oldPassword) {
	        this.oldPassword = oldPassword;
	    }

	    // Getter và Setter cho newPassword
	    public String getNewPassword() {
	        return newPassword;
	    }

	    public void setNewPassword(String newPassword) {
	        this.newPassword = newPassword;
	    }

	    // Getter và Setter cho confirmNewPassword
	    public String getConfirmNewPassword() {
	        return confirmNewPassword;
	    }

	    public void setConfirmNewPassword(String confirmNewPassword) {
	        this.confirmNewPassword = confirmNewPassword;
	    }
}
