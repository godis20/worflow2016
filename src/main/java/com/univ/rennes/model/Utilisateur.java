package com.univ.rennes.model;

import java.util.List;
import java.util.Set;

import javax.persistence.*;


@Entity
@Table(name="utilisateur")
public class Utilisateur {
	
	
	@Id
	@GeneratedValue
	@Column(name="id_utilisateur")
	private Integer id;
	
	@Column(name="nom_utilisateur")
	private String nom;
	
	@Column(name="prenom_utilisateur")
	private String prenom;
	
	@Column(name="email")
	private String email;
	
	@Column(name="password")
	private String password;
	
	@Column(name="poste")
	private String poste;
	
	@Column(name="etat_utilisateur")
	private boolean etat_utilisateur;
	
	@OneToOne
	@JoinColumn(name="id_composante")
	private Composante composante;
	
	@Column(name="datecreation_utilisateur")
	private String dateCreationUtilisateur;
	
	@OneToOne
	@JoinColumn(name="createur_utilisateur", nullable=false)
	private Utilisateur createur;
	
	
	
	

	public Utilisateur getCreateur() {
		return createur;
	}

	public void setCreateur(Utilisateur createur) {
		this.createur = createur;
	}

	public String getDateCreationUtilisateur() {
		return dateCreationUtilisateur;
	}

	public void setDateCreationUtilisateur(String dateCreationUtilisateur) {
		this.dateCreationUtilisateur = dateCreationUtilisateur;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPoste() {
		return poste;
	}

	public void setPoste(String poste) {
		this.poste = poste;
	}

	public boolean isEtat_utilisateur() {
		return etat_utilisateur;
	}

	public void setEtat_utilisateur(boolean etat_utilisateur) {
		this.etat_utilisateur = etat_utilisateur;
	}

	public Composante getComposante() {
		return composante;
	}

	public void setComposante(Composante composante) {
		this.composante = composante;
	}
	
	

}
