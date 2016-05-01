package com.univ.rennes;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.univ.rennes.model.TypeDemande;
import com.univ.rennes.service.DemandeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	DemandeService demandeService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	  
	@SuppressWarnings("unused")
	@RequestMapping(value = "/godis", method = RequestMethod.GET)
	public ModelAndView home2(Locale locale, Model model) {
		logger.info("Welcome GODISSS! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		List<TypeDemande> list=demandeService.getTypeListeDemande();
		
		if(list != null )
		{
			logger.info(list.get(0).getLibelle());
			logger.info(list.get(1).getLibelle());
		}
		
		String formattedDate = dateFormat.format(date) + "Godis kenmogne";
		
		ModelAndView modelAndWiew = new ModelAndView();
		
		model.addAttribute("serverTime", formattedDate );
		
		return new ModelAndView("home", "serverTime", formattedDate);
	}
	
	
}
