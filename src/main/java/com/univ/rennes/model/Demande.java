package com.univ.rennes.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="demande")
public class Demande {

	
	/** zone du formulaire de demande : "EMETTEUR DE LA DEMANDE	"
	 *     Demande classique et demande recherche
	 */
	
	
	@Id
	@GeneratedValue
	@Column(name="id_demande")
	private Integer id;

	@OneToOne
	@JoinColumn(name="id_demandeur")
	private Utilisateur demandeur;
	
	@Column(name="datecreation_demande")
	private String datecreationDemande;
	
	@OneToOne
	@JoinColumn(name="id_type_demande")   //demande recrutement classque ou demande recrutement recherche
	private TypeDemande typeDemande;
	
	
	
	
	/** zone du formulaire de demande : "DETERMINATION DU BESOIN	"
	 *     Demande classique et demande recherche
	 */
	
	
	@OneToOne
	@JoinColumn(name="id_besoin_demande") 
	private BesoinDemande besoinDemande;
	
	@Column(name="autre_besoin_demande") // objet demande recrutement recherche
	private String autreBesoinDemande;
	
	
	
	public String getAutreBesoinDemande() {
		return autreBesoinDemande;
	}


	public void setAutreBesoinDemande(String autreBesoinDemande) {
		this.autreBesoinDemande = autreBesoinDemande;
	}


	@Column(name="date_d_souhaite")
	private String dateDebSouhaite;
	
	@Column(name="date_f_souhaite")
	private String dateFinSouhaite;
	
	@Column(name="duree_souhaitee",nullable=true)
	private String dureeSouhaite;
	
	@Column(name="quotite",nullable=true)              // concerne uniquement demande classique
	private String quotite;
	
	
	
	
	/** zone du formulaire de demande : "AGENT A REMPLACER	"
	 *     Demande classique uniquement, si besoin est different de "renforsement"
	 */
	
	@Column(name="nom_agt_aremplacer",nullable=true)
	private String nomAgentAremplacer;
	
	
	@Column(name="date_f_service",nullable=true)
	private String dateFinService;
	
	@Column(name="motif_dispo_poste",nullable=true)
	private String motifDispoPoste;
	
	
	
	
	/** zone du formulaire de demande : "ELEMENTS CONSTITUTIF DE LA DEMANDE	"
	 *    Demande classique et demande recherche
	 */
	
	@Column(name="fonc_agt_arecruter",nullable=true)  // uniquement pour les demandes classqiques
	private String foncAgentArecrute;
	
	@Column(name="branch_agt_arecruter",nullable=true)  // uniquement pour les demandes classqiques
	private String branchAgentArecruter;
	
	@Column(name="cat_agt_arecruter",nullable=true)  // uniquement pour les demandes classqiques
	private String catAgentArecruter;
	
	@Column(name="ficheposte",nullable=true)     // uniquement pour les demandes classqiques
	private String ficheposte;
	
	@Column(name="intfonc_agt_arecruter",nullable=true) // uniquement pour les demandes classqiques
	private String intfoncAgentArecruter;
	
	@Column(name="diplom_agt_arecruter", nullable=true)  // uniquement pour les demandes classqiques
	private String diplomAgentArecruter;
	
	@Column(name="argumentaires") 
	private String argumentaires;

	
	@Column(name="nom_chercheur", nullable=true) // uniquement pour les demandes recherches
	private String nomChercheur;
	
	@Column(name="prenom_chercheur",nullable=true) // uniquement pour les demandes recherches
	private String prenomChercheur;
	
	@Column(name="qualite_chercheur",nullable=true) // uniquement pour les demandes recherches
	private String qualiteChercheur;
	
	@Column(name="inm_chercheur",nullable=true) // uniquement pour les demandes recherches
	private String inmChercheur;
	
	@Column(name="missions",nullable=true) // uniquement pour les demandes recherches
	private String missions;
	
	
	
	/** zone du formulaire de demande : "IMPUTATION	"
	 *     Demande recherche uniquement
	 */
	
	@Column(name="cf" ,nullable=true) 
	private String cf;
	
	@Column(name="eotp", nullable=true) 
	private String eotp;
	
