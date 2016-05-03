package com.univ.rennes.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="besoin_demande")
public class BesoinDemande {
	
	
	@Id
	@GeneratedValue
	@Column(name="id_besoin_demande")
	private Integer id;
	
	@Column(name="libelle_besoin_demande")
	private String libelleBesoinDemande;
	
	@OneToOne
	@JoinColumn(name="id_type_demande")
	private TypeDemande typeDemande;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLibelleBesoinDemande() {
		return libelleBesoinDemande;
	}

	public void setLibelleBesoinDemande(String libelleBesoinDemande) {
		this.libelleBesoinDemande = libelleBesoinDemande;
	}

	public TypeDemande getTypeDemande() {
		return typeDemande;
	}

	public void setTypeDemande(TypeDemande typeDemande) {
		this.typeDemande = typeDemande;
	}
	
	

}
