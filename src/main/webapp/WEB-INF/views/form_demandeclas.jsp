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

				<form method="post" action="ajoutdemandeclas">
				<fieldset class="pere">
				 
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
				       <label for="email">Adresse email * :</label>
				       <input type="email" name="email" id="email" value="<c:out value="${user.email}"/>" size="30" maxlength="30" disabled="disabled" />
				       </p> 
				
				   </fieldset>
				   
				 
				   <fieldset>
				       <legend>Détermination du besoin</legend> <!-- Titre du fieldset -->
				       <p> 
				       <label for="nature">Nature de la demande : </label>
				       <select name="nature" id="nature" required autofocus  >
				       	   <option value="none">Choisissez une option </option>
				           <option value="1">Emploi vacant</option>
				           <option value="2">Emploi temporaire</option>
				           <option value="3">Emploi pour renforcement</option>
				           
				        </select>  
				        
				       
				     
				       <p> 
				       <label for="dateDeb">Date de prise de fonctions souhaitée* : </label>
				       <input type="date" name="dateDeb" id="dateDeb" required>
				       </p>
				        
				       <p> 
				       <label for="dateFin">Date de fin de fonctions souhaitée* : </label>
				       <input type="date" name="dateFin" id="dateFin" required>
				       </p> 
				       
				      
				       
						<p> 
				       <label for="quotite">Quotité de temps de travail* : </label>
				        <select name="quotite" id="quotite" required>
				           <option value="none">Choisissez une option </option>
				           <option value="100">100 %</option>
				           <option value="75">75 %</option>
				           <option value="50">50 %</option>
				           <option value="25">25 %</option>
				          
				       </select>
				       </p> 
				       
				       
				        <fieldset >
				      		 <legend>Agent à remplacer  </legend> <!-- Titre du fieldset --> 
				       
							        <div id="agent">
							        
							       <p> 
							       <label for="nomagt">Nom : <span class="requis">*</span> </label>
							       <input type="text" name="nomagt" id="nomagt" value="<c:out value=""/>" size="30" maxlength="30" onblur="verifNom(this)"/>
							       <span id="erreurnom" class="erreur"></span>
									</p>
									
									<p> 
							       <label for="prenomagt">Prénom :</label>
							       <input type="text" name="prenomagt" id="prenomagt" />
							       </p> 
							       
							       <p> 
							       <label for="dateagt">Date fin de service* :</label>
							       <input type="date" name="dateagt" id="dateagt" rvalue="<c:out value=""/>" size="30" maxlength="30" onblur="verifDateFin(this)"/>
							 		</p> 
							 		
							 		<p> 
							       <label for="motif">Motif disponibilité poste * :</label>
							       
							        <textarea name="motif" id="motif" rows="2" cols="40" value="<c:out value=""/>" size="30" maxlength="30" onblur="verifMotif(this)">
							          Ex: décéde, congé maternité...
							       </textarea> 
							       </p> 
							       
									</div>
						</fieldset>
						
						
				   </fieldset>
				   
				
				   
				   
				    <fieldset>
				       <legend>Eléments constitutifs de la demande </legend> <!-- Titre du fieldset --> 
						<p> 
				       <label for="fonction">Type de fonction :<span class="requis">*</span> </label>
				       <input type="text" name="fonction" id="fonction" required/>
				       </p> 
				       <p> 
				       <label for="branche">Branche d'activité :<span class="requis">*</span> </label>
				       <input type="text" name="branche" id="branche" required/>
						</p> 
						
						<p> 
				       <label for="categorie">Catégorie poste :<span class="requis">*</span> </label>
				        <select name="categorie" id="categorie" >
				           <option value="none">Choisissez une option </option>
				           <option value="A">A </option>
				           <option value="B">B </option>
				           <option value="C">C </option>
				       </select>
				       </p> 
				       
				       <p> 
				       <label for="fiche">Fiche de poste :<span class="requis">*</span> </label>
				       <input type="file" name="fiche" id="fiche"  />
				       <input type="submit" name="ajouter" value="Ajouter" />
					  </p> 
						 
						 <p> 
				       <label for="intitule">Intitule de la fonction :<span class="requis">*</span> </label>
				       <input type="text" name="intitule" id="intitule" required/>
				       </p> 
				       
				       <p> 
				       <label for="niveau">Niveau diplôme  :<span class="requis">*</span> </label>
				        <select name="niveau" id="niveau"  required>
				           <option value="none">Choisissez une option </option>
				           <option value="sup">BAC </option>
				           <option value="sup1">BAC + 1</option>
				           <option value="sup2">BAC + 2</option>
				           <option value="sup3">BAC + 3</option>
				           <option value="sup4">BAC + 4</option>
				           <option value="sup5">BAC + 5</option>
				           <option value="sup6">BAC + 6</option>
				           <option value="sup7">BAC + 7</option>
				           <option value="sup8">BAC + 8</option>
				           <option value="sup9">BAC + 9</option>
				       </select>
				       </p> 
				       
				      <p>
				       <label for="argumentaire"> Argumentaires :<span class="requis">*</span> </label>
				       <textarea name="argumentaire" id="argumentaire" rows="6" cols="50" required>
				       Votre argumentaire par rapport à la demande
				       </textarea>       
				       </p>
				
				   </fieldset>
				   
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



	 <%-- Petite fonction jQuery permettant de masquer le bloc "agent a remplacer" en fonction du type de besoin. --%>
        <script>
        	$(document).ready(function(){
        		/* 1 - Au lancement de la page, on cache le bloc d'éléments du formulaire correspondant aux clients existants */
//         		$("div#ancienClient").hide();
        		/* 2 - Au clic sur un des deux boutons radio "choixNouveauClient", on affiche le bloc d'éléments correspondant (nouveau ou ancien client) */
                
        		 $("div#agent").hide();
        		 $("#nature").change(function() {
                	
                    
                    if($("#nature").val() != "3"){
                    	
                    	$("div#agent").show();
                   }
                    else  $("div#agent").hide();
                });
        		 
            });
        </script>


</body>



</html>