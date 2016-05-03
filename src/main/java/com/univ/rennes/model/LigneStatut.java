package com.univ.rennes.model;

import java.io.Serializable;

import javax.persistence.*;


@Entity
@Table(name="ligne_statut")
public class LigneStatut implements Serializable{
	
	@Id
	@Column(name="id_demande", nullable = false)	
	private int id_demande;
	
	@Id
	@Column(name="id_statut_demande", nullable = false)
	private int id_statut_demande;
	
	@Column(name= "date_ligne_statut", nullable = false)
	private String date;

	
	public int getId_demande() {
		return id_demande;
	}

	public void setId_demande(int id_demande) {
		this.id_demande = id_demande;
	}

	public int getId_statut_demande() {
		return id_statut_demande;
	}

	public void setId_statut_demande(int id_statut_demande) {
		this.id_statut_demande = id_statut_demande;
	}


	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
