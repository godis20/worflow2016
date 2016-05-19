package com.univ.rennes;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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

import com.univ.rennes.model.Utilisateur;
import com.univ.rennes.service.DemandeService;


@Controller
public class DemandeController {
	
	@Autowired 
	DemandeService demandeService;
	
	

	/**
	 * Contr�leur de l'affichage du formulaire de creation d'une demande de recrutement classqiue
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
	 * Contr�leur de l'affichage du formulaire de creation de demande de recrutement recherche
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
	 * Contr�leur de traitement du formulaire de creation de demande de recrutement
	 * classique
	 * @throws IOException 
	 */
	@SuppressWarnings({ "unused", "deprecation" })
	@RequestMapping(value = "/ajoutdemandeclas", method = RequestMethod.POST)
	public ModelAndView cont_ajoutdemandeclas(

						
						HttpServletRequest request,
						@RequestParam("telephone") String telephone,
						
						@RequestParam("nature") int nature,// type de besoin de la demande
						
						
						@RequestParam("dateDeb") String dateDeb, //date debut du contrat souhait�e
						@RequestParam("dateFin") String dateFin,
						@RequestParam("dateFin") String duree,
						@RequestParam("quotite") String quotite,//quotite de travail
						@RequestParam("nomagt") String nomagt,
						@RequestParam("prenomagt") String prenomagt,
						@RequestParam("dateagt") String dateagt, //date fin de service de l'agent � remplacer
						@RequestParam("motif") String motif, 
						@RequestParam("fonction") String fonction,
						@RequestParam("branche") String branche,
						@RequestParam("categorie") String categorie, 
						@RequestParam("intitule") String intitule,
						@RequestParam("ficheposte") String ficheposte,
						@RequestParam("niveau") String niveau,
						@RequestParam("argumentaire") String argumentaire,
						@RequestParam("action") String action
		
			) throws IOException{
		
			
		
		 //String fileName="";
		 
		
		
		Demande newDde= new Demande();
		
		Date date = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm");
		
		//DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
		
		String formattedDate = dateFormat.format(date);
		
		newDde.setDatecreationDemande(formattedDate);
		
		
		newDde.setFicheposte(ficheposte);
		newDde.setNomAgentAremplacer(nomagt);
		newDde.setDateDebSouhaite(dateDeb);
		newDde.setDateFinSouhaite(dateFin);
		newDde.setQuotite(quotite);
		
		//String nometprenomAgent= nomagt +"   "+ prenomagt;
		newDde.setNomAgentAremplacer(nomagt);
		newDde.setDateFinService(dateagt);
		newDde.setMotifDispoPoste(motif);
		
		newDde.setFoncAgentArecrute(fonction);
		newDde.setBranchAgentArecruter(branche);
		newDde.setCatAgentArecruter(categorie);
		
		newDde.setIntfoncAgentArecruter(intitule);
		newDde.setDiplomAgentArecruter(niveau);
		newDde.setArgumentaires(argumentaire);
		newDde.setStatutEnCours(demandeService.getStatutDemandebyId(1));
		
		ModelAndView model = new ModelAndView("form_demandeclas");
		ModelAndView modelist = new ModelAndView("listdemandeclas");
		ModelAndView modelistfinaliser = new ModelAndView("listddeclasafinaliser");
		try
		{
			
			/*if (!file.isEmpty()) {
			
			 
			 InputStream inputStream =  fiche.getInputStream();
			 
		     fileName= request.getRealPath("") +"/images/"+ fiche.getOriginalFilename();
		     OutputStream outputStream = new FileOutputStream(fileName);
		     
		     int readBytes = 0;
	         byte[] buffer = new byte[10000];
	         while ((readBytes = inputStream.read(buffer, 0, 10000)) != -1) {
	                outputStream.write(buffer, 0, readBytes);
	          }
	         outputStream.close();
	         inputStream.close();
		
			}*/
			
			
			if(action.equals("Envoyer")){
				newDde.setStatutEnvoiDemande(true);
				newDde.setStatutEnCours(demandeService.getStatutDemandebyId(1));
				
			}
			else{
				newDde.setStatutEnCours(demandeService.getStatutDemandebyId(5));
			}
			BesoinDemande besoinDemande=demandeService.getBesoinDemandebyId(nature);
			newDde.setBesoinDemande(besoinDemande);
			newDde.setTypeDemande(besoinDemande.getTypeDemande());
			
			newDde.setDemandeur((Utilisateur) request.getSession().getAttribute("user"));
			
			demandeService.ajoutDemande(newDde);
			
			if(newDde!=null && newDde.isStatutEnvoiDemande()){
				
				modelist.addObject("succes", "demande envoy�e pour instruction avec succes");
				modelist.addObject("listdemandeclas", demandeService.getAllDemandeclas());
				return modelist;
			
			}
			
			//Si la demande a �t� envoy�e pour instruction retourner sur la liste des ddes
			else if(newDde!=null && !newDde.isStatutEnvoiDemande()){
				
				modelistfinaliser.addObject("succes", "demande enregistr�e avec succes");
				modelistfinaliser.addObject("listddeclasafinaliser", demandeService.getAllDdeclasAfinaliser());
				return modelistfinaliser;
				
			}
			
			
			model.addObject("utilisateur", request.getSession().getAttribute("user"));
			model.addObject("error", "Erreur lors de l'ajout de la demande dans la base de donn�e");
			return model;
			
		} catch(Exception e)
		
		{
			
			model.addObject("utilisateur", request.getSession().getAttribute("user"));
			model.addObject("error", "Erreur lors de la formation de l'objet demande");
			return model;
		}
	}
	
	
	
	
	/**
	 * Contr�leur de traitement du formulaire de creation de demande de recrutement
	 * recherche
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/ajoutdemanderech", method = RequestMethod.POST)
	public ModelAndView cont_ajoutdemanderech(

						
						HttpServletRequest request,
						@RequestParam("telephone") String telephone,
						@RequestParam("objet") String objet,// objet  de la demande
				
						@RequestParam("dateDeb") String dateDeb, //date debut du contrat 
						@RequestParam("dateFin") String dateFin,
						@RequestParam("duree") String duree,
						@RequestParam("qualite") String qualite,//qualit� de l'etudiant
    					@RequestParam("nomAgent") String nomAgent, // nom de l'etudiant � recruter
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
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm");
		
	
		String formattedDate = dateFormat.format(date);
		
		newDde.setDatecreationDemande(formattedDate);
		
		
		
		newDde.setNomChercheur(nomAgent);
		newDde.setPrenomChercheur(prenomAgent);
		newDde.setDateDebSouhaite(dateDeb);
		newDde.setDateFinSouhaite(dateFin);
		newDde.setQualiteChercheur(qualite);
	
		
		newDde.setInmChercheur(inm);
		newDde.setMissions(missions);
		newDde.setAutreBesoinDemande(objet);
		newDde.setCf(cf);
		newDde.setEotp(eotp);
		newDde.setDomainefonctionnel(domaine);
		newDde.setArgumentaires(argumentaire);
		newDde.setStatutEnCours(demandeService.getStatutDemandebyId(1));
		
		
		ModelAndView model = new ModelAndView("form_demanderech");
		ModelAndView modelist = new ModelAndView("listdemanderech");
		ModelAndView modelistfinaliser = new ModelAndView("listdderechafinaliser");
		
		try
		{
			//4 est l'ID du besoin correspondant � "autres" dans la table "besoin_demande"
			//il est propre au demande de recrutement recherche
			
			BesoinDemande besoinDemande=demandeService.getBesoinDemandebyId(4); 
			newDde.setBesoinDemande(besoinDemande);
			newDde.setTypeDemande(besoinDemande.getTypeDemande());
			
			if(action.equals("Envoyer")){
				newDde.setStatutEnvoiDemande(true);
				newDde.setStatutEnCours(demandeService.getStatutDemandebyId(1));
				
			}else{
				
				newDde.setStatutEnCours(demandeService.getStatutDemandebyId(5));
			}
			
			newDde.setDemandeur((Utilisateur) request.getSession().getAttribute("user"));
			
			demandeService.ajoutDemande(newDde);
			
			//Si la demande a �t� envoy�e pour instruction retourner sur la liste des ddes
			if(newDde!=null && newDde.isStatutEnvoiDemande()){
			
				modelist.addObject("succes", "demande envoy�e pour instruction avec succes");
				modelist.addObject("listdemanderech", demandeService.getAllDemanderech());
				return modelist;
			
			} 
			
			//Si la demande a �t� enregistr�e retourner sur la liste des ddes a finaliser
			else if (newDde!=null && !newDde.isStatutEnvoiDemande()){
				
				modelistfinaliser.addObject("succes", "demande enregistr�e avec succes");
				modelistfinaliser.addObject("listdderechafinaliser", demandeService.getAllDderechAfinaliser());
				return modelistfinaliser;
			}
			
			
			model.addObject("utilisateur", request.getSession().getAttribute("user"));
			model.addObject("error", "Erreur lors de l'ajout de la demande dans la base de donn�e");
			return model;
		}catch(Exception e)
		{
			model.addObject("utilisateur", request.getSession().getAttribute("user"));
			model.addObject("error", "Erreur lors de la formation de l'objet demande");
			return model;
		}
	}
	
	

	/**
	 * Contr�leur de l'affichage de la liste des demandes classiques existants dans la BD,
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
	 * Contr�leur de l'affichage de la liste des demandes recherches existantes dans la BD,
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
	 * contr�leur de l'affichage des liste de demandes � instruire
	 *
	 */
	@RequestMapping(value = "/listddeainstruire", method = RequestMethod.GET)
	public ModelAndView cont_listddeainstruire()
	{	
		
		
		try
							
		{
			
			return new ModelAndView("listddeainstruire", "listddeainstruire", demandeService.getAllDdeAinstruire());
			
			
		}catch(Exception e)
		{
			return new ModelAndView("listddeainstruire", "listddeainstruire", new ArrayList<Demande>()); 
		}
	}
	
	
	
	
	
	
	/**
	 * Contr�leur l'affichage d'une demande pour instruction
	 * 
	 *
	 */
	@RequestMapping(value = "/instructiondemande", method = RequestMethod.GET)
	public ModelAndView cont_form_instruiredde(
			@RequestParam ("idDde") int idDde)
	{	
		
		ModelAndView model = new ModelAndView("form_instructiondde");
		try
		{
			
			Demande demande = demandeService.getDemandebyId(idDde);
			
			if(demande != null){
			
			model.addObject("demande", demande);
			
			return model; 
			}
			
			model.addObject("error", "La demande n'existe pas ");
			return model;
			
			
		} catch(Exception e)
		{	
			model.addObject("error", "Erreur lors de la recuperation de la demande initial");
			return model; 
		}
	}
	
	
	/**
	 * Contr�leur de la mise � jour d'une demande classique
	 * apres une instruction deladite demande
	 *
	 */
	@RequestMapping(value = "/instructiondemande", method = RequestMethod.POST)
	public ModelAndView cont_form_instruiredde(	
			
					HttpServletRequest request,
					@RequestParam("observation") String observation,
					@RequestParam("iddemande") int iddemande
					
			
			)
	{	
		
		ModelAndView model = new ModelAndView("form_instructiondde");
		ModelAndView modelist = new ModelAndView("listdemandeclas");
		
		try
		{
			Date date = new Date(); 
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm");
			
			
			String dateInstruction = dateFormat.format(date);
			
			Utilisateur instructeur =(Utilisateur) request.getSession().getAttribute("user");
			
			Demande demande = demandeService.getDemandebyId(iddemande);
			
			if (instructeur.getId()==demande.getDemandeur().getId()){
				
				Demande demandeInitial=demandeService.getDemandebyId(iddemande);
				
				model.addObject("demande", demandeInitial);
				model.addObject("error", "Vous �tes l'emetteur de cette demande");
				return model;
			}
			
			demande.setObsInstruction(observation);
			demande.setInstructeur(instructeur);
			
			// met � jour le statut de la demande "instruite" qui correspond � 2 dans la BD
			demande.setStatutEnCours(demandeService.getStatutDemandebyId(2));
			
			
			//appel de la methode qui proc�de � la MAJ de la demande dans la BD
			demande = demandeService.setDemandebyInstruction(dateInstruction, demande);
			
			if(demande!=null){
				
				modelist.addObject("succes", "demande instruite avec succ�s");
				modelist.addObject("listdemandeclas", demandeService.getAllDemandeclas());
				
				return modelist;
		
			
			}
			
	
			Demande demandeInitial=demandeService.getDemandebyId(iddemande);
		
			model.addObject("demande", demandeInitial);
			model.addObject("error", "Erreur lors de la mise � jour de la demande");
			return model; 
			
		}catch(Exception e)
		{	
			Demande demandeInitial=demandeService.getDemandebyId(iddemande);
			
			model.addObject("demande", demandeInitial);
			model.addObject("error", "Erreur lors de la recuperation de la demande initial");
			return model; 
		}
	}
	
	
	
