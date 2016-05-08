package com.univ.rennes.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.univ.rennes.model.BesoinDemande;
import com.univ.rennes.model.Composante;
import com.univ.rennes.model.Demande;
import com.univ.rennes.model.LigneStatut;
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
				LigneStatut ligneStatut=new LigneStatut();
				
				Session session=sessionFactory.getCurrentSession();
				session.persist(demande); //methode hibernate pour faire un ajout dans la session
				session.flush(); // methode hibernate pour sauvegarder l'ajout dans la BD
				
				if(demande.isStatutEnvoiDemande()){
					
				ligneStatut.setId_demande(demande.getId());
				ligneStatut.setDate(demande.getDatecreationDemande());
				ligneStatut.setId_statut_demande(1);
				session.persist(ligneStatut);
				session.flush();
				
				}
				return demande; // retour de l'utilisateur cree
		
		} catch (Exception e){
			
				return null;
		}
		
	}
	
	
	/**
	 * methode qui retourne une instance de "Besoin demande" à partir de l'ID
	 *
	 */
	@Transactional
	public BesoinDemande getBesoinDemandebyId(int id){
		try{
			Session session=sessionFactory.getCurrentSession();
			BesoinDemande besoinDemande =(BesoinDemande) session.get(BesoinDemande.class, id);// recuperer un objet à partir de sa cle primaire
			return besoinDemande;
		}catch (Exception e){
			return null;
		}
		
		
	}
	
	/**
	 * methode qui recupere toutes les demandes classiques  de la BD
	 *
	 */
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Demande> getAllDemandeclas(){
		
		int id_clas=1;
		try{
			Session session=sessionFactory.getCurrentSession();
			List<Demande> list = session.createQuery("select p from Demande d"
					+ " where d.typeDemande.id = id_clas")
					.setParameter("id_clas", id_clas).list();//  recuperer la liste des demandes recherches  de la BD
			return list;
		}catch (Exception e){
			return null;
		}	
	}
	
	
	/**
	 * methode qui recupere toutes les demandes recherches  de la BD
	 *
	 */
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Demande> getAllDemanderech(){
		int id_rech=2;
		try{
			Session session=sessionFactory.getCurrentSession();
			List<Demande> list = session.createQuery("select p from Demande d"
					+ " where d.typeDemande.id = id_rech")
					.setParameter("id_rech", id_rech).list();//  recuperer la liste des demandes recherches  de la BD
			return list;
		}catch (Exception e){
			return null;
		}	
	}
	
	
	
	
	
	/**
	 * methode qui recupere une demande dans la BD à partir de son ID
	 *
	 */
	@SuppressWarnings("unchecked")
	@Transactional
	public Demande getDemandebyId(int id){
		
		try{
			Session session=sessionFactory.getCurrentSession();
			Demande demande =(Demande) session.get(Demande.class, id);
			return demande;
			
		}catch (Exception e){
			return null;
		}	
	}
	
	
	/**
	 * methode qui recupere une demande dans la BD à partir de son ID
	 *
	 */
	@SuppressWarnings("unchecked")
	@Transactional
	public Demande setDemandebyInstruction(Utilisateur instructeur, String date, String observation){
		
		try{
			Session session=sessionFactory.getCurrentSession();
			/*Demande demande =(Demande) session.get(Demande.class, date);*/
			return null;
			
		}catch (Exception e){
			return null;
		}	
	}
	
	
}
