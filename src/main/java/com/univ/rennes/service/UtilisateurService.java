package com.univ.rennes.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.univ.rennes.model.Composante;
import com.univ.rennes.model.Utilisateur;

@Repository
public class UtilisateurService {
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public Utilisateur ajoutUtilisateur(Utilisateur utilisateur){
		
		try{
			Session session=sessionFactory.getCurrentSession();
			session.persist(utilisateur); //methode hibernate pour faire un ajout dans la session
			session.flush(); // methode hibernate pour sauvegarder l'ajout dans la BD
			return utilisateur; // retour de l'utilisateur cree
			
		}catch (Exception e){
			return null;
		}
		
	}
	
	
	@Transactional
	public Composante getComposantebyId(int id){
		try{
			Session session=sessionFactory.getCurrentSession();
			Composante composante =(Composante) session.get(Composante.class, id);// recuperer un objet à partir de sa cle primaire
			return composante;
		}catch (Exception e){
			return null;
		}
		
		
	}
	
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Composante> getAllComposante(){
		try{
			Session session=sessionFactory.getCurrentSession();
			List<Composante> list = session.createQuery("select p from Composante p").list();// recuperer un objet à partir de sa cle primaire
			return list;
		}catch (Exception e){
			return null;
		}	
	}
	
	
	

}
