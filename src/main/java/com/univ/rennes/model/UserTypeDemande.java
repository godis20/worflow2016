package com.univ.rennes.model;

import java.io.Serializable;

import javax.persistence.*;

import org.hibernate.annotations.Cascade;

@Entity
@Table(name="user_typedemande")
public class UserTypeDemande implements Serializable {
	
    @Id
	@Column(name="id_utilisateur", nullable = false)
	private int  id_utilisateur;

	
	@Id
	@Column(name="id_type_demande", nullable = false)
	private int id_typeDemande;
	
		
	
	@OneToOne
	@JoinColumn(name="id_privilege", nullable = false)
	private Privilege privilege;

	
	
	
	public int getId_utilisateur() {
		return id_utilisateur;
	}

	public void setId_utilisateur(int id_utilisateur) {
		this.id_utilisateur = id_utilisateur;
	}

	public int getId_typeDemande() {
		return id_typeDemande;
	}

	public void setId_typeDemande(int id_typeDemande) {
		this.id_typeDemande = id_typeDemande;
	}

	

	public Privilege getPrivilege() {
		return privilege;
	}

	public void setPrivilege(Privilege privilege) {
		this.privilege = privilege;
	}
	
	

}
