package com.univ.rennes.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.univ.rennes.model.BesoinDemande;
import com.univ.rennes.model.Demande;
import com.univ.rennes.model.LigneStatut;
import com.univ.rennes.model.Recrutement;
import com.univ.rennes.model.StatutDemande;
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
	 * Methode qui recupere un utilisateur dans la BD avec le login (email) de celui ci
	 *
	 */
	
	
	@Transactional
	public List<TypeDemande> getTypeListeDemande(){
		
		Session session=sessionFactory.getCurrentSession();
		
		List<TypeDemande> list=session.createQuery("select t from TypeDemande t").list();
				
		return list;
	}
	
	
	/**
	 * Methode qui effectue l'ajout d'une demande cree  par l'utilisateur dans la BD
	 *
	 */
	@Transactional
	public Demande ajoutDemande(Demande demande){
			
		try{
				LigneStatut ligneStatut= new LigneStatut();
				
				Session session=sessionFactory.getCurrentSession();
				
				demande.setDateDerniereModification(demande.getDatecreationDemande());
				
				session.persist(demande); //methode hibernate pour faire un ajout dans la session
				session.flush(); // methode hibernate pour sauvegarder l'ajout dans la BD
				
				if(demande.isStatutEnvoiDemande()){
					
				ligneStatut.setId_demande(demande.getId());
				ligneStatut.setDate(demande.getDatecreationDemande());
				ligneStatut.setId_statut_demande(1);
				session.persist(ligneStatut);
				session.flush();
				
				}
				return demande; // retour de la demande cree
		
		} catch (Exception e){
			
				return null;
		}
		
	}

	
	
	
	
	
	
	
	/**
	 * Methode qui met � jour une demande classique "accept�e" cloturee dans la BD 
	 *
	 */

	@Transactional
	public void setDemandeDelete(Demande demande){
		
		try{
			
			Session session=sessionFactory.getCurrentSession();
			
			session.delete(demande);
			session.flush();
	
			
		}catch (HibernateException e){
		
		}
	}
	
	
	
	
	
	
	
	/**
	 * Methode qui recupere toutes les demandes classiques en attende de la finalisation  
	 * de la procedure d'envoie. 
	 *
	 */

	@Transactional
	public List<Demande> getAllDdeclasAfinaliser(){
		
		try{
			Session session=sessionFactory.getCurrentSession();
			
			List<Demande> list = session.createQuery("select d from Demande d"
					+ " where d.typeDemande.id = '1' and d.instructeur.id= null and d.statutEnvoiDemande=false")
					.list();//  recuperer la liste des demandes classique non finalis�es  de la BD
			return list;
		}catch (Exception e){
			return null;
		}	
	}
	
	
	/**
	 * Methode qui recupere toutes les demandes recherches en attende de la finalisation  
	 * de la procedure d'envoie. 
	 *
	 */

	@Transactional
	public List<Demande> getAllDderechAfinaliser(){
		
		try{
			Session session=sessionFactory.getCurrentSession();
			
			List<Demande> list = session.createQuery("select d from Demande d"
					+ " where d.typeDemande.id = '2' and d.valideur.id= null and d.statutEnvoiDemande=false")
					.list();//  recuperer la liste des demandes classique non finalis�es  de la BD
			return list;
		}catch (Exception e){
			return null;
		}	
	}
	
	
	
	
	

	/**
	 * Methode qui met � jour une demande classique "accept�e" cloturee dans la BD 
	 *
	 */

	@Transactional
	public Demande setDemandebyFinaliserclas(Demande demande){
		
		try{
			
			Session session=sessionFactory.getCurrentSession();
			
			demande.setDateDerniereModification(demande.getDatecreationDemande());
			session.merge(demande);
			session.flush();
			
			//Si le statut de la demande est pass� a "true"
			if(demande.isStatutEnvoiDemande()){
				LigneStatut ligneStatut = new LigneStatut();
				
				ligneStatut.setId_demande(demande.getId());
				ligneStatut.setDate(demande.getDatecreationDemande());
				ligneStatut.setId_statut_demande(1);
				
				session.persist(ligneStatut);
				session.flush();
				
				}
			
			
			return demande;
			
		}catch (Exception e){
			
			return null;
		}	
	}
	
	
	
	
	
	/**
	 * Methode qui retourne une instance de "Besoin demande" � partir de l'ID
	 *
	 */
	@Transactional
	public BesoinDemande getBesoinDemandebyId(int id){
		try{
			Session session=sessionFactory.getCurrentSession();
			BesoinDemande besoinDemande =(BesoinDemande) session.get(BesoinDemande.class, id);// recuperer un objet � partir de sa cle primaire
			return besoinDemande;
		}catch (Exception e){
			return null;
		}
		
		
	}
	
	/**
	 * Methode qui recupere toutes les demandes classiques  de la BD
	 *
	 */
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Demande> getAllDemandeclas(){
		
		
		try{
			Session session=sessionFactory.getCurrentSession();
			List<Demande> list = session.createQuery("select d from Demande d"
					+ " where d.typeDemande.id = '1' and d.statutEnCours < '5' order by d.id")
					.list();//  recuperer la liste des demandes recherches  de la BD
			return list;
		}catch (Exception e){
			return null;
		}	
	}
	
	
	/**
	 * Methode qui recupere toutes les demandes recherches  de la BD
	 *
	 */
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Demande> getAllDemanderech(){
		
		try{
			Session session=sessionFactory.getCurrentSession();
			List<Demande> list = session.createQuery("select d from Demande d"
					+ " where d.typeDemande.id = '2'and d.statutEnCours < '5'order by d.id")
					.list();//  recuperer la liste des demandes recherches  de la BD
			return list;
		}catch (Exception e){
			return null;
		}	
	}
	
	
	/**
	 * Methode qui recupere toutes les demandes en attende d'instruction  de la BD
	 *
	 */
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Demande> getAllDdeAinstruire(){
		
		try{
			Session session=sessionFactory.getCurrentSession();
			
			List<Demande> list = session.createQuery("select d from Demande d"
					+ " where d.typeDemande.id = '1' and d.instructeur.id= null and d.statutEnvoiDemande=true order by d.id")
					.list();//  recuperer la liste des demandes recherches  de la BD
			return list;
		}catch (Exception e){
			return null;
		}	
	}
	
	
	
	
	/**
	 * Methode qui recupere une demande dans la BD � partir de son ID
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
	 * Methode qui met � jour une demande instruite dans la BD 
	 *
	 */

	@Transactional
	public Demande setDemandebyInstruction(String date, Demande demande){
		
		try{
			
			Session session=sessionFactory.getCurrentSession();
			
			demande.setDateDerniereModification(date);
			session.merge(demande);
			session.flush();
			
			if(demande != null)
			{
				LigneStatut lignestatut = new LigneStatut();
				lignestatut.setDate(date);
				lignestatut.setId_demande(demande.getId());
				lignestatut.setId_statut_demande(2);
				
				session.persist(lignestatut);
				session.flush();
			}
			
			return demande;
			
		}catch (Exception e){
			return null;
		}	
	}
	
	
	
	/**
	 * Methode qui recupere un Statutdemande dans la BD � partir de son ID
	 *
	 */

	@Transactional
	public StatutDemande getStatutDemandebyId(int id){
		
		try{
			Session session=sessionFactory.getCurrentSession();
			
			StatutDemande statuDemande =(StatutDemande) session.get(StatutDemande.class, id);
			return statuDemande;
			
		}catch (Exception e){
			return null;
		}	
	}
	
	
	

	/**
	 * Methode qui recupere toutes les demandes en attende de validation  de la BD
	 *
	 */
	@Transactional
	public List<Demande> getAllDdeclasAvalider(){
		
		try{
			Session session=sessionFactory.getCurrentSession();
			
			List<Demande> list = session.createQuery("select d from Demande d"
					+ " where d.typeDemande.id = '1' and d.instructeur.id is not null and d.statutEnvoiDemande=true"
					+ " and d.statutEnCours.id = '2' and d.valideur.id = null ")
					.list();
			return list;
		}catch (Exception e){
			return null;
		}	
	}
	
	

	/**
	 * Methode qui recupere toutes les demandes recherche en attende de validation  de la BD
	 *
	 */
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Demande> getAllDderechAvalider(){
		
		try{
			Session session=sessionFactory.getCurrentSession();
			
			List<Demande> list = session.createQuery("select d from Demande d"
					+ " where d.typeDemande.id = '2' and d.instructeur.id = null and d.statutEnvoiDemande=true"
					+ " and d.statutEnCours.id = '1' and d.valideur.id = null ")
					.list();
			return list;
		}catch (Exception e){
			return null;
		}	
	}
	
	
	
	
	/**
	 * Methode qui met � jour une demande classique valid�e dans la BD 
	 *
	 */

	@Transactional
	public Demande setDemandebyValidationclas(String date, Demande demande){
		
		try{
			
			Session session=sessionFactory.getCurrentSession();
			
			demande.setDateDerniereModification(date);
			session.merge(demande);
			session.flush();
			
			//Si la MAJ est un succes, rajouter la ligne de modification de la demande dans la table
			//LigneStatut
			if(demande != null)
			{
				LigneStatut lignestatut = new LigneStatut();
				lignestatut.setDate(date);
				lignestatut.setId_demande(demande.getId());
				lignestatut.setId_statut_demande(3);
				
				session.persist(lignestatut);
				session.flush();
			}
			
			return demande;
			
		}catch (Exception e){
			return null;
		}	
	}
	
	
	

	/**
	 * Methode qui recupere toutes les demandes en attende de cl�ture  de la BD
	 *
	 */
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Demande> getAllDdeclasAcloturer(){
		
		try{
			Session session=sessionFactory.getCurrentSession();
			
			List<Demande> list = session.createQuery("select d from Demande d"
					+ " where d.typeDemande.id = '1' and d.instructeur.id is not null and d.statutEnvoiDemande=true"
					+ " and d.statutEnCours.id = '3' and d.valideur.id is not  null and d.clotureur.id =  null  "
					+ " and d.avisValidation is not null")
					.list();
			return list;
		}catch (Exception e){
			return null;
		}	
	}
	
	
	
	
	/**
	 * Methode qui met � jour une demande classique "accept�e" cloturee dans la BD 
	 *
	 */

	@Transactional
	public Demande setDemandebyClotureclas1(String date, Demande demande, String nomAgent, String prenomAgent, 
											
					String dateDebutAgent, String dateFinAgent){
		
		try{
			
			Session session=sessionFactory.getCurrentSession();
			
			demande.setDateDerniereModification(date);
			session.merge(demande);
			session.flush();
			
			//Si la MAJ est un succes, 
			if(demande != null)
			{
				LigneStatut lignestatut = new LigneStatut();
				lignestatut.setDate(date);
				lignestatut.setId_demande(demande.getId());
				lignestatut.setId_statut_demande(4);
				
				
				session.persist(lignestatut);
				session.flush();
				
				Recrutement recrutement= new Recrutement();
				recrutement.setNomAgent(nomAgent);
				recrutement.setPrenomAgent(prenomAgent);
				recrutement.setDateDebutAgent(dateDebutAgent);
				recrutement.setDateFinAgent(dateFinAgent);
				recrutement.setDemande(demande);
				
				session.persist(recrutement);
				session.flush();
				
			}
			
			return demande;
			
		}catch (Exception e){
			
			return null;
		}	
	}
	
	
	
	
	/**
	 * Methode qui met � jour une demande classique "refus�e" cloturee dans la BD 
	 *
	 */

	@Transactional
	public Demande setDemandebyClotureclas2(String date, Demande demande){
		
		try{
			
			Session session=sessionFactory.getCurrentSession();
			
			demande.setDateDerniereModification(date);
			session.merge(demande);
			session.flush();
			
			//Si la MAJ est un succes, rajouter la ligne de modification de la demande dans la table
			//LigneStatut
			if(demande != null)
			{
				LigneStatut lignestatut = new LigneStatut();
				lignestatut.setDate(date);
				lignestatut.setId_demande(demande.getId());
				lignestatut.setId_statut_demande(4);
				
				session.persist(lignestatut);
				session.flush();
			}
			
			return demande;
			
		}catch (Exception e){
			
			return null;
		}	
	}
	
	
	
	
	
	/**
	 * Methode qui recupere toutes les demandes classiques cloturees qui peuvent etre renouvelles  de la BD
	 *
	 */
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Demande> getAllDdeclasArenouveller() {
		
		try{
			Session session=sessionFactory.getCurrentSession();
			
			List<Demande> list = session.createQuery("select d from Demande d"
					+ " where d.typeDemande.id = '1' and d.statutEnvoiDemande=true"
					+ " and d.statutEnCours.id = '4' and d.valideur.id is not null and d.clotureur.id is not null"
					+ " and d.avisValidation ='oui' ")
					.list();
			return list;
		}catch (Exception e){
			return null;
		}	
	}
	
	

	
	

	
	
	
	
	
	/**
	 * Methodes qui recuperent toutes les demandes selon les elements donn�s en param�tres
	 * (type demande, statut de la demande, date creation...)
	 */
	
	
	
	
	
	@Transactional
	public List<Demande> getDdeclasByparamstat(int type, int statut ){
		
		try{
			Session session=sessionFactory.getCurrentSession();
			
			List<Demande> list = session.createQuery("select d from Demande d"
					+ " where d.typeDemande.id =:type and  d.statutEnCours.id =:statut ")
					.setParameter("type", type).setParameter("statut", statut)
					.list();//  recuperer la liste des demandes classique non finalis�es  de la BD
			return list;
		}catch (Exception e){
			return null;
		}	
	}
	
	
	
	
	

	
	