	/**
	 * Contr�leur de l'affichage des liste de demandes classiques � valider
	 *
	 */
	@RequestMapping(value = "/listddeclasavalider", method = RequestMethod.GET)
	public ModelAndView cont_listddeclasavalider()
	{	
		
		
		try
							
		{
			
			return new ModelAndView("listddeclasavalider", "listddeclasavalider", demandeService.getAllDdeclasAvalider());
			
			
		}catch(Exception e)
		{
			return new ModelAndView("listddeclasavalider", "listddeclasavalider", new ArrayList<Demande>()); 
		}
	}
	
	
	
	/**
	 * Contr�leur de l'affichage des  demandes recherches � valider
	 *
	 */
	@RequestMapping(value = "/listdderechavalider", method = RequestMethod.GET)
	public ModelAndView cont_listdderechavalider()
	{	
		
		
		try
							
		{
			
			return new ModelAndView("listdderechavalider", "listdderechavalider", demandeService.getAllDderechAvalider());
			
			
		}catch(Exception e)
		{
			return new ModelAndView("listdderechavalider", "listdderechavalider", new ArrayList<Demande>()); 
		}
	}
	
	

	/**
	 * Contr�leur l'affichage d'une demande classique pour validation
	 *
	 */
	@RequestMapping(value = "/validationdemandeclas", method = RequestMethod.GET)
	public ModelAndView cont_form_validationddeclas(
			@RequestParam ("idDde") int idDde)
	{	
		
		ModelAndView model = new ModelAndView("form_validationddeclas");
		try
		{
			
			Demande demande = demandeService.getDemandebyId(idDde);
			
			if(demande != null){
			
			model.addObject("demande", demande);
			
			return model; 
			}
			
			model.addObject("error", "La demande n'existe pas ");
			return model;
			
			
		} catch(Exception e)
		{	
			model.addObject("error", "Erreur lors de la recuperation de la demande initial");
			return model; 
		}
	}
	
	
	
