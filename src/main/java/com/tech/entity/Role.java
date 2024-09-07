package com.tech.entity;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Role {
	@Id
	Integer id;
	String nameRole;
	@OneToMany(mappedBy = "role")
	private List<Account> accounts;
}
