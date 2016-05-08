package com.univ.rennes;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.univ.rennes.model.BesoinDemande;
import com.univ.rennes.model.Composante;
import com.univ.rennes.model.Demande;
import com.univ.rennes.model.LigneStatut;
import com.univ.rennes.model.Utilisateur;
import com.univ.rennes.service.DemandeService;
import com.univ.rennes.service.UtilisateurService;

@Controller
public class DemandeController {
	
	@Autowired 
	DemandeService demandeService;
	
	

	/**
	 * controleur de l'affichage du formulaire de creation de demande de recrutement classqiue
	 *
	 */
	@RequestMapping(value = "/ajoutdemandeclas", method = RequestMethod.GET)
	public ModelAndView cont_form_demandeclas(HttpServletRequest request)
	{	
		
		ModelAndView model = new ModelAndView("form_demandeclas");
		try
		{
			
			Utilisateur user=(Utilisateur) request.getSession().getAttribute("user");
			Composante composante=user.getComposante();
			String nomComposante=composante.getLibelle_composante();
			model.addObject("nomComposante", nomComposante);
			model.addObject("user", user);
			return model;
		}catch(Exception e)
		{
			return model; 
		}
	}
	
	
	/**
	 * controleur de l'affichage du formulaire de creation de demande de recrutement recherche
	 *
	 */
	@RequestMapping(value = "/ajoutdemanderech", method = RequestMethod.GET)
	public ModelAndView cont_form_demanderech(HttpServletRequest request)
	{
		
		ModelAndView model = new ModelAndView("form_demanderech");
		
		try
		{
			Utilisateur user=(Utilisateur) request.getSession().getAttribute("user");
			Composante composante=user.getComposante();
			String nomComposante=composante.getLibelle_composante();
			model.addObject("nomComposante", nomComposante);
			model.addObject("user", user);
			return model;
		}catch(Exception e)
		{
			return model; 
		}
	}

	
	