	/**
	 * Contr�leur l'affichage d'une demande recherche pour validation
	 *
	 */
	@RequestMapping(value = "/validationdemanderech", method = RequestMethod.GET)
	public ModelAndView cont_form_validationdderech(
			@RequestParam ("idDde") int idDde)
	{	
		
		ModelAndView model = new ModelAndView("form_validationdderech");
		try
		{
			
			Demande demande = demandeService.getDemandebyId(idDde);
			
			if(demande != null){
			
			model.addObject("demande", demande);
			
			return model; 
			}
			
			model.addObject("error", "La demande n'existe pas ");
			return model;
			
			
		} catch(Exception e)
		{	
			model.addObject("error", "Erreur lors de la recuperation de la demande initial");
			return model; 
		}
	}
	
	
	
	
	/**
	 * Contr�leur de la mise � jour d'une demande classique
	 * apr�s  validation deladite demande
	 *
	 */
	@RequestMapping(value = "/validationdemandeclas", method = RequestMethod.POST)
	public ModelAndView cont_form_validationddeclas(	
			
					HttpServletRequest request,
					@RequestParam("obsValidation") String obsValidation,
					@RequestParam("iddemande") int iddemande,
					@RequestParam("avis") String avis
					
			
			)
	{	
		
		ModelAndView model = new ModelAndView("form_validationddeclas");
		ModelAndView modelist = new ModelAndView("listdemandeclas");
		try
		{
			Date date = new Date(); 
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm");
			
			
			String dateValidation = dateFormat.format(date);
			
			//recuperation de le l'objet "Validateur", celui qui valide la demande
			Utilisateur validateur =(Utilisateur) request.getSession().getAttribute("user");
			
			//recuperation de la demande � mettre a jour dans la BD
			Demande demande = demandeService.getDemandebyId(iddemande);
			
			if(validateur.getId()==demande.getDemandeur().getId()){
				
				Demande demandeInitial=demandeService.getDemandebyId(iddemande);
				
				model.addObject("demande", demandeInitial);
				model.addObject("error", "Vous �tes l'emetteur de cette demande");
				return model;
			}
			
			demande.setValideur(validateur);
			
			// met � jour le statut de la demande "valid�e" qui correspond � 3 dans la BD
			demande.setStatutEnCours(demandeService.getStatutDemandebyId(3)); 
			
			//Si la demande a �t� accept�, 
			if(avis.equals("oui")){
				
				//Construction du message du validateur
				obsValidation= "Demande accept�e. Autres: "+ obsValidation;

				//Passer l'avis dans la BD � oui
				demande.setAvisValidation("oui");	
				
			} else {
				
				//Construction du message du validateur
				obsValidation= "Demande refus�e. Autres: "+ obsValidation;
				

				//Passer l'avis dans la BD � oui
				demande.setAvisValidation("non");
					
			}
			

			demande.setObsValidation(obsValidation);
			
			//appel de la methode qui proc�de � la MAJ de la demande dans la BD
			demande = demandeService.setDemandebyValidationclas(dateValidation, demande);
			
			
			//si l'operation de mise � jour s'est bien effectu�e
			if(demande!=null){
				
				modelist.addObject("succes", "Demande valid�e avec succ�s");
				modelist.addObject("listdemandeclas", demandeService.getAllDemandeclas());
		
				return modelist;
			}
			
	
			Demande demandeInitial=demandeService.getDemandebyId(iddemande);
		
			model.addObject("demande", demandeInitial);
			model.addObject("error", "Erreur lors de la mise � jour de la demande");
			return model; 
			
		}catch(Exception e)
		
		{	
			Demande demandeInitial=demandeService.getDemandebyId(iddemande);
			
			model.addObject("demande", demandeInitial);
			model.addObject("error", "Erreur lors de la recuperation de la demande initial");
			return model; 
		}
	}

	
	
	
	
	
	

