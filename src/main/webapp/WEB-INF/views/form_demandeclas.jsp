<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8" />
        <title>Creation demande classique</title>
     <link type="text/css" rel="stylesheet" href="<c:url value="/resources/style.css"/>" />
     
     <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
	
     <script type="text/javascript" src="<c:url value="resources/javascript/formddeclassique.js"/>" > </script>
     <script src="<c:url value="resources/javascript/agentaremplacerclassique.js"/>" > </script>
  	 <script src="<c:url value="resources/javascript/hautdepage.js"/>" > </script>
		
		

    </head>

    <body>
    
    <header >
    	<jsp:include page="header.jsp"></jsp:include>
    
    </header>
    
    <section>
    
   	    <div class="menu">
			
			<jsp:include page="menu.jsp"></jsp:include>
		
		</div>
		
		<div class="content">
		
			

				<form method="post" name="form" action="ajoutdemandeclas"   onsubmit="return verifForm(this)"
				
					  onreset="return confirm('Voulez vous vraiment reinitialiser  ?');">
					  
					  
				<fieldset class="pere">
				
				<p>
				  <span class="error">
				   		<c:if test="${error!=null}">
				   			<img src="<c:url value="/resources/warning.jpg"/>" alt="" />
				   			<c:out value="${error}"/>
				   		</c:if>
				   </span>
				   <span id="errorform" class="error">  <c:out value="${errorform}"/></span> 
				 </p>
				 
				   <fieldset>
				       <legend>Emetteur de la demande </legend> <!-- Titre du fieldset --> 
				       
					   <p> 
				       <label for="composante">Composante demandeuse :</label>
				       <input type="text" name="composante" id="composante" value="<c:out value="${nomComposante}"/>" size="30" maxlength="30" disabled="disabled" />
				       </p>
				       
				       <p> 
				       <label for="nom">Nom demandeur :</label>
				       <input type="text" name="nom" id="nom" value="<c:out value="${user.nom}"/>" size="30" maxlength="30" disabled="disabled" />
						</p>
						
						<p> 
				       <label for="prenom">Prenom demandeur :</label>
				       <input type="text" name="prenom" id="prenom" value="<c:out value="${user.prenom}"/>" size="30" maxlength="30" disabled="disabled" />
				       </p> 
				       
				       <p> 
				       <label for="telephone">Téléphone :</label>
				       <input type="text" name="telephone" id="telephone" value="<c:out value="${telephone}"/>" size="30" maxlength="30" />
				 		</p> 
				 		
				 		<p> 
				       <label for="email">Adresse email :</label>
				       <input type="email" name="email" id="email" value="<c:out value="${user.email}"/>" size="30" maxlength="30" disabled="disabled" />
				       </p> 
				
				   </fieldset>
				   
				 
				   <fieldset>
				       <legend>Détermination du besoin</legend> <!-- Titre du fieldset -->
				       <p> 
				       <label for="nature">Nature de la demande : <span class="requis">*</span> </label>
				       <select name="nature" id="nature"  required autofocus >
				       	   <option value="" >Choisissez une option </option>
				           <option value="1">Emploi vacant</option>
				           <option value="2">Emploi temporaire/Suppléance</option>
				           <option value="3">Emploi pour renforcement</option>
				           
				        </select>  
				        
				       
				     
				       <p> 
				       <label for="dateDeb">Date de prise de fonctions souhaitée :<span class="requis">*</span> </label>
				       <input type="date" name="dateDeb" id="dateDeb" required>
				       </p>
				        
				       <p> 
				       <label for="dateFin">Date de fin de fonctions souhaitée : <span class="requis">*</span> </label>
				       <input type="date" name="dateFin" id="dateFin" required>
				       </p> 
				       
				      
				       
						<p> 
				       <label for="quotite">Quotité de temps de travail : <span class="requis">*</span> </label>
				        <select name="quotite" id="quotite" onblur="verifQuotite(this)">
				           <option value="">Choisissez une option </option>
				           <option value="100%">100 %</option>
				           <option value="90%">90 %</option>
				           <option value="80%">80 %</option>
				           <option value="70%">70 %</option>
				           <option value="60%">60 %</option>
				           <option value="50%">50 %</option>
				            <option value="40%">40 %</option>
				           <option value="30%">30 %</option>
				          
				          
				       </select>
				       <span id="errorquotite" class="error">  <c:out value="${errorquotite}"/></span>
				       </p> 
				       
				       
				       <div id="agent">
				       
				        <fieldset >
				      		 <legend>Agent à remplacer  </legend> <!-- Titre du fieldset --> 
				       				
							        
							       <p> 
							       <label for="nomagt">Nom : <span class="requis">*</span> </label>
							       <input type="text" name="nomagt" id="nomagt"  size="30" maxlength="30" onblur="verifNomagt(this)"/>
							       <span id="errornomagt" class="error">  <c:out value="${errornomagt}"/></span>
									</p>
									
									<p> 
							       <label for="prenomagt">Prénom : <span class="requis">*</span> </label>
							       <input type="text" name="prenomagt" id="prenomagt" onblur="verifPrenomagt(this)"/>
							       <span id="errorprenomagt" class="error">  <c:out value="${errorprenomagt}"/></span>
							       </p> 
							       
							       <p> 
							       <label for="dateagt">Date fin de service :<span class="requis">*</span> </label>
							       <input type="date" name="dateagt" id="dateagt" size="30" maxlength="30" onblur="verifDateagt(this)"/>
							       <span id="errordateagt" class="error">  <c:out value="${errordateagt}"/></span>
							 		</p> 
							 		
							 		<p> 
							       <label for="motif">Motif disponibilité poste  :<span class="requis">*</span> </label>
							       
							        <textarea name="motif" id="motif" rows="2" cols="40" onblur="verifMotif(this)" placeholder="Ex: congé de maternité, arrêt maladie..."></textarea>
							        <span id="errormotif" class="error">  <c:out value="${errormotif}"/></span> 
							       </p> 
							       
						</fieldset>
						</div>
						
						
				   </fieldset>
				   
				
				   
				   
				    <fieldset>
				       <legend>Eléments constitutifs de la demande </legend> <!-- Titre du fieldset --> 
						<p> 
				       <label for="fonction">Type de fonction :<span class="requis">*</span> </label>
				       <input type="text" name="fonction" id="fonction" required/>
				       </p> 
				       <p> 
				       <label for="branche">Branche d'activité :<span class="requis">*</span> </label>
				       
				         <select name="branche" id="branche" required> 
				           <option value="">Choisissez une option </option>
				           <option value="BAP A">BAP A</option>
				           <option value="BAP B">BAP B</option>
				           <option value="BAP C">BAP C</option>
				           <option value="BAP D">BAP D</option>
				           <option value="BAP E">BAP E</option>
				           <option value="BAP F">BAP F</option>
				            <option value="BAP G">BAP G</option>
				           <option value="BAP J">BAP J</option>
				          
				          
				       </select>
				       <a href="http://referens.univ-poitiers.fr/version/men/dcp.asp" target="_blank">Cliquez ici pour les details</a>
						
						</p> 
						
						<p> 
				       <label for="categorie">Catégorie poste :<span class="requis">*</span> </label>
				        <select name="categorie" id="categorie"   onblur="verifCategorie(this)">
				           <option value="">Choisissez une option </option>
				           <option value="A">A </option>
				           <option value="B">B </option>
				           <option value="C">C </option>
				       </select>
				        <span id="errorcategorie" class="error">  <c:out value="${errorcategorie}"/></span>
				       </p> 
				       
				      
				       
				       <p> 
				       
				       
				       <label for="ficheposte">Fiche de poste :<span class="requis">*</span> </label>
				       <input type="file" name="ficheposte" id="ficheposte"  />
				       <input type="submit" value="Ajouter" name="action">
				      
					  </p> 
					 
						 
						 <p> 
				       <label for="intitule">Intitule de la fonction :<span class="requis">*</span> </label>
				       <input type="text" name="intitule" id="intitule" onblur="verifIntitule(this)"/>
				       <span id="errorintitule" class="error">  <c:out value="${errorintitule}"/></span>
				       </p> 
				       
				       <p> 
				       <label for="niveau">Niveau diplôme  :<span class="requis">*</span> </label>
				        <select name="niveau" id="niveau"  onblur="verifNiveau(this)">
				           <option value="">Choisissez une option </option>
				           <option value="ind">Indifferent</option>
				           <option value="BAC">BAC </option>
				           
				           <option value="BAC + 1">BAC + 1</option>
				           <option value="BAC + 2">BAC + 2</option>
				           <option value="BAC + 3">BAC + 3</option>
				           <option value="BAC + 4">BAC + 4</option>
				           <option value="BAC + 5">BAC + 5</option>
				           <option value="BAC + 6">BAC + 6</option>
				           <option value="BAC + 7">BAC + 7</option>
				           <option value="BAC + 8">BAC + 8</option>
				           
				       </select>
				       <span id="errorniveau" class="error">  <c:out value="${errorniveau}"/> </span>
				       </p> 
				       
				     	<p>
				       <label for="argumentaire"> Argumentaires :<span class="requis">*</spsan> </label>
				       
				       <textarea name="argumentaire" id="argumentaire"  style="overflow:hidden; " cols="50" placeholder="Votre argumentaire!!!" onblur="verifArgumentaire(this)"></textarea>  
				       <span id="errorargumentaire" class="error">  <c:out value="${errorargumentaire}"/></span>  
				       </p>
				     
				
				   </fieldset>
				   <p>
				   <span class="error">
				   		<c:if test="${error!=null}">
				   			<img src="<c:url value="/resources/warning.jpg"/>" alt="" />
				   			<c:out value="${error}"/>
				   		</c:if>
				   </span>
				  
				   </p>
				
				   
				   <input type="reset" value="Annuler" />
				   

				   <input type="hidden" value="" id="pushedbutton" name="pushedbutton" />
				   
				   <input type="submit" value="Enregistrer" id="action" name="action" onclick="document.getElementById('pushedbutton').value='0' "/>
				   
				   <input type="submit" value="Envoyer" id="action" name="action" onclick="document.getElementById('pushedbutton').value='1' "/>
				   
				
				   
				  </fieldset> 
				   
				   
				</form>
			</div>
		
		 </section>
     
     	<footer >
		<jsp:include page="footer.jsp"></jsp:include>
		</footer>

		<a href="#" title="Haut de page" class="scrollup"><i class="fa fa-arrow-up"></i></a>

	

 

</body>



</html>