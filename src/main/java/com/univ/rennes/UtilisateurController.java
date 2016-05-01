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
		newUser.setNom(prenom);
		newUser.setEmail(email);
		newUser.setPassword(password);
		newUser.setPoste(poste);
		try{
		newUser.setComposante(utilisateurService.getComposantebyId(id_composante));//recuperer la composante co
		
		utilisateurService.ajoutUtilisateur(newUser);
		
		if (newUser!= null){
	        return  new ModelAndView("redirect:/listutilisateurs");	    
		}
		
		return new ModelAndView("form_utilisateur", "erreur", "erreur lors de la creation de l'utilisateur");
		
		} catch (Exception e){
			return new ModelAndView("form_utilisateur", "erreur", "erreur lors de la creation de l'utilisateur");
		}
		
	}
	
	
	@RequestMapping(value = "/form_utilisateur", method = RequestMethod.GET)
	public ModelAndView form_utilisateur()
	{
		try
		{
			return new ModelAndView("form_utilisateur", "composantes", utilisateurService.getAllComposante());
		}catch(Exception e)
		{
			 return new ModelAndView("form_utilisateur", "composantes", new ArrayList<Composante>()); 
		}
	}

}
 