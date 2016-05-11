<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8" />
        <title>Validation demande recherche</title>
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
		
			<form method="post" action="validationdemanderech">
			
			
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
				       <legend>Eléments constitutifs de la demande </legend> <!-- Titre du fieldset --> 
				       
						<p> 
				       <label for="nomAgent">Nom et prenom de l'élément à recruter :  :<span class="affichage">
				       			<c:out value="${demande.nomChercheur}  ${demande.prenomChercheur} "/></span> </label>
				      
				       </p> 
				       
				        
				       <p> 
				       <label for="dateDeb">Periode : <span class="affichage"><c:out value="Du  ${demande.dateDebSouhaite}  Au   ${demande.dateFinSouhaite} "/></span></label>
				      
				       </p>
				      
						
				       <p> 
				       <label for="qualite">Qualité  :<span class="affichage"> <c:out value="${demande.qualiteChercheur}"/></span> ;</label>
				        <label for="intitule">INM  :<span class="affichage"> <c:out value="${demande.inmChercheur}"/></span> </label>
				      
					  </p> 
						 
						
				      <p> 
				       <label for="nature">Objet de la demande : <span class="affichage" >   <c:out value="${demande.autreBesoinDemande}"/>  </span></label>
				       </p>
				        
				      
				       <p>
				       <label for="missions"> Missions : </label>
				       <textarea name="missions" id="missions" rows="4" cols="60"  disabled="disabled" ><c:out value="${demande.missions }"/>
				      
				       </textarea>       
				       </p> 
				      
			
		
		
					</fieldset>
					
			
			 		<fieldset>
				   
				       <legend>Imputation </legend> <!-- Titre du fieldset -->
				       
				       <p> 
				       <label for="nature">CF  : <span class="affichage" id=nature value="<c:out value="${demande.cf}"/>">   <c:out value="${demande.besoinDemande.libelleBesoinDemande}"/>; </span></label>
				       <label for="dateDeb">EOTP : <span class="affichage"><c:out value="Du  ${demande.eotp}   "/></span></label>
				       </p>
				        
				   
				
						<p> 
				       <label for="domainefonctionnel">Domaine fonctionnel  : <span class="affichage"><c:out value="${demande.domainefonctionnel}"/></span></label>
				       
				       </p> 
				       
				       <p>
				       <label for="argumentaires"> Missions : </label>
				       <textarea name="argumentaires" id="argumentaires" rows="4" cols="60"  disabled="disabled" ><c:out value="${demande.argumentaires}"/>
				      
				       </textarea>       
				       </p> 
						
						
				   	</fieldset>
			
			
			
			
					<fieldset>
				
						<legend> Validation de la demande </legend>
						
						<p>
						<label for="obsValidation">Remarques :</label>
						<textarea name="obsValidation" id="obsValidation" rows="4" cols="60" required >Vos remarques</textarea>       
						<input type="hidden" name="iddemande" id="iddemande"  value="<c:out value="${demande.id}"/>" />
						</p>
					
						<p>
						 
						<input  type="radio" name="avis" value="oui" id="oui" checked/> <label for="oui">Oui</label>
		       			<input  type="radio" name="avis" value="non" id="non" /> <label for="non">Non</label>
						<input  type="radio" name="avis" value="non" id="nonmais" /> <label for="non">Non, mais ...</label>
						
						</p>
			
					</fieldset>
					
			
					<input type="reset" value="Annuler" >
				 
				    <input type="submit" value="Valider" name="action">
			
			
			</fieldset>
			
			</form>
		
		
		</div>
		
	</section>
	
	<footer >
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
	
	
</body>
</html>