	/**
	 * Contr�leur  de l'affichage des demandes classiques en attente de cl�ture
	 *
	 */
	@RequestMapping(value = "/listddeclasacloturer", method = RequestMethod.GET)
	public ModelAndView cont_listddeclasacloturer(
			)
	{	
		
		try
		
		{
			
			return new ModelAndView("listddeclasacloturer", "listddeclasacloturer", demandeService.getAllDdeclasAcloturer());
			
			
		}catch(Exception e)
		{
			return new ModelAndView("listddeclasacloturer", "listddeclasacloturer", new ArrayList<Demande>()); 
		}
	}
	
	
	
	
	
	/**
	 * Contr�leur l'affichage d'une demande classique pour cl�ture
	 *
	 */
	@RequestMapping(value = "/cloturedemandeclas", method = RequestMethod.GET)
	public ModelAndView cont_form_clotureddeclas(
			@RequestParam ("idDde") int idDde)
	{	
		
		ModelAndView model = new ModelAndView("form_clotureddeclas");
		try
		{
			
			Demande demande = demandeService.getDemandebyId(idDde);
			
			if(demande != null){
			
			model.addObject("demande", demande);
			
			return model; 
			}
			
			model.addObject("error", "La demande n'existe pas ");
			return model;
			
			
		} catch(Exception e)
		{	
			model.addObject("error", "Erreur lors de la recuperation de la demande initial");
			return model; 
		}
	}
	
	
	
