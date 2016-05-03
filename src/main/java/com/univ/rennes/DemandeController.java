package com.univ.rennes;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.univ.rennes.model.Composante;
import com.univ.rennes.model.Utilisateur;
import com.univ.rennes.service.DemandeService;
import com.univ.rennes.service.UtilisateurService;

public class DemandeController {
	
	@Autowired 
	DemandeService demandeService;
	
	

	/**
	 * controleur de l'affichage du formulaire de creation de demande de recrutement
	 *
	 */
	@RequestMapping(value = "/ajoutdemande", method = RequestMethod.GET)
	public ModelAndView cont_form_demande(@RequestParam("email") String email)
	{
		try
		{
			return new ModelAndView("form_demande", "utilisateur", demandeService.getUtilisateurById(email));
		}catch(Exception e)
		{
			 return new ModelAndView("form_demande", "utilisateur", new Utilisateur()); 
		}
	}

}
