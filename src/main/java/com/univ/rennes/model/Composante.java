package com.univ.rennes.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="composante")
public class Composante {
	
	@Id
	@GeneratedValue
	@Column(name="id_composante")
	private Integer id;
	
	@Column(name="libelle_composante")
	private String libelle_composante;
	
	@Column(name="niveau_composante")
	private int niveau_composante;
	
	@OneToOne
	@JoinColumn(name="ascendant_composante", nullable=true)
	private Composante ascendant;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLibelle_composante() {
		return libelle_composante;
	}

	public void setLibelle_composante(String libelle_composante) {
		this.libelle_composante = libelle_composante;
	}

	public int getNiveau_composante() {
		return niveau_composante;
	}

	public void setNiveau_composante(int niveau_composante) {
		this.niveau_composante = niveau_composante;
	}

	public Composante getAscendant() {
		return ascendant;
	}

	public void setAscendant(Composante ascendant) {
		this.ascendant = ascendant;
	}

	
	
	
	
	

}