	/**
	 * Contr�leur de la mise � jour d'une demande classique
	 * apr�s  cl�ture deladite demande
	 *
	 */
	@RequestMapping(value = "/cloturedemandeclas", method = RequestMethod.POST)
	public ModelAndView cont_form_clotureddeclas(	
			
					HttpServletRequest request,
					@RequestParam("obsCloture") String obsCloture,
					@RequestParam("iddemande") int iddemande,
					
					@RequestParam("nomAgent") String nomAgent,
					@RequestParam("prenomAgent") String prenomAgent,
					@RequestParam("dateDebutAgent") String dateDebutAgent,
					@RequestParam("dateFinAgent") String dateFinAgent
					
					
			
			)
	{	
		
		ModelAndView model = new ModelAndView("form_clotureddeclas");
		ModelAndView modelist = new ModelAndView("listdemandeclas");
		
		try
		{
			Date date = new Date(); 
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm");
			
			
			String dateCloture = dateFormat.format(date);
			
			//recuperation de le l'objet "Clotureur", celui qui valide la demande
			Utilisateur clotureur =(Utilisateur) request.getSession().getAttribute("user");
			
			//recuperation de la demande � mettre a jour dans la BD
			Demande demande = demandeService.getDemandebyId(iddemande);
			
			
			//Verication que le demandeur et le clotureur sont identiques
			if (clotureur.getId()  == demande.getDemandeur().getId()){
				
						demande.setClotureur(clotureur);
				
			
						// met � jour le statut de la demande "cloturee" qui correspond � 4 dans la BD
						demande.setStatutEnCours(demandeService.getStatutDemandebyId(4)); 
						
						//Si la demande avais �t� accept� par le validateur, 
						if(demande.getAvisValidation()=="oui"){
							
							demande.setObsCloture(obsCloture);
							
							//appel de la methode qui proc�de � la MAJ de la demande dans la BD
							demande = demandeService.setDemandebyClotureclas1(dateCloture, demande,
									nomAgent,prenomAgent, dateDebutAgent,dateFinAgent);
							
							
						} else {
							
					
							demande.setObsCloture(obsCloture);
							
							//appel de la methode qui proc�de � la MAJ de la demande dans la BD
							demande = demandeService.setDemandebyClotureclas2(dateCloture, demande);
								
						}
						
			
						
						
						//si l'operation de mise � jour s'est bien effectu�e
						if(demande!=null){
							
							modelist.addObject("succes", "Demande cl�tur�e avec succes");
							modelist.addObject("listdemandeclas", demandeService.getAllDemandeclas());
					
							return modelist;
						}
						
				
						Demande demandeInitial=demandeService.getDemandebyId(iddemande);
					
						model.addObject("demande", demandeInitial);
						model.addObject("error", "Erreur lors de la mise � jour de la demande");
						return model; 
						
						
			// si le cl�tureur et le demandeur ne sont pas identiques		
			} else {
				
				Demande demandeInitial=demandeService.getDemandebyId(iddemande);
				
				model.addObject("demande", demandeInitial);
				model.addObject("error", "Vous n'avez pas le droit de cl�turer cette demande car vous n'�tes pas l'�metteur");
				return model; 
				
			}
			
		}catch(Exception e)
		
		{	
			Demande demandeInitial=demandeService.getDemandebyId(iddemande);
			
			model.addObject("demande", demandeInitial);
			model.addObject("error", "Erreur lors de la recuperation de la demande ");
			return model; 
		}
		
	}

	
	

	

