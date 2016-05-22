<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8" />
        <title>Page demande de recrutement recherche</title>
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


			<form method="post" action="ajoutdemanderech">
			<fieldset class="pere">
			 
			   <fieldset>
			   
			   		<span class="error">
				   		<c:if test="${error!=null}">
				   			<img src="<c:url value="/resources/warning.jpg"/>" alt="" />
				   			<c:out value="${error}"/>
				   		</c:if>
				   </span>
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
			       <label for="telephone">Téléphone :</label> <span class="requis">*</span></label>
			       <input type="text" name="telephone" id="telephone" value="<c:out value="${telephone}"/>" size="30" maxlength="30" />
			 		</p> 
			 		
			 		<p> 
			       <label for="email">Adresse email  :</label>
			       <input type="email" name="email" id="email" value="<c:out value="${user.email}"/>" size="30" maxlength="30" disabled="disabled" />
			       </p> 
			
			   </fieldset>
			   
			   
			   <fieldset>
			       <legend>Elements constitutifs de la demande</legend> <!-- Titre du fieldset -->
			       
			       
			       <p> 
			       <label for="nomAgent">Nom de l'élément à recruter : <span class="requis">*</span></label>
			       <input type="text" name="nomAgent" id="nomAgent" required/>
			       </p>
			       
			       <p> 
			       <label for="prenomAgent">Prenom de l'élément à recruter :<span class="requis">*</span></label>
			       <input type="text" name="prenomAgent" id="prenomAgent" required/>
			       </p>
			       
			         <p> 
			       <label for="dateDeb">Date debut du contrat  : <span class="requis">*</span></label>
			       <input type="date" name="dateDeb" id="dateDeb" required>
			       </p>
			        
			       <p> 
			       <label for="dateFin">Date fin du contrat : <span class="requis">*</span></label>
			       <input type="date" name="dateFin" id="dateFin" required>
			       </p> 
			       
			       <p> 
			       <label for="duree">Duree : </label>
			       <input type="text" name="duree" id="duree" value="<c:out value="${duree}"/>" size="30" maxlength="30" disabled="disabled">
			       </p> 
			       
			       <p> 
			       <label for="qualite">Qualité : <span class="requis">*</span></label>
			       <select name="qualite" id="qualite" required autofocus>
			       	   <option value="none">Choisissez une option </option>
			           <option value="vacant">chercheur</option>
			           <option value="temporaire">chercheur 1</option>
			           <option value="renforcement">chercheur 2</option>
			           <option value="autres">chercheur 3</option>
			        </select> 
			        </p> 
			        
			        <p>
			        <label for="inm">INM :<span class="requis">*</span></label>
			        <input type="text" name="inm" id="inm">
			      	</p>
			          
			     
			       <p> 
			       <label for="objet">Objet de la demande : <span class="requis">*</span></label>
			       <input type="text" name="objet" id="objet">
			       </p>
			       
			       <p>
			       <label for="missions"> Missions : <span class="requis">*</span></label>
			       <textarea name="missions" id="missions" rows="6" cols="50" placeholder="Principales missions">
			       </textarea>       
			       </p>
			        
			       
			   </fieldset>
			   
			   
			   
			   
			    <fieldset>
			       <legend>Imputations </legend> <!-- Titre du fieldset --> 
			       
			        <p> 
			       <label for="cf">CF : <span class="requis">*</span></label>
			       <input type="text" name="cf" id="cf" />
			       </p>
			       
			       <p> 
			       <label for="eotp">EOTP : <span class="requis">*</span></label>
			       <input type="text" name="eotp" id="eotp" />
			       </p>
			       
					<p> 
			       <label for="domaine">Domaine fonctionnel : <span class="requis">*</span></label>
			       <input type="text" name="domaine" id="domaine" />
			       </p> 
			       <p> 
			      
			       
			       <p>
			       <label for="argumentaire">Argumentaires : <span class="requis">*</span></label>
			       <textarea name="argumentaire" id="argumentaire" rows="6" cols="50" placeholder="Votre argumentaire par rapport à la demande">
			       </textarea>       
			       </p>
			
			   </fieldset>
			   
			   		<span class="error">
				   		<c:if test="${error!=null}">
				   			<img src="<c:url value="/resources/warning.jpg"/>" alt="" />
				   			<c:out value="${error}"/>
				   		</c:if>
				   </span>
			   
			       <input type="reset" value="Annuler" >
				   <input type="submit" value="Enregistrer" name="action">
				   <input type="submit" value="Envoyer" name="action">
			   
			
			  </fieldset> 
			 
			</form>
		</div>
	</section>
	
	<footer >
		<jsp:include page="footer.jsp"></jsp:include>
		</footer>

</body>



</html>