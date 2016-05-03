package com.univ.rennes.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="privilege")
public class Privilege {
	
	
	
	
	@Id
	@GeneratedValue
	@Column(name="id_privilege")
	private Integer id;
	
	
	@Column(name="libelle_privilege")
	private String libellePrivilege;


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getLibellePrivilege() {
		return libellePrivilege;
	}


	public void setLibellePrivilege(String libellePrivilege) {
		this.libellePrivilege = libellePrivilege;
	}
	
	
	

}
