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
	
	
	
	/**
	 * methode qui effectue l'ajout d'un user (session de l'application) cree  par l'utilisateur dans la BD
	 *
	 */
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
	
	
	
	/**
	 * methode qui recupere tous les utilisateurs  de la BD
	 *
	 */
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Utilisateur> getAllUtilisateur(){
		try{
			Session session=sessionFactory.getCurrentSession();
			List<Utilisateur> list = session.createQuery("select p from Utilisateur p").list();//  recuperer la liste des utilisateurs de la BD
			return list;
		}catch (Exception e){
			return null;
		}	
	}
	
	
	/**
	 * methode qui recupere une composante dans la BD avec l'ID de celle ci
	 *
	 */
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
	
	
	
	/**
	 * methode qui recupere toutes les composantes  de la BD
	 *
	 */
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Composante> getAllComposante(){
		try{
			Session session=sessionFactory.getCurrentSession();
			List<Composante> list = session.createQuery("select p from Composante p").list();// recuperer la liste des composantes de la BD
			return list;
		}catch (Exception e){
			return null;
		}	
	}
	
	
	@Transactional
	public Utilisateur Connect(String email, String password){
		
		try{
			Session session=sessionFactory.getCurrentSession();
			
			Utilisateur utilisateur = (Utilisateur)session.createQuery("select p from Utilisateur p "
					+ " where p.email = :email and p.password =:pass")
					.setParameter("email", email)
					.setParameter("pass", password).uniqueResult();
			return utilisateur; 
			
		}catch (Exception e){
			return null;
		}
	
	}
	
	

}