	@Column(name="domainefonctionnel",nullable=true) 
	private String domainefonctionnel;
	
	
	
	/** attributs lié axu personnes qui ont instruit, valide, cloturer une demande, 
	 *     ainsi que les observations faites lors de ses actions
	 */
	
	@OneToOne
	@JoinColumn(name="id_instructeur") //uniquement pour les demandes recrutement classique
	private Utilisateur instructeur;
	
	@Column(name="obs_instructions", nullable=true)
	private String obsInstruction;
	
	
	@OneToOne
	@JoinColumn(name="id_valideur")
	private Utilisateur valideur;
	
	@Column(name="obs_validation", nullable=true)
	private String obsValidation;
	
	@Column(name="avis_validation", nullable=true)
	private String avisValidation;
	
	@OneToOne
	@JoinColumn(name="id_clotureur") 
	private Utilisateur clotureur;
	
	@Column(name="obs_cloture", nullable=true)
	private String obsCloture;
	
	
	@OneToOne
	@JoinColumn(name="id_gestionnaire")  //uniquement pour les demandes recrutement classique
	private Utilisateur gestionnaire;
	
	@Column(name="statut_envoi_demande")
	private boolean statutEnvoiDemande;
	
	
	@OneToOne
	@JoinColumn(name="statut_encours" , nullable=true)  
	private StatutDemande statutEnCours;

    
	@Column(name="date_derniere_modification", nullable=true)
	private String dateDerniereModification;
	
	
	
	
	public String getAvisValidation() {
		return avisValidation;
	}


	public void setAvisValidation(String avisValidation) {
		this.avisValidation = avisValidation;
	}


	public String getDateDerniereModification() {
		return dateDerniereModification;
	}


	public void setDateDerniereModification(String dateDerniereModification) {
		this.dateDerniereModification = dateDerniereModification;
	}


	public StatutDemande getStatutEnCours() {
		return statutEnCours;
	}


	public void setStatutEnCours(StatutDemande statutEnCours) {
		this.statutEnCours = statutEnCours;
	}


	public boolean isStatutEnvoiDemande() {
		return statutEnvoiDemande;
	}


