package com.poly.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "ROLES")
public class Roles implements Serializable {

	@Id
	private String id;
	private String name;

	@JsonIgnore
	@OneToMany(mappedBy = "roles")
	List<Authorities> authorities;

}
