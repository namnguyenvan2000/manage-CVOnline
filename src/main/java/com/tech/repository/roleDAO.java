package com.tech.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tech.entity.Role;

public interface roleDAO extends JpaRepository<Role, Integer>{
	Role findByNameRole(String nameRole);
}
