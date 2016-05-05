package com.univ.rennes;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.univ.rennes.model.Composante;
import com.univ.rennes.model.Demande;
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
	 * controleur de traitement du formulaire de creation de demande de recrutement
	 *
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
						@RequestParam("argumentaire") String argumentaire
		
			){
		
		
		Demande newDde= new Demande();
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
		
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
			newDde.setBesoinDemande(demandeService.getBesoinDemandebyId(nature));
			
			newDde.setDemandeur((Utilisateur) request.getSession().getAttribute("user"));
			
			demandeService.ajoutDemande(newDde);
			
			if(newDde!=null){
			
			return new ModelAndView("redirect:/listdemandeclas");
			
			}
			
			
			model.addObject("utilisateur", request.getSession().getAttribute("user"));
			model.addObject("error", "Erreur lors de l'ajout de la demande");
			return model;
		}catch(Exception e)
		{
			model.addObject("utilisateur", request.getSession().getAttribute("user"));
			model.addObject("error", "Erreur lors de l'ajout de la demande");
			return model;
		}
	}
	
}
