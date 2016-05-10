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
				 
				 	<span> <c:out value="${error}"/></span>
				 
				   <fieldset>
				       <legend>Emetteur de la demande </legend> <!-- Titre du fieldset --> 
				       
					   <p> 
				       <label for="datecreation">Demande emise le : <span > <c:out value="${demande.datecreationDemande}"/>  </span> </label> 
				       
				       </p>
				       
				       <p> 
				       <label for="nom">Nom et prenom demandeur :  <span > <c:out value="${demande.demandeur.nom}"/>  <c:out value="${demande.demandeur.prenom}"/>,  <c:out value="${demande.demandeur.composante.libelle_composante}"/>   </span></label>
						</p>
					
				       
				       <p> 
				       <label for="telephone">Contact :   <span>   <c:out value="${demande.demandeur.email}"/>  </span></label>
				      
				 		</p> 
			
				   </fieldset>
				   
				 
				   <fieldset>
				   
				       <legend>Détermination du besoin</legend> <!-- Titre du fieldset -->
				       <p> 
				       <label for="nature">Nature de la demande : <span id=nature value="<c:out value="${demande.besoinDemande.id}"/>">   <c:out value="${demande.besoinDemande.libelleBesoinDemande}"/>  </span></label>
				       </p>
				        
				   
				       <p> 
				       <label for="dateDeb">Periode : <span><c:out value="Du  ${demande.dateDebSouhaite}  Au   ${demande.dateFinSouhaite} "/></span></label>
				      
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
							       
							        <textarea name="motif" id="motif" rows="2" cols="40"  size="30" maxlength="30" disabled="disabled" ><c:out value="${demande.motifDispoPoste }"/>
							         
							       </textarea> 
							       </p> 
							       
									</div>
						</fieldset>
						
						
				   </fieldset>
				   
				
				   
				   
				    <fieldset>
				       <legend>Eléments constitutifs de la demande </legend> <!-- Titre du fieldset --> 
				       
						<p> 
				       <label for="fonction">Type de fonction,  Branche d'activité  et  Catégorie poste  :<span >
				       			<c:out value="${demande.foncAgentArecrute},  ${demande.branchAgentArecruter} et   ${demande.catAgentArecruter}"/></span> </label>
				      
				       </p> 
				      
						
				       <p> 
				       <label for="fiche">Fiche de poste :<span ></span> </label>
				      
					  </p> 
						 
						 <p> 
				       <label for="intitule">Intitule de la fonction et Niveau diplôme:<span > <c:out value="${demande.intfoncAgentArecruter}  et  ${demande.diplomAgentArecruter}"/></span> </label>
				      
				       </p> 
				       
				      
				       
				      <p>
				       <label for="argumentaire"> Argumentaires : </label>
				       <textarea name="argumentaire" id="argumentaire" rows="6" cols="50"  disabled="disabled" ><c:out value="${demande.argumentaires }"/>
				      
				       </textarea>       
				       </p>
			
		
		
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
	
	
	 <%-- Petite fonction jQuery permettant de masquer le bloc "agent a remplacer" en fonction du type de besoin. --%>
        <script>
        	$(document).ready(function(){
        		/* 1 - Au lancement de la page, on cache le bloc d'éléments du formulaire correspondant aux clients existants */
//         		$("div#ancienClient").hide();
        		/* 2 - Au clic sur un des deux boutons radio "choixNouveauClient", on affiche le bloc d'éléments correspondant (nouveau ou ancien client) */
                
        		 $("div#agent").hide();
        		 $("#nature").change(function() {
                	
                    
                    if("#nature" != "3"){
                    	
                    	$("div#agent").show();
                   }
                    else  $("div#agent").hide();
                });
        		 
            });
        </script>

</body>
</html>