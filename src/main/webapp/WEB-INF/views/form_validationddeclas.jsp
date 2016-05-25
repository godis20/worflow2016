<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8" />
        <title>Validation demande classique</title>
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
		
			<form method="post" action="validationdemandeclas">
			
			
			<fieldset class="pere">
				 
				 <p>
				 	<span class="error">
				   		<c:if test="${error!=null}">
				   			<img src="<c:url value="/resources/warning.jpg"/>" alt="" />
				   			<c:out value="${error}"/>
				   		</c:if>
				   </span>
				 </p>
				 
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
				       <textarea name="argumentaire" id="argumentaire" rows="6" cols="50"  disabled="disabled" ><c:out value="${demande.argumentaires }"/>
				      
				       </textarea>       
				       </p>
			
		
		
			</fieldset>
			<fieldset>
				
				<legend> Instruction de la demande </legend>
				
				<label>Demande instruite par : <span class="affichage"> <c:out value="${demande.instructeur.nom} ${demande.instructeur.prenom} "/></span>
				
				<p>
				<label for="observation"> Observations :</label>
				<textarea name="observation" id="observation" rows="6" cols="50" disabled="disabled" ><c:out value="${demande.obsInstruction }"/></textarea>       
				<input type="hidden" name="iddemande" id="iddemande"  value="<c:out value="${demande.id}"/>" />
				</p>
			
			
			
			</fieldset>
			
			
			<fieldset>
				
				<legend> Validation de la demande </legend>
				
				<p>
				<label for="obsValidation">Remarques :</label>
				<textarea name="obsValidation" id="obsValidation" rows="6" cols="50" placeholder="Vos remarques par rapport à la decision prise"required ></textarea>       
				<input type="hidden" name="iddemande" id="iddemande"  value="<c:out value="${demande.id}"/>" />
				</p>
			
				<p>
				
				 <label for="obsValidation">Decision : <span class="requis">*</span></label>
				<input  type="radio"  name="avis" value="oui" id="avis"  required/> <label for="avis">Oui</label>
       			<input  type="radio"  name="avis" value="non" id="avis"  required/> <label for="avis">Non</label>
				</p>
				
				<div id="gestionnaire">
				
					<label for="gestionnaire">Gestionnaire de la demande : <span class="requis">*</span></label>
					<input  type="text" name="gestionnaire"  id="gestionnaire" /> 
				
				</div>
				
				
			
			</fieldset>
					<p>
			
					<span class="error">
				   		<c:if test="${error!=null}">
				   			<img src="<c:url value="/resources/warning.jpg"/>" alt="" />
				   			<c:out value="${error}"/>
				   		</c:if>
				   </span>
					</p>
					
					<input type="reset" value="Annuler" >
				 
				    <input type="submit" value="Valider" name="action">
			
			
			</fieldset>
			
			</form>
		
		
		</div>
		
	</section>
	
	<footer >
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
	
	
	 <%-- Petite fonction jQuery permettant de masquer le bloc "Gestionnaire de la demande" de l'avis du validateur. --%>
        <script src="/js/jquery.min.js"></script>
       
        
	   <script src="//code.jquery.com/jquery-2.0.3.min.js"></script>
        
        
        <script type="text/javascript">
        	$(document).ready(function(){
        		/* 1 - Au lancement de la page, on cache le bloc d'éléments du formulaire correspondant au gestionnaire de la demande */
//         		$("div#ancienClient").hide();
        		/* 2 - Au clic sur un des deux boutons radio "oui", on affiche le bloc d'éléments "gestionnaire" si la valeur est oui */
                
        		 $("div#gestionnaire").hide();
        		
        		 $("#avis").change(function() {
                	
                    
                    if($("#avis").val() == "oui"){
                    	
                    	$("div#gestionnaire").show("fast");
                    	
                   }
                    else  $("div#gestionnaire").hide();
                });
        		 
            });
        </script>
	
	
	
</body>
</html>