	/**
	 * Contr�leur  de l'affichage des demandes classiques � finaliser
	 *
	 */
	@RequestMapping(value = "/listddeclasafinaliser", method = RequestMethod.GET)
	public ModelAndView cont_listddeclasafinaliser(
			)
	{	
		
		try
		
		{
			
			return new ModelAndView("listddeclasafinaliser", "listddeclasafinaliser", demandeService.getAllDdeclasAfinaliser());
			
			
		}catch(Exception e)
		{
			return new ModelAndView("listddeclasafinaliser", "listddeclasafinaliser", new ArrayList<Demande>()); 
		}
	}
	
	
	
	
	/**
	 * Contr�leur  de l'affichage des demandes recherches � finaliser
	 *
	 */
	@RequestMapping(value = "/listdderechafinaliser", method = RequestMethod.GET)
	public ModelAndView cont_listdderechafinaliser(
			)
	{	
		
		try
		
		{
			
			return new ModelAndView("listdderechafinaliser", "listdderechafinaliser", demandeService.getAllDderechAfinaliser());
			
			
		}catch(Exception e)
		{
			return new ModelAndView("listdderechafinaliser", "listdderechafinaliser", new ArrayList<Demande>()); 
		}
	}
	
	

		
		
	
	

	/**
	 * Contr�leur l'affichage d'une demande classique pour finalisation
	 * 
	 *
	 */
	@RequestMapping(value = "/finalisationdemandeclas", method = RequestMethod.GET)
	public ModelAndView cont_form_finalisationddeclas(
			@RequestParam ("idDde") int idDde)
	{	
		
		ModelAndView model = new ModelAndView("form_finalisationddeclas");
		try
		{
			
			Demande demande = demandeService.getDemandebyId(idDde);
			
			if(demande != null){
			
			model.addObject("demande", demande);
			
			return model; 
			}
			
			model.addObject("error", "La demande n'existe pas ");
			return model;
			
			
		} catch(Exception e)
		{	
			model.addObject("error", "Erreur lors de la recuperation de la demande ");
			return model; 
		}
	}
		




	
	
	
	
	/**
	 * Contr�leur l'affichage d'une demande recherche pour finalisation
	 * 
	 *
	 */
	@RequestMapping(value = "/finalisationdemanderech", method = RequestMethod.GET)
	public ModelAndView cont_form_finalisationdderech(
			@RequestParam ("idDde") int idDde)
	{	
		
		ModelAndView model = new ModelAndView("form_finalisationdderech");
		try
		{
			
			Demande demande = demandeService.getDemandebyId(idDde);
			
			if(demande != null){
			
			model.addObject("demande", demande);
			
			return model; 
			}
			
			model.addObject("error", "La demande n'existe pas ");
			return model;
			
			
		} catch(Exception e)
		{	
			model.addObject("error", "Erreur lors de la recuperation de la demande ");
			return model; 
		}
	}
	
	
	
	

	

	
	
	
	/**
	 * Contr�leur l'affichage d'une demande classique pour finalisation
	 * 
	 *
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/finalisationdemandeclas", method = RequestMethod.POST)
	public ModelAndView cont_form_finalisationddeclas(
			@RequestParam ("iddemande") int iddemande,
	
			@RequestParam("telephone") String telephone,
			
			@RequestParam("nature") int nature,// type de besoin de la demande
			
			
			@RequestParam("dateDeb") String dateDeb, //date debut du contrat souhait�e
			@RequestParam("dateFin") String dateFin,
			@RequestParam("dateFin") String duree,
			@RequestParam("quotite") String quotite,//quotite de travail
			@RequestParam("nomagt") String nomagt,
			@RequestParam("prenomagt") String prenomagt,
			@RequestParam("dateagt") String dateagt, //date fin de service de l'agent � remplacer
			@RequestParam("motif") String motif, 
			@RequestParam("fonction") String fonction,
			@RequestParam("branche") String branche,
			@RequestParam("categorie") String categorie, 
			@RequestParam("intitule") String intitule,
			@RequestParam("fiche") String fiche,
			@RequestParam("niveau") String niveau,
			@RequestParam("argumentaire") String argumentaire,
			@RequestParam("action") String action
			
			)
	
	{	
		
		ModelAndView model = new ModelAndView("form_finalisationddeclas");
		ModelAndView modelist = new ModelAndView("listdemandeclas");
		ModelAndView modelistfinaliser = new ModelAndView("listddeclasafinaliser");
		
		try
		{
			
			Demande demande = demandeService.getDemandebyId(iddemande);
			
			if(demande != null){
				
			

				if(action.equals("Envoyer")){
					
					demande.setStatutEnvoiDemande(true);
					demande.setStatutEnCours(demandeService.getStatutDemandebyId(1));

				}
				
				else if(action.equals("Enregistrer")) {
					
					demande.setStatutEnCours(demandeService.getStatutDemandebyId(5));
				
				}
				
				else {
					
					demandeService.setDemandeDelete(demande);
					modelistfinaliser.addObject("listddeclasafinaliser", demandeService.getAllDdeclasAfinaliser());
					modelistfinaliser.addObject("succes", "Demande supprim�e avec succ�s");
					return modelistfinaliser;
				
					
				}	
				
				Date date = new Date(); 
				SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm");

				//DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);

				String formattedDate = dateFormat.format(date);

				demande.setDatecreationDemande(formattedDate);



				demande.setNomAgentAremplacer(nomagt);
				demande.setDateDebSouhaite(dateDeb);
				demande.setDateFinSouhaite(dateFin);
				demande.setQuotite(quotite);

				//String nometprenomAgent= nomagt +"   "+ prenomagt;
				demande.setNomAgentAremplacer(nomagt);
				demande.setDateFinService(dateagt);
				demande.setMotifDispoPoste(motif);

				demande.setFoncAgentArecrute(fonction);
				demande.setBranchAgentArecruter(branche);
				demande.setCatAgentArecruter(categorie);
				demande.setFicheposte(fiche);
				demande.setIntfoncAgentArecruter(intitule);
				demande.setDiplomAgentArecruter(niveau);
				demande.setArgumentaires(argumentaire);
				

				
				BesoinDemande besoinDemande=demandeService.getBesoinDemandebyId(nature);
				demande.setBesoinDemande(besoinDemande);
				demande.setTypeDemande(besoinDemande.getTypeDemande());

				demandeService.setDemandebyFinaliserclas(demande);

				if(demande!=null && demande.isStatutEnvoiDemande()){
					
					modelist.addObject("listdemandeclas", demandeService.getAllDemandeclas());
					modelist.addObject("succes", "Demande envoy�e pour instruction avec succ�s");
					return modelist;


				} 
				
				else if(demande!=null && !demande.isStatutEnvoiDemande()){
					
					modelistfinaliser.addObject("listddeclasafinaliser", demandeService.getAllDdeclasAfinaliser());
					modelistfinaliser.addObject("succes", "Demande enregistr�e avec succ�s");
					return modelistfinaliser;
					
				}
				
				Demande demandeInitial = demandeService.getDemandebyId(iddemande);
				
				model.addObject("demande", demandeInitial);
				model.addObject("error", "Erreur lors de la mise � jour de la demande dans la base de donn�e");
				return model;
				
				
				} else{
					
				
					model.addObject("error", "La demande n'existe pas dans la BD");
					return model;
				}
			
			
			
			
		} catch(Exception e)
		{	
			model.addObject("error", "Erreur lors de la recuperation de la demande ");
			return model; 
		}
		
		
	}	
	
	
	
	/**
	 * Contr�leur de la suppression d'une demande classique enregistr�e
	 * 
	 *
	 */

