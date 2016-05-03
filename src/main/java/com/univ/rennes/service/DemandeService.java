package com.univ.rennes.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.univ.rennes.model.Composante;
import com.univ.rennes.model.Demande;
import com.univ.rennes.model.TypeDemande;
import com.univ.rennes.model.Utilisateur;

/**
 * @author Godis BODIE
 *
 */
@Repository
@SuppressWarnings("unchecked")
public class DemandeService {

	@Autowired
	SessionFactory sessionFactory;
	
	
	
	/**
	 * methode qui recupere un utilisateur dans la BD avec le login (email) de celui ci
	 *
	 */
	
	
	
	@Transactional
	public List<TypeDemande> getTypeListeDemande(){
		
		Session session=sessionFactory.getCurrentSession();
		
		List<TypeDemande> list=session.createQuery("select t from TypeDemande t").list();
				
		return list;
	}
	
	/**
	 * methode qui effectue l'ajout d'une demande cree  par l'utilisateur dans la BD
	 *
	 */
	@Transactional
	public Demande ajoutDemande(Demande demande){
			
		try{
		
				Session session=sessionFactory.getCurrentSession();
				session.persist(demande); //methode hibernate pour faire un ajout dans la session
				session.flush(); // methode hibernate pour sauvegarder l'ajout dans la BD
				return demande; // retour de l'utilisateur cree
		
		} catch (Exception e){
			
				return null;
		}
		
	}
	
}
