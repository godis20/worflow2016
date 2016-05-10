package com.univ.rennes;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.univ.rennes.model.TypeDemande;
import com.univ.rennes.model.Utilisateur;
import com.univ.rennes.service.DemandeService;
import com.univ.rennes.service.UtilisateurService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	DemandeService demandeService;
	
	@Autowired
	UtilisateurService utilisateurService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	  
	
	
	/**
	 * Point d'entree de l'application,
	 * Contrôleur d'affichage de la page de connexion,
	 * 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView from_connexionutilisateur()
	
	{
		ModelAndView model = new ModelAndView("form_connexionutilisateur");
		
		try{
			
		
			return model;
			
		} catch (Exception e){
			
			model.addObject("error", "erreur lors de la l'afichage de la page");
			return model;
			
			
		}
	}
		
		
	
	/**
	 * Point d'entree de l'application,
	 * Contrôleur de traitement des parametres de connexion de l'utilisateur,
	 * 
	 */
	@RequestMapping(value = "/connexionutilisateur", method = RequestMethod.POST)
	public ModelAndView cont_connexionutilisateur(HttpServletRequest request,
			@RequestParam("login") String login,
			@RequestParam("password") String password)
	
	{
		ModelAndView model = new ModelAndView("form_connexionutilisateur");
		
		try{
			
			Utilisateur user = utilisateurService.Connect(login,password);
			if( user != null)
			{
				request.getSession().setAttribute("user", user);
				return new ModelAndView ("redirect:/ajoutdemandeclas");
			}
			
			
			model.addObject("error", "le login et/ ou mot de passe sont incorrects");
			return model;
			
		} catch (Exception e){
			
			model.addObject("error", "erreur lors de la tentative de connexion");
			return model;
			
			
		}
		
		
	}
	
}
