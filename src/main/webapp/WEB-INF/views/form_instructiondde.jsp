<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8" />
        <title>Creation demande classique</title>
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
		
			<form method="post" action="instructiondemande">
			
			
			<fieldset class="pere">
				 
				   <fieldset>
				       <legend>Emetteur de la demande </legend> <!-- Titre du fieldset --> 
				       
					   <p> 
				       <label for="datecreation">Demande emise le : <span > <c:out value="${demande.datecreationDemande}"/>  </span> </label> 
				       
				       </p>
				       
				       <p> 
				       <label for="nom">Nom et prenom demandeur :  <span > <c:out value="${demande.nom}  ${demande.prenom},  ${demande.composante.libelle_composante}"/>   </span></label>
						</p>
					
				       
				       <p> 
				       <label for="telephone">Contact :   <span>   <c:out value="${demande.email}"/>  </span></label>
				      
				 		</p> 
			
				   </fieldset>
				   
				 
				   <fieldset>
				   
				       <legend>Détermination du besoin</legend> <!-- Titre du fieldset -->
				       <p> 
				       <label for="nature">Nature de la demande : <span>   <c:out value="${demande.besoinDemande.libelleBesoinDemande}"/>  </span></label>
				       </p>
				        
				   
				       <p> 
				       <label for="dateDeb">Periode : <span><c:out value="DU ${demande.dateDebSouhaite} AU ${demande.dateFinSouhaite} "/></span></label>
				      
				       </p>
				        
				
						<p> 
				       <label for="quotite">Quotité de temps de travail : <span><c:out value="${demande.quotite}"/></span></label>
				       
				       </p> 
				       
				       
				        <fieldset >
				      		 <legend>Agent à remplacer  </legend> <!-- Titre du fieldset --> 
				       
							        <div id="agent">
							        
							       <p> 
							       <label for="nomagt">Nom et prenom Agent : <span ><c:out value="${demande.nomAgentAremplacer}"/></span> </label>
							       
									</p>
						   
							       <p> 
							       <label for="dateagt">Date fin de service : <span> <c:out value="${demande.dateFinService }"/></span></label>
							       
							 		</p> 
							 		
							 		<p> 
							       <label for="motif">Motif disponibilité poste  :</label>
							       
							        <textarea name="motif" id="motif" rows="2" cols="40" value="<c:out value="${demande.motif }"/>" size="30" maxlength="30" disabled="disabled" >
							         
							       </textarea> 
							       </p> 
							       
									</div>
						</fieldset>
						
						
				   </fieldset>
				   
				
				   
				   
				    <fieldset>
				       <legend>Eléments constitutifs de la demande </legend> <!-- Titre du fieldset --> 
				       
						<p> 
				       <label for="fonction">Type de fonction, Branche d'activité et Catégorie poste:<span >
				       			<c:out value="${demande.foncAgentArecrute}, ${demande.branchAgentArecruter} et ${demande.catAgentArecruter}"/></span> </label>
				      
				       </p> 
				      
						
				       <p> 
				       <label for="fiche">Fiche de poste :<span ></span> </label>
				      
					  </p> 
						 
						 <p> 
				       <label for="intitule">Intitule de la fonction et Niveau diplôme:<span ><c:out value="${demande.intfoncAgentArecruter} et ${demande.diplomAgentArecruter}"/></span> </label>
				      
				       </p> 
				       
				      
				       
				      <p>
				       <label for="argumentaire"> Argumentaires : </label>
				       <textarea name="argumentaire" id="argumentaire" rows="6" cols="50" value="${demande.argumentaires }" disabled="disabled" >
				      
				       </textarea>       
				       </p>
			
			<%-- <fieldset class="pere">
			<fieldset>
				
				<legend>Demande recrutement classique </legend>
				
				<p>
				<div>- Demande emise le : <br/>
						<label><c:out value="${demande.datecreationDemande}" /></label></div>
				</p>
				
				
				<div>- Informations emmeteur de la demande <br/>
						<label>Composante demandeur :   <c:out value="${demande.demandeur.nom}"/> </label><br/>
						<label>Nom et prenom demandeur: <c:out value="${demande.demandeur.nom} ${demande.demandeur.prenom}, ${demande.demandeur.composante.libelle_composante} "/> </label>	<br/>	
						<label> Contact demandeur :  <c:out value="${demande.demandeur.email}"/> </label><br/>
				</div>
				
				
				<div>- Informations sur l'objet de la demande <br/>
						<label>Nature de la demande :   <c:out value="${demande.besoinDemande.libelleBesoinDemande}"/> </label><br/>
						<label>Date de debut et de fin de fonctions souhaitée : <c:out value="${demande.dateFinService} ${demande.dateFinSouhaite} "/> </label>	<br/>	
						<label> Quotité de temps de travail :  <c:out value="${demande.quotite}"/> </label><br/>
				</div>
				
				
				<div id="agentAremplacer">- Informations sur l'Agent à remplacer  <br/>
						<label>Nom et prenom Agent :   <c:out value="${demande.nomAgentAremplacer}"/> </label><br/>
						<label>Date fin de service : <c:out value="${demande.dateDebSouhaite} ${demande.dateFinSouhaite} "/> </label><br/>		
						<label> Motif indisponibilité d l'Agent :  <c:out value="${demande.motif}"/> </label><br/>
				</div>
				
				
				<div>- Eléments constitutifs de la demande <br/>
				
						<label>Type de fonction, Branche d'activité et Catégorie poste:   <c:out value="${demande.foncAgentArecrute}, ${demande.branchAgentArecruter} et ${demande.catAgentArecruter}"/> </label><br/>
						<label>Fiche de poste : <c:out value="${demande.dateDebSouhaite} ${demande.dateFinSouhaite} "/> </label><br/>		
						<label> Intitule de la fonction et Niveau de diplome requis :  <c:out value="${demande.intfoncAgentArecruter} et ${demande.diplomAgentArecruter}"/> </label><br/>
						<label> Argumentaire de la demande:  <c:out value="${demande.argumentaires}"/> </label>
				
				</div>
				
			
			</fieldset>  --%>
		
			</fieldset>
			<fieldset>
				
				<legend> Instruction de la demande </legend>
				
				<p>
				<label for="observation"> Observations :<span class="requis">*</span> </label>
				<textarea name="observation" id="observation" rows="6" cols="50" required>Vos observations</textarea>       
				</p>
			
			
			
			</fieldset>
			
					<input type="reset" value="Annuler" >
				 
				    <input type="submit" value="Instruire" name="action">
			
			
			</fieldset>
			
			</form>
		
		
		</div>
		
	</section>
	
	<footer >
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>

</body>
</html>