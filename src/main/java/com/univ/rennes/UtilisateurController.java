package com.univ.rennes;

import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;

import javax.servlet.http.HttpServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.univ.rennes.model.Composante;
import com.univ.rennes.model.Utilisateur;
import com.univ.rennes.service.UtilisateurService;

@Controller
public class UtilisateurController {
	
	@Autowired 
	UtilisateurService utilisateurService;
	
	
	/**
	 * controleur de la recuperation du formulaire de creation d'un utilisateur,
	 * et du stockage dans la BD
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/ajoututilisateur", method = RequestMethod.POST)
	public ModelAndView cont_ajoutUtilisateur(
			@RequestParam("nom") String nom,
			@RequestParam("prenom") String prenom,
			@RequestParam("email") String email,
			@RequestParam("password") String password,
			@RequestParam("poste") String poste,
			@RequestParam("id_composante") int id_composante
	)
	{
		
		Utilisateur newUser= new Utilisateur();
		
		newUser.setNom(nom);
		newUser.setPrenom(prenom);
		newUser.setEmail(email);
		newUser.setPassword(password);
		newUser.setPoste(poste);
		
		ModelAndView model = new ModelAndView("form_utilisateur");
		
		try{
		newUser.setComposante(utilisateurService.getComposantebyId(id_composante));//recuperer la composante co
		
		utilisateurService.ajoutUtilisateur(newUser);
		
		if (newUser!= null){
	        return  new ModelAndView("redirect:/listutilisateurs");	    
		}

		model.addObject("composantes", utilisateurService.getAllComposante());
		model.addObject("error", "Erreur lors de l'ajout de l'utilisateur");
		return model;
		} catch (Exception e){
	
			model.addObject("composantes", utilisateurService.getAllComposante());
			model.addObject("error", "Erreur lors de l'ajout de l'utilisateur");
			return model;
		}
		
	}
	
	
	
	/**
	 * Contrôleur de l'affichage du formulaire de creation d'un utilisateur,
	 * et du stockage dans la BD
	 */
	@RequestMapping(value = "/ajoututilisateur", method = RequestMethod.GET)
	public ModelAndView cont_form_utilisateur()
	{
		try
		{
			return new ModelAndView("form_utilisateur", "composantes", utilisateurService.getAllComposante());
		}catch(Exception e)
		{
			 return new ModelAndView("form_utilisateur", "composantes", new ArrayList<Composante>()); 
		}
	}
	
	
	
	/**
	 * Contrôleur de l'affichage de la liste des utilisateurs existants dans la BD,
	 * 
	 */
	@RequestMapping(value = "/listutilisateurs", method = RequestMethod.GET)
	public ModelAndView cont_listutilisateurs()
	{
		try
		{
			return new ModelAndView("listutilisateurs", "listutilisateurs", utilisateurService.getAllUtilisateur());
		}catch(Exception e)
		{
			 return new ModelAndView("form_utilisateur", "listutilisateurs", new ArrayList<Utilisateur>()); 
		}
	}

}
 