	public void setStatutEnvoiDemande(boolean statutEnvoiDemande) {
		this.statutEnvoiDemande = statutEnvoiDemande;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Utilisateur getDemandeur() {
		return demandeur;
	}


	public void setDemandeur(Utilisateur demandeur) {
		this.demandeur = demandeur;
	}


	public String getDatecreationDemande() {
		return datecreationDemande;
	}


	public void setDatecreationDemande(String datecreationDemande) {
		this.datecreationDemande = datecreationDemande;
	}


	public TypeDemande getTypeDemande() {
		return typeDemande;
	}


	public void setTypeDemande(TypeDemande typeDemande) {
		this.typeDemande = typeDemande;
	}


	public BesoinDemande getBesoinDemande() {
		return besoinDemande;
	}


	public void setBesoinDemande(BesoinDemande besoinDemande) {
		this.besoinDemande = besoinDemande;
	}


	


	public String getDateDebSouhaite() {
		return dateDebSouhaite;
	}


	public void setDateDebSouhaite(String dateDebSouhaite) {
		this.dateDebSouhaite = dateDebSouhaite;
	}


	public String getDateFinSouhaite() {
		return dateFinSouhaite;
	}


	public void setDateFinSouhaite(String dateFinSouhaite) {
		this.dateFinSouhaite = dateFinSouhaite;
	}


	public String getDureeSouhaite() {
		return dureeSouhaite;
	}


	public void setDureeSouhaite(String dureeSouhaite) {
		this.dureeSouhaite = dureeSouhaite;
	}


	public String getQuotite() {
		return quotite;
	}


	public void setQuotite(String quotite) {
		this.quotite = quotite;
	}


	public String getNomAgentAremplacer() {
		return nomAgentAremplacer;
	}


	public void setNomAgentAremplacer(String nomAgentAremplacer) {
		this.nomAgentAremplacer = nomAgentAremplacer;
	}


	public String getDateFinService() {
		return dateFinService;
	}


	public void setDateFinService(String dateFinService) {
		this.dateFinService = dateFinService;
	}


	public String getMotifDispoPoste() {
		return motifDispoPoste;
	}


	public void setMotifDispoPoste(String motifDispoPoste) {
		this.motifDispoPoste = motifDispoPoste;
	}


	public String getFoncAgentArecrute() {
		return foncAgentArecrute;
	}


	public void setFoncAgentArecrute(String foncAgentArecrute) {
		this.foncAgentArecrute = foncAgentArecrute;
	}


	public String getBranchAgentArecruter() {
		return branchAgentArecruter;
	}


	public void setBranchAgentArecruter(String branchAgentArecruter) {
		this.branchAgentArecruter = branchAgentArecruter;
	}


	public String getCatAgentArecruter() {
		return catAgentArecruter;
	}


	public void setCatAgentArecruter(String catAgentArecruter) {
		this.catAgentArecruter = catAgentArecruter;
	}


	public String getFicheposte() {
		return ficheposte;
	}


	public void setFicheposte(String ficheposte) {
		this.ficheposte = ficheposte;
	}


	public String getIntfoncAgentArecruter() {
		return intfoncAgentArecruter;
	}


	public void setIntfoncAgentArecruter(String intfoncAgentArecruter) {
		this.intfoncAgentArecruter = intfoncAgentArecruter;
	}


	public String getDiplomAgentArecruter() {
		return diplomAgentArecruter;
	}


	public void setDiplomAgentArecruter(String diplomAgentArecruter) {
		this.diplomAgentArecruter = diplomAgentArecruter;
	}


	public String getArgumentaires() {
		return argumentaires;
	}


	public void setArgumentaires(String argumentaires) {
		this.argumentaires = argumentaires;
	}


	public String getNomChercheur() {
		return nomChercheur;
	}


	public void setNomChercheur(String nomChercheur) {
		this.nomChercheur = nomChercheur;
	}


	public String getPrenomChercheur() {
		return prenomChercheur;
	}


	public void setPrenomChercheur(String prenomChercheur) {
		this.prenomChercheur = prenomChercheur;
	}


	public String getQualiteChercheur() {
		return qualiteChercheur;
	}


	public void setQualiteChercheur(String qualiteChercheur) {
		this.qualiteChercheur = qualiteChercheur;
	}


	public String getInmChercheur() {
		return inmChercheur;
	}


	public void setInmChercheur(String inmChercheur) {
		this.inmChercheur = inmChercheur;
	}


	public String getMissions() {
		return missions;
	}


	public void setMissions(String missions) {
		this.missions = missions;
	}


	public String getCf() {
		return cf;
	}


	public void setCf(String cf) {
		this.cf = cf;
	}


	public String getEotp() {
		return eotp;
	}


	public void setEotp(String eotp) {
		this.eotp = eotp;
	}


	public String getDomainefonctionnel() {
		return domainefonctionnel;
	}


	public void setDomainefonctionnel(String domainefonctionnel) {
		this.domainefonctionnel = domainefonctionnel;
	}


	public Utilisateur getInstructeur() {
		return instructeur;
	}


	public void setInstructeur(Utilisateur instructeur) {
		this.instructeur = instructeur;
	}


	public String getObsInstruction() {
		return obsInstruction;
	}


	public void setObsInstruction(String obsInstruction) {
		this.obsInstruction = obsInstruction;
	}


	public Utilisateur getValideur() {
		return valideur;
	}


	public void setValideur(Utilisateur valideur) {
		this.valideur = valideur;
	}


	public String getObsValidation() {
		return obsValidation;
	}


	public void setObsValidation(String obsValidation) {
		this.obsValidation = obsValidation;
	}


	public Utilisateur getClotureur() {
		return clotureur;
	}


	public void setClotureur(Utilisateur clotureur) {
		this.clotureur = clotureur;
	}


	public String getObsCloture() {
		return obsCloture;
	}


	public void setObsCloture(String obsCloture) {
		this.obsCloture = obsCloture;
	}


	public Utilisateur getGestionnaire() {
		return gestionnaire;
	}


	public void setGestionnaire(Utilisateur gestionnaire) {
		this.gestionnaire = gestionnaire;
	}
	
	
	
	

	
}
