package com.univ.rennes;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
	 * controleur de l'affichage du formulaire de creation de demande de recrutement classqiue
	 *
	 */
	@RequestMapping(value = "/ajoutdemandeclas", method = RequestMethod.GET)
	public ModelAndView cont_form_demandeclas(HttpServletRequest request)
	{
		try
		{
			
			return new ModelAndView("form_demandeclas", "utilisateur", request.getSession().getAttribute("user"));
		}catch(Exception e)
		{
			 return new ModelAndView("form_demandeclas", "utilisateur", request.getSession().getAttribute("user")); 
		}
	}
	
	
	/**
	 * controleur de l'affichage du formulaire de creation de demande de recrutement recherche
	 *
	 */
	@RequestMapping(value = "/ajoutDemanderech", method = RequestMethod.GET)
	public ModelAndView cont_form_demanderech(HttpServletRequest request)
	{
		try
		{
			
			return new ModelAndView("form_demanderech", "utilisateur", request.getSession().getAttribute("user"));
		}catch(Exception e)
		{
			 return new ModelAndView("form_demanderech", "utilisateur", request.getSession().getAttribute("user")); 
		}
	}

	
	
	/**
	 * controleur de traitement du formulaire de creation de demande de recrutement
	 *
	 */
	
}
