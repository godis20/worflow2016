package com.univ.rennes.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="statut_demande")
public class StatutDemande {
	
	
	
	@Id
	@GeneratedValue
	@Column(name="id_statut_demande")
	private Integer id;
	
	@Column(name="libelle_statut")
	private String libelleStatut;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLibelleStatut() {
		return libelleStatut;
	}

	public void setLibelleStatut(String libelleStatut) {
		this.libelleStatut = libelleStatut;
	}
	
	
	

}
