package com.tech.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class SessionService {
	@Autowired
	HttpSession session;
	@SuppressWarnings("uncheck")

	/*
	 * Đọc giá trị của attribute trong session

	 */
	public <T> T get(String key) {
	    return (T) session.getAttribute(key);
	}
	/**
	* Thay đổi hoặc tạo mới attribute trong session
	* @param name tên attribute
	* @param value giá trị attribute
	*/
	public void set(String key, Object value) {
		session.setAttribute(key, value);
	}
	/**
	* Xóa attribute trong session
	* @param name tên attribute cần xóa
	*/
	public void remove(String name) {
		session.removeAttribute(name);
	}
	
}