/*	@Transactional
	public List<Demande> getDdeclasByparamfin( String datefinliste){
		
		try{
			Session session=sessionFactory.getCurrentSession();
			
			List<Demande> list = session.createQuery("select d from Demande d"
					+ " where d.typeDemande.id = '1' and d.datecreationDemande <= datefinliste")
					.list();//  recuperer la liste des demandes classique non finalis�es  de la BD
			return list;
		}catch (Exception e){
			return null;
		}	
	}*/

	/*
	
	@Transactional
	public List<Demande> getDdeclasByparamdeb(String datedebliste){
		
		try{
			Session session=sessionFactory.getCurrentSession();
			
			List<Demande> list = session.createQuery("select d from Demande d"
					+ " where d.typeDemande.id = '1' and  d.datecreationDemande >= datedebliste")
					.list();//  recuperer la liste des demandes classique non finalis�es  de la BD
			return list;
		}catch (Exception e){
			return null;
		}	
	}*/
	
	
	/*@Transactional
	public List<Demande> getDdeclasByparamfinstat(int statut, String datefinliste){
		
		try{
			Session session=sessionFactory.getCurrentSession();
			
			List<Demande> list = session.createQuery("select d from Demande d"
					+ " where d.typeDemande.id = '1' and  d.statutEnCours.id = statut and d.datecreationDemande <= datefinliste")
					.list();//  recuperer la liste des demandes classique non finalis�es  de la BD
			return list;
		}catch (Exception e){
			return null;
		}	
	}
	
	
	
	
	@Transactional
	public List<Demande> getDdeclasByparamdebstat(int statut, String datedebliste){
		
		try{
			Session session=sessionFactory.getCurrentSession();
			
			List<Demande> list = session.createQuery("select d from Demande d"
					+ " where d.typeDemande.id = '1' and  d.statutEnCours.id = statut and d.datecreationDemande >= datedebliste")
					.list();//  recuperer la liste des demandes classique non finalis�es  de la BD
			return list;
		}catch (Exception e){
			return null;
		}	
	}
	
	
	
	
	@Transactional
	public List<Demande> getDdeclasByparam(String datedebliste, String datefinliste, int statut){
		
		try{
			Session session=sessionFactory.getCurrentSession();
			
			List<Demande> list = session.createQuery("select d from Demande d"
					+ " where d.typeDemande.id = '1' and  d.statutEnCours.id = statut and d.datecreationDemande >= datedebliste")
					.list();//  recuperer la liste des demandes classique non finalis�es  de la BD
			return list;
		}catch (Exception e){
			return null;
		}	
	}
	
	
	*//**
	 *Methode qui recupere toutes les demandes recherche selon les elements donn�s en param�tre
	 *
	 *//*

	@Transactional
	public List<Demande> getDderechByparam(String datedebliste, String datefinliste, int statut, String typedemande){
		
		try{
			Session session=sessionFactory.getCurrentSession();
			
			List<Demande> list = session.createQuery("select d from Demande d"
					+ " where d.typeDemande.id = '2' and d.statutEnCours.id = statut")
					.list();//  recuperer la liste des demandes classique non finalis�es  de la BD
			return list;
		}catch (Exception e){
			
			return null;
		}	
	}*/
	
	
	
	
	
	
	
}	
	