	@RequestMapping(value = "/suppressionddeclas", method = RequestMethod.GET)
	public ModelAndView cont_suppressiondde(
			@RequestParam ("idDde") int idDde
	){
		
		
		
		ModelAndView model = new ModelAndView("listddeclasafinaliser");
		
		
		try{
			
		
				 Demande demande = demandeService.getDemandebyId(idDde);
				 
				 if (demande!=null){
				 
				 demandeService.setDemandeDelete(demande);
				 model.addObject("listddeclasafinaliser", demandeService.getAllDdeclasArenouveller());
				 model.addObject("succes", "Demande supprimm�e avec succ�s");
				 return model;
				 
				 }
				
				 model.addObject("listddeclasafinaliser", demandeService.getAllDdeclasArenouveller());
				 model.addObject("error", "Aunne demande n'a �t� trouv� sur la BD");
				 return model;
				
		}catch (Exception e){
			
			model.addObject("listddeclasafinaliser", demandeService.getAllDdeclasArenouveller());
			model.addObject("error", "Erreur lors de la recuperation de la demande ");
			return model;
			
		}
	}
			

	
	
	/**
	 * Contr�leur de la suppression d'une demande recherche enregistr�e
	 * 
	 *
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/suppressiondderech", method = RequestMethod.GET)
	public ModelAndView cont_suppressiondderech(
			@RequestParam ("idDde") int idDde
	){
		
	
		ModelAndView model = new ModelAndView("listdderechafinaliser");
		
		
		try{
			
		
				Demande demande = demandeService.getDemandebyId(idDde);
				
			
				if(demande!=null){
							
						    demandeService.setDemandeDelete(demande);
						    model.addObject("listdderechafinaliser", demandeService.getAllDderechAfinaliser());
						    model.addObject("succes", "Demande supprimm�e avec succ�s");
							return model;
				}
				
				model.addObject("listdderechafinaliser", demandeService.getAllDderechAfinaliser());
				model.addObject("error", "Aucunne demande n'a �t� trouv� sur la BD");
				return model;
				
		}catch (Exception e){
			model.addObject("listdderechafinaliser", demandeService.getAllDderechAfinaliser());
			model.addObject("error", "Erreur lors de la recuperation de la demande ");
			return model;
			
		}
	}
	

	
	/**
	 * Contr�leur  de l'affichage des demandes cloturer � renouveller
	 *
	 */
	@RequestMapping(value = "/listddeclasarenouveller", method = RequestMethod.GET)
	public ModelAndView cont_listddeclasarenouveller(
			)
	{	
		
		try
		
		{
			
			return new ModelAndView("listddeclasarenouveller", "listddeclasarenouveller", demandeService.getAllDdeclasArenouveller());
			
			
		}catch(Exception e)
		{
			return new ModelAndView("listddeclasarenouveller", "listddeclasarenouveller", new ArrayList<Demande>()); 
		}
	}
	
	
	
	
	
