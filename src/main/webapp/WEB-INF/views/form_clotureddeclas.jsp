<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8" />
        <title>Cloture demande classique</title>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/style.css"/>" />
       


    </head>

    <body>
    
    <header>
    	<jsp:include page="header.jsp"></jsp:include>
    
    </header>
    
    <section>
    
   	    <div class="menu">
			
			<jsp:include page="menu.jsp"></jsp:include>
		
		</div>
		
		<div class="content">
		
			<form method="post" action="cloturedemandeclas">
			
			
			<fieldset class="pere">
				 
				 	<span class="erreur"> <c:out value="${error}"/></span>
				 
				   <fieldset>
				       <legend>Emetteur de la demande </legend> <!-- Titre du fieldset --> 
				       
					   <p> 
				       <label for="datecreation">Demande emise le : <span class="affichage" > <c:out value="${demande.datecreationDemande}"/>  </span> </label> 
				       
				       </p>
				       
				       <p> 
				       <label for="nom">Nom et prenom demandeur :  <span class="affichage"> <c:out value="${demande.demandeur.nom}"/>  <c:out value="${demande.demandeur.prenom}"/>,  <c:out value="${demande.demandeur.composante.libelle_composante}"/>   </span></label>
						</p>
					
				       
				       <p> 
				       <label for="telephone">Contact :   <span class="affichage">   <c:out value="${demande.demandeur.email}"/>  </span></label>
				      
				 		</p> 
			
				   </fieldset>
				   
				 
				   <fieldset>
				   
				       <legend>Détermination du besoin</legend> <!-- Titre du fieldset -->
				       <p> 
				       <label for="nature">Nature de la demande : <span class="affichage" id=nature value="<c:out value="${demande.besoinDemande.id}"/>">   <c:out value="${demande.besoinDemande.libelleBesoinDemande}"/>  </span></label>
				       </p>
				        
				   
				       <p> 
				       <label for="dateDeb">Periode : <span class="affichage"><c:out value="Du  ${demande.dateDebSouhaite}  Au   ${demande.dateFinSouhaite} "/></span></label>
				      
				       </p>
				        
				
						<p> 
				       <label for="quotite">Quotité de temps de travail : <span class="affichage"><c:out value="${demande.quotite}"/></span></label>
				       
				       </p> 
				       
				       
				       
						<!-- Si le type de besoin de la demande est different de "emploi pour renforcement"-->
				        
				        <c:if test="${demande.besoinDemande.id !='3'}">
				       
				        <fieldset >
				      		 <legend>Agent à remplacer  </legend> <!-- Titre du fieldset --> 
				       
							       
							        
							       <p> 
							       <label for="nomagt">Nom et prenom Agent : <span class="affichage"><c:out value="${demande.nomAgentAremplacer}"/></span> </label>
							       
									</p>
						   
							       <p> 
							       <label for="dateagt">Date fin de service : <span class="affichage"> <c:out value="${demande.dateFinService }"/></span></label>
							       
							 		</p> 
							 		
							 		<p> 
							       <label for="motif">Motif disponibilité poste  :<span class="affichage"> <c:out value="${demande.motifDispoPoste }"/></span></label>
							       
							        
							       </p> 
							       
								
						</fieldset>
						
						</c:if>
						
						
						
				   </fieldset>
				   
				
				   
				   
				    <fieldset>
				       <legend>Eléments constitutifs de la demande </legend> <!-- Titre du fieldset --> 
				       
						<p> 
				       <label for="fonction">Type de fonction,  Branche d'activité  et  Catégorie poste  :<span class="affichage">
				       			<c:out value="${demande.foncAgentArecrute},  ${demande.branchAgentArecruter} et   ${demande.catAgentArecruter}"/></span> </label>
				      
				       </p> 
				      
						
				       <p> 
				       <label for="fiche">Fiche de poste :<span class="affichage"></span> </label>
				      
					  </p> 
						 
						 <p> 
				       <label for="intitule">Intitule de la fonction et Niveau diplôme:<span class="affichage"> <c:out value="${demande.intfoncAgentArecruter}  et  ${demande.diplomAgentArecruter}"/></span> </label>
				      
				       </p> 
				       
				      
				       
				      <p>
				       <label for="argumentaire"> Argumentaires : </label>
				       <textarea name="argumentaire" id="argumentaire" rows="4" cols="50"  disabled="disabled" ><c:out value="${demande.argumentaires }"/>
				      
				       </textarea>       
				       </p>
			
		
		
			</fieldset>
			<fieldset>
				
				<legend> Instruction de la demande </legend>
				
				<label>Demande instruite par : <span class="affichage"> <c:out value="${demande.instructeur.nom} ${demande.instructeur.prenom} "/></span></label>
				
				<p>
				<label for="observation"> Observations :</label>
				<textarea name="observation" id="observation" rows="4" cols="50" disabled="disabled" ><c:out value="${demande.obsInstruction }"/></textarea>       
		
				</p>
			
			
			
			</fieldset>
			
			
			<fieldset>
				
				<legend> Validation de la demande </legend>
				
				<label>Demande validée par : <span class="affichage"> <c:out value="${demande.valideur.nom} ${demande.valideur.prenom} "/></span></label>;
				<label>Avis validateur : <span class="affichage"> <c:out value="${demande.avisValidation} "/></span></label>
				
				<p>
				
				<label for="obsValidation">Remarques :</label>
				<textarea name="obsValidation" id="obsValidation" rows="4" cols="50" disabled="disabled" ><c:out value="${demande.obsValidation }"/></textarea>       
		
				</p>
			
				
			
			</fieldset>
			
			<fieldset>
				
				<legend> Clôture de la demande </legend>
				
				
					<input type="hidden" name="iddemande" id="iddemande"  value="<c:out value="${demande.id}"/>" />
					<div id="agentrecrute">
					
					
					<c:if test="${demande.avisValidation=='oui'}">
				
						
						<p> 
				       <label for="nomAgent">Nom Agent : <span class="requis">*</span> </label>
				       <input type="text" name="nomAgent" id="nomAgent" required/>
				       <label for="prenomAgent">Prenom Agent :<span class="requis">*</span> </label>
				       <input type="text" name="prenomAgent" id="prenomAgent" required />
				       </p>
				       
				      
				       
				       <p> 
				       <label for="dateDebutAgent">Date debut contrat : <span class="requis">*</span> </label>
				       <input type="date" name="dateDebutAgent" id="dateDebutAgent" required>
				       <label for="dateFinAgent">Date fin contrat: <span class="requis">*</span> </label>
				       <input type="date" name="dateFinAgent" id="dateFinAgent" required>
				       </p>
				       
				     </c:if>
				     
				     
				     <c:if test="${demande.avisValidation=='non'}">
				     				   
				       <input type="hidden" name="nomAgent" id="nomAgent" />
				      
				       <input type="hidden" name="prenomAgent" id="prenomAgent" />
				  
				       <input type="hidden" name="dateDebutAgent" id="dateDebutAgent" >
				   
				       <input type="hidden" name="dateFinAgent" id="dateFinAgent" >
				       
				      </c:if>
				      
				     
				       <p> 
				       <label for="obsCloture">Observations : <span class="requis">*</span> </label>
				      
				       	<textarea name="obsCloture" id="obsCloture" rows="2" cols="50"  >Vos observations</textarea>   
				       </p>
				        
				      </div> 
				
				
							
			</fieldset>
			
					<input type="reset" value="Annuler" >
				 
				    <input type="submit" value="Clôturer" name="action">
			
			
			</fieldset>
			
			</form>
		
		
		</div>
		
	</section>
	
	<footer >
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
	
	

</body>
</html>