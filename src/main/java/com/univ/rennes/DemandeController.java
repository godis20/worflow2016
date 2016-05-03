package com.univ.rennes;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.univ.rennes.model.Composante;
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
	@RequestMapping(value = "/ajoutDemanderech", method = RequestMethod.GET)
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
	/*@RequestMapping(value = "/ajoutdemandeclas", method = RequestMethod.POST)
	public ModelAndView cont_ajoutdemandeclas(

						@RequestParam("prenom") String besoinDea,
						@RequestParam("email") String email,
						@RequestParam("password") String password,
						@RequestParam("poste") String poste,
						@RequestParam("id_composante") int id_composante
						
			
			
			
			)
	{
		try
		{
			
			return new ModelAndView("form_demandeclas", "utilisateur", request.getSession().getAttribute("user"));
		}catch(Exception e)
		{
			 return new ModelAndView("form_demandeclas", "utilisateur", request.getSession().getAttribute("user")); 
		}
	}*/
	
}