	/**
	 * Contr�leur  de l'affichage des demandes selon des parametres dates, statut demande/ historiques
	 *
	 */
	@RequestMapping(value = "/rechercher", method = RequestMethod.POST)
	public ModelAndView cont_rechercher(
			
			@RequestParam("datedebliste") String datedebliste,
			@RequestParam("datefinliste") String datefinliste,
			@RequestParam("statut") int statut,
			@RequestParam("typedemande") String typedemande // type de la demande ecrit en dur sur le formulaire de rechercheddeclas
			
			
						
			)
	{
		
		
			try{
				
				
				
				//le formulaire de recherche concerne les demandes classique
				
				if(typedemande.equals("classique")){
					
					
					//Si le statut de la demande n'est pas selectionn�e
					
					if(statut==0){
						
						
									if (datedebliste.isEmpty() && datefinliste.isEmpty()){
									
									return new ModelAndView("listdemandeclas","listdemandeclas",  demandeService.getAllDemandeclas());
									
									}
									
									/*else if (datedebliste.isEmpty() && !datefinliste.isEmpty()){
										
										
										return new ModelAndView("listdemandeclas","listdemandeclas",  demandeService.getDdeclasByparamfin(datefinliste));
										
									}
									
									else if(datefinliste.isEmpty()){
										
										return new ModelAndView("listdemandeclas","listdemandeclas",  demandeService.getDdeclasByparamdeb(datedebliste));
										
									}*/
						
									
					// si le statut de la demande est selectionn�e 	
					} else{
									int type=1; //ID type correspondant au demande classique
								
									if(datedebliste.isEmpty() && datefinliste.isEmpty() ){
										
										return new ModelAndView("listdemandeclas","listdemandeclas",  demandeService.getDdeclasByparamstat(statut,type));
										
									}
									
									/*else if (datedebliste.isEmpty()){
										
										return new ModelAndView("listdemandeclas","listdemandeclas",  demandeService.getDdeclasByparamfinstat(statut, datefinliste));
										
									}
									
									
									else if (datefinliste.isEmpty()){
										
										return new ModelAndView("listdemandeclas","listdemandeclas",  demandeService.getDdeclasByparamdebstat(statut, datefinliste));
										
									}
									else{
										
										return new ModelAndView("listdemandeclas","listdemandeclas",  demandeService.getDdeclasByparam(datedebliste, datefinliste ,statut));	
									}
									*/
					}
				
				
				
				}
				
				
				//Si la recherche concerne une demande recrutement recherche
				else{
					
					    // si le statut de la demande recherche n'est pas selectionn�e 
						if(statut==0){
						
						
									if (datedebliste.isEmpty() && datefinliste.isEmpty()){
									
									return new ModelAndView("listdemanderech","listdemanderech",  demandeService.getAllDemanderech());
									
									}
									
									/*else if (datedebliste.isEmpty() && !datefinliste.isEmpty()){
										
										
										return new ModelAndView("listdemandeclas","listdemandeclas",  demandeService.getDdeclasByparamfin(datefinliste));
										
									}
									
									else if(datefinliste.isEmpty()){
										
										return new ModelAndView("listdemandeclas","listdemandeclas",  demandeService.getDdeclasByparamdeb(datedebliste));
										
									}*/
						
					
						// si le statut de la demande recherche est selectionn�e 	
						} else{
						
									int type=2; //ID type correspondant au demande  recherche
					
									if(datedebliste.isEmpty() && datefinliste.isEmpty() ){
										
										return new ModelAndView("listdemanderech","listdemanderech",  demandeService.getDdeclasByparamstat(statut, type));
										
									}
									
									/*else if (datedebliste.isEmpty()){
										
										return new ModelAndView("listdemandeclas","listdemandeclas",  demandeService.getDdeclasByparamfinstat(statut, datefinliste));
										
									}
									
									
									else if (datefinliste.isEmpty()){
										
										return new ModelAndView("listdemandeclas","listdemandeclas",  demandeService.getDdeclasByparamdebstat(statut, datefinliste));
										
									}
									else{
										
										return new ModelAndView("listdemandeclas","listdemandeclas",  demandeService.getDdeclasByparam(datedebliste, datefinliste ,statut));	
									}
									*/
					}
				
				
				
				} 
				
			
			
			}catch (Exception e)
			
			{
				return new ModelAndView("listdemanderech","error",  "Exeption rencontr�");
			}
			
			
			
			return null;
	
	}
	
	
	
	
	
	
	
}






