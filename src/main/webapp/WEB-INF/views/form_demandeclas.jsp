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
    
    <header >
    	<jsp:include page="header.jsp"></jsp:include>
    
    </header>
    
    <section>
    
   	    <div class="menu">
			
			<jsp:include page="menu.jsp"></jsp:include>
		
		</div>
		
		<div class="content">

				<form method="post" name="myForm" action="ajoutdemandeclas"   
				
					  onreset="return confirm('Voulez vous vraiment reinitialiser  ?');">
					  
					  
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
				           <option value="2">Emploi temporaire</option>
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
				        <select name="quotite" id="quotite" >
				           <option value="0">Choisissez une option </option>
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
							       <input type="text" name="nomagt" id="nomagt"  size="30" maxlength="30" />
							       <span id="errornomagt" class="error">  <c:out value="${errornomagt}"/></span>
									</p>
									
									<p> 
							       <label for="prenomagt">Prénom : <span class="requis">*</span> </label>
							       <input type="text" name="prenomagt" id="prenomagt" />
							       <span id="errorprenomagt" class="error">  <c:out value="${errorprenomagt}"/></span>
							       </p> 
							       
							       <p> 
							       <label for="dateagt">Date fin de service :<span class="requis">*</span> </label>
							       <input type="date" name="dateagt" id="dateagt" size="30" maxlength="30" />
							       <span id="errordateagt" class="error">  <c:out value="${errordateagt}"/></span>
							 		</p> 
							 		
							 		<p> 
							       <label for="motif">Motif disponibilité poste  :<span class="requis">*</span> </label>
							       
							        <textarea name="motif" id="motif" rows="2" cols="40"  placeholder="Ex: congé de maternité, arrêt maladie..."></textarea>
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
				       <input type="text" name="branche" id="branche" required/>
						</p> 
						
						<p> 
				       <label for="categorie">Catégorie poste :<span class="requis">*</span> </label>
				        <select name="categorie" id="categorie"  autofocus>
				           <option value="0">Choisissez une option </option>
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
				       <input type="text" name="intitule" id="intitule" />
				       <span id="errorintitule" class="error">  <c:out value="${errorintitule}"/></span>
				       </p> 
				       
				       <p> 
				       <label for="niveau">Niveau diplôme  :<span class="requis">*</span> </label>
				        <select name="niveau" id="niveau"  >
				           <option value="0">Choisissez une option </option>
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
				       <span id="errorniveau" class="error">  <c:out value="${errorniveau}"/></span>
				       </p> 
				       
				     	<p>
				       <label for="argumentaire"> Argumentaires :<span class="requis">*</span> </label>
				       
				       <textarea name="argumentaire" id="argumentaire" cols="50" placeholder="Votre argumentaire!!!"></textarea>  
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
				   
				   <input type="reset" value="Annuler" >
				   
				   <input type="submit" value="Enregistrer" id="action" name="action" >
				   <input type="submit" value="Envoyer" id="action" name="action" onClick=" return verifForm()">
				   
				   
				  </fieldset> 
				   
				   
				</form>
			</div>
		
		 </section>
     
     	<footer >
		<jsp:include page="footer.jsp"></jsp:include>
		</footer>



	 <%-- Petite fonction jQuery permettant de masquer le bloc "agent a remplacer" en fonction du type de besoin. --%>
	 
	 
	 	<script src="/js/jquery.min.js"></script>
       
        
	   <script src="//code.jquery.com/jquery-2.0.3.min.js"></script>
   
        <script type="text/javascript">
	 
	 
        	$(document).ready(function(){
        		/* 1 - Au lancement de la page, on cache le bloc d'éléments du formulaire correspondant aux clients existants */

        		/* 2 - Au clic sur un des deux boutons radio "choixNouveauClient", on affiche le bloc d'éléments correspondant (nouveau ou ancien client) */
                	
        		 $("div#agent").hide();
        		 $("#nature").change(function() {
                	
                    
                    if(($("#nature").val()) != "3" && ($("#nature").val()!="")){
                    	
                    	$("div#agent").show("fast");
                   }
                    else  $("div#agent").hide();
                });
        		 
            });
        	
        	
        	
        	
        	function surligne(champ, erreur)
        	
        	{
        	   if(erreur){
        		
        	      champ.style.borderColor = "#c42622";
        	   	  champ.style.fontWeight= "bold";
        	   }
        	
        	}
        	
        
        	
        	function verifForm(){

        				document.getElementById('nature').validationMessage;
    					
    					var nature = document.getElementById('nature').value;
    					
    					var nomagt = document.getElementById('nomagt').value;
        				var prenomagt = document.getElementById('prenomagt').value;			
        				var dateagt = document.getElementById('dateagt').value;
        				var motif = document.getElementById('motif').value;
        				var quotite = document.getElementById('quotite').value;
        				
        				var categorie = document.getElementById('categorie').value;
        				var intitule = document.getElementById('intitule').value;
        				var niveau = document.getElementById('niveau').value;
        				var argumentaire = document.getElementById('argumentaire').value;
            			
            			if(nature!=3 && nature!=""){
            				
            				
            				
            				if(nomagt=="" || nomagt.trim().length <3){
            					
            					surligne(document.getElementById('nomagt'),true);
            					document.getElementById('errornomagt').innerHTML = "Le nom doit tenir au moins 3 positions!!";
            					return false;
            				} 
            				
    						if(prenomagt=="" || prenomagt.trim().length<3){
    							
    							surligne(document.getElementById('prenomagt'),true);
            					document.getElementById('errorprenomagt').innerHTML = "Le prenom doit tenir au moins 3 positions!!";
            					return false;
            				}
    						
							if(dateagt=="" || dateagt==null){
    							
    							surligne(document.getElementById('dateagt'),true);
            					document.getElementById('errordateagt').innerHTML = "La date doit être renseigné!!";
            					return false;
            				}
							
							if(motif=="" || motif.trim().length < 6){
    							
    							surligne(document.getElementById('motif'),true);
            					document.getElementById('errormotif').innerHTML = "Le motif doit tenir au moins sur 6 positions!";
            					return false;
            				}
            				
            			}
            			
            			
						if(quotite ==0){
            				
            				surligne(document.getElementById('quotite'),true);
            				document.getElementById('errorquotite').innerHTML = "Veuillez choisir une option!!";
        					return false;
            				
            			}
            			
            			
						if(categorie ==0){
            				
            				surligne(document.getElementById('categorie'),true);
            				document.getElementById('errorcategorie').innerHTML = "Veuillez choisir une option!!";
        					return false;
            				
            			}
            			
            			if(intitule.trim().length < 6){
            				
            				surligne(document.getElementById('intitule'),true);
            				document.getElementById('errorintitule').innerHTML = "Intitulé doit tenir au moins sur 6 positions!!";
        					return false;
            				
            			}
            			
            			
						if(niveau ==0){
            				
            				surligne(document.getElementById('niveau'),true);
            				document.getElementById('errorniveau').innerHTML = "Veuillez choisir une option!!";
        					return false;
            				
            			}
    					
						
						if(argumentaire.trim().length < 3){
            				
            				surligne(document.getElementById('argumentaire'),true);
            				document.getElementById('errorargumentaire').innerHTML = "Argumentaire tient au moins sur 3 positions!!";
        					return false;
            				
            			}
    					
						
    					return true;
     
        			
        			
        	}	
        		
     	
        	
        	function envoyerform(){  
        		
        	    if (confirm ('Voulez vous vraiment soumettre cette demande pour instruction ? ')){
        	      document.forms["myForm"].submit();
        	    }
        	  }
        	
        
	</script>

</body>



</html>