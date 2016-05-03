package com.univ.rennes.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="recrutement")
public class Recrutement {
	
	
	
	
	@Id
	@GeneratedValue
	@Column(name="id_recrutement")
	private Integer id;
	
	
	@Column(name="nom_agent")
	private String nomAgent;
	
	@Column(name="prenom_agent")
	private String prenomAgent;
	
	@Column(name="dateDebut_agent")
	private String dateDebutAgent;

	@Column(name="dateFin_agent")
	private String dateFinAgent;
	
	@OneToOne
	@JoinColumn(name="id_demande")
	private Demande demande;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNomAgent() {
		return nomAgent;
	}

	public void setNomAgent(String nomAgent) {
		this.nomAgent = nomAgent;
	}

	public String getPrenomAgent() {
		return prenomAgent;
	}

	public void setPrenomAgent(String prenomAgent) {
		this.prenomAgent = prenomAgent;
	}

	public String getDateDebutAgent() {
		return dateDebutAgent;
	}

	public void setDateDebutAgent(String dateDebutAgent) {
		this.dateDebutAgent = dateDebutAgent;
	}

	public String getDateFinAgent() {
		return dateFinAgent;
	}

	public void setDateFinAgent(String dateFinAgent) {
		this.dateFinAgent = dateFinAgent;
	}

	public Demande getDemande() {
		return demande;
	}

	public void setDemande(Demande demande) {
		this.demande = demande;
	}
	
	
	
	
	
}