	/**
	 * Contrôleur de traitement du formulaire de creation de demande de recrutement
	 * classique
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/ajoutdemandeclas", method = RequestMethod.POST)
	public ModelAndView cont_ajoutdemandeclas(

						
						HttpServletRequest request,
						@RequestParam("telephone") String telephone,
						
						@RequestParam("nature") int nature,// type de besoin de la demande
						
						
						@RequestParam("dateDeb") String dateDeb, //date debut du contrat souhaitée
						@RequestParam("dateFin") String dateFin,
						@RequestParam("dateFin") String duree,
						@RequestParam("quotite") String quotite,//quotite de travail
						@RequestParam("nomagt") String nomagt,
						@RequestParam("prenomagt") String prenomagt,
						@RequestParam("dateagt") String dateagt, //date fin de service de l'agent à remplacer
						@RequestParam("motif") String motif, 
						@RequestParam("fonction") String fonction,
						@RequestParam("branche") String branche,
						@RequestParam("categorie") String categorie, 
						@RequestParam("intitule") String intitule,
						@RequestParam("fiche") String fiche,
						@RequestParam("niveau") String niveau,
						@RequestParam("argumentaire") String argumentaire,
						@RequestParam("action") String action
		
			){
		
		
		Demande newDde= new Demande();
		
		Date date = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		
		//DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
		
		String formattedDate = dateFormat.format(date);
		
		newDde.setDatecreationDemande(formattedDate);
		
		
		
		newDde.setNomAgentAremplacer(nomagt);
		newDde.setDateDebSouhaite(dateDeb);
		newDde.setDateFinSouhaite(dateFin);
		newDde.setQuotite(quotite);
		
		newDde.setNomAgentAremplacer(nomagt);
		newDde.setDateFinService(dateagt);
		newDde.setMotifDispoPoste(motif);
		
		newDde.setFoncAgentArecrute(fonction);
		newDde.setBranchAgentArecruter(branche);
		newDde.setCatAgentArecruter(categorie);
		newDde.setFicheposte(fiche);
		newDde.setIntfoncAgentArecruter(intitule);
		newDde.setDiplomAgentArecruter(niveau);
		newDde.setArgumentaires(argumentaire);
		
		ModelAndView model = new ModelAndView("form_demandeclas");
		
		try
		{
			if(action.equals("Envoyer")){
				newDde.setStatutEnvoiDemande(true);
				
			}
			BesoinDemande besoinDemande=demandeService.getBesoinDemandebyId(nature);
			newDde.setBesoinDemande(besoinDemande);
			newDde.setTypeDemande(besoinDemande.getTypeDemande());
			
			newDde.setDemandeur((Utilisateur) request.getSession().getAttribute("user"));
			
			demandeService.ajoutDemande(newDde);
			
			if(newDde!=null){
			
			return new ModelAndView("redirect:/listdemandeclas");
			
			}
			
			
			model.addObject("utilisateur", request.getSession().getAttribute("user"));
			model.addObject("error", "Erreur lors de l'ajout de la demande dans la base de donnée");
			return model;
		}catch(Exception e)
		{
			model.addObject("utilisateur", request.getSession().getAttribute("user"));
			model.addObject("error", "Erreur lors de la formation de l'objet demande");
			return model;
		}
	}
	
	
	
	/**
	 * Contrôleur de traitement du formulaire de creation de demande de recrutement
	 * classique
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/ajoutdemanderech", method = RequestMethod.POST)
	public ModelAndView cont_ajoutdemanderech(

						
						HttpServletRequest request,
						@RequestParam("telephone") String telephone,
						@RequestParam("objet") int objet,// objet  de la demande
				
						@RequestParam("dateDeb") String dateDeb, //date debut du contrat 
						@RequestParam("dateFin") String dateFin,
						@RequestParam("duree") String duree,
						@RequestParam("qualite") String qualite,//qualité de l'etudiant
    					@RequestParam("nomAgent") String nomAgent, // nom de l'etudiant à recruter
					    @RequestParam("prenomAgent") String prenomAgent,
						@RequestParam("inm") String inm, 
						@RequestParam("missions") String missions, //missions du poste 
						@RequestParam("cf") String cf,
						@RequestParam("eotp") String eotp,
						@RequestParam("domaine") String domaine, 

						@RequestParam("argumentaire") String argumentaire,
						@RequestParam("action") String action

		
			){
		
		
		Demande newDde= new Demande();
		
		Date date = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		
	
		String formattedDate = dateFormat.format(date);
		
		newDde.setDatecreationDemande(formattedDate);
		
		
		
		newDde.setNomChercheur(nomAgent);
		newDde.setPrenomChercheur(prenomAgent);
		newDde.setDateDebSouhaite(dateDeb);
		newDde.setDateFinSouhaite(dateFin);
		newDde.setQualiteChercheur(qualite);
	
		
		newDde.setInmChercheur(inm);
		newDde.setMissions(missions);
	
		newDde.setCf(cf);
		newDde.setEotp(eotp);
		newDde.setDomainefonctionnel(domaine);
		newDde.setArgumentaires(argumentaire);
		
		ModelAndView model = new ModelAndView("form_demanderech");
		
		try
		{
			//4 est l'ID du besoin correspondant à "autres" dans la table "besoin_demande"
			//il est propre au demande de recrutement recherche
			
			BesoinDemande besoinDemande=demandeService.getBesoinDemandebyId(4); 
			newDde.setBesoinDemande(besoinDemande);
			newDde.setTypeDemande(besoinDemande.getTypeDemande());
			if(action.equals("Envoyer")){
				newDde.setStatutEnvoiDemande(true);
				
			}
			
			newDde.setDemandeur((Utilisateur) request.getSession().getAttribute("user"));
			
			demandeService.ajoutDemande(newDde);
			
			if(newDde!=null){
			
			return new ModelAndView("redirect:/listdemanderech");
			
			}
			
			
			model.addObject("utilisateur", request.getSession().getAttribute("user"));
			model.addObject("error", "Erreur lors de l'ajout de la demande dans la base de donnée");
			return model;
		}catch(Exception e)
		{
			model.addObject("utilisateur", request.getSession().getAttribute("user"));
			model.addObject("error", "Erreur lors de la formation de l'objet demande");
			return model;
		}
	}
	
	

	/**
	 * Contrôleur de l'affichage de la liste des demandes classiques existants dans la BD,
	 * 
	 */
	@RequestMapping(value = "/listdemandeclas", method = RequestMethod.GET)
	public ModelAndView cont_listdemandeclas()
	{
		try
		{
			return new ModelAndView("listdemandeclas", "listdemandeclas", demandeService.getAllDemandeclas());
			
		}catch(Exception e)
		{
			 return new ModelAndView("listdemandeclas", "listdemandeclas", new ArrayList<Demande>()); 
		}
	}
	
	
	/**
	 * Contrôleur de l'affichage de la liste des demandes recherches existantes dans la BD,
	 * 
	 */
	@RequestMapping(value = "/listdemanderech", method = RequestMethod.GET)
	public ModelAndView cont_listdemanderech()
	{
		try
		{
			return new ModelAndView("listdemanderech", "listdemanderech", demandeService.getAllDemanderech());
			
		}catch(Exception e)
		{
			 return new ModelAndView("listdemanderech", "listdemanderech", new ArrayList<Demande>()); 
		}
	}
	
	


	/**
	 * contrôleur de l'affichage du formulaire d'instruction d'une demande
	 *
	 */
	@RequestMapping(value = "/instruiredemande", method = RequestMethod.GET)
	public ModelAndView cont_form_instruiredde()
	{	
		
		ModelAndView model = new ModelAndView("form_instructiondde");
		try
		{
			DemandeService demandeService= new DemandeService();
			Demande demande=demandeService.getDemandebyId(2);
		
			model.addObject("demande", demande);
			
			return model;
		}catch(Exception e)
		{
			return model; 
		}
	}
	
	
	
	/**
	 * contrôleur de la mise à jour d'une demande classique
	 * apres une instruction deladite demande
	 *
	 */
	@RequestMapping(value = "/instruiredemande", method = RequestMethod.POST)
	public ModelAndView cont_form_instruiredde(	
			
					HttpServletRequest request,
					@RequestParam("observation") String observation
			
			)
	{	
		
		ModelAndView model = new ModelAndView("form_instructiondde");
		try
		{
			Date date = new Date(); 
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
			
			
			String dateInstruction = dateFormat.format(date);
			
			Utilisateur instructeur =(Utilisateur) request.getSession().getAttribute("user");
			
			DemandeService demandeService= new DemandeService();
			
			Demande demande = demandeService.setDemandebyInstruction(instructeur, dateInstruction, observation);
			
			if(demande!=null){
		
			return new ModelAndView("redirect:/listdemandeclas");
			}
			
	
			Demande demandeInitial=demandeService.getDemandebyId(2);
		
			model.addObject("demande", demandeInitial);
			model.addObject("error", "Erreur lors de la mise à jour de la demande");
			return model; 
			
		}catch(Exception e)
		{	
			model.addObject("error", "Erreur lors de la recuperation de la demande initial");
			return model; 
		}
	}
}
