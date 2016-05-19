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

				<form method="post" name="myForm" action="ajoutdemandeclas"   onsubmit="return validerform(this.myForm)"
				
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
				       <select name="nature" id="nature"  required autofocus>
				       	   <option value="">Choisissez une option </option>
				           <option value="1">Emploi vacant</option>
				           <option value="2">Emploi temporaire</option>
				           <option value="3">Emploi pour renforcement</option>
				           
				        </select>  
				        <span id="errornature" class="error"><c:out value="${errornature}"/></span>
				       
				     
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
				           <option value="none">Choisissez une option </option>
				           <option value="100%">100 %</option>
				           <option value="75%">75 %</option>
				           <option value="50%">50 %</option>
				           <option value="25%">25 %</option>
				          
				       </select>
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
							 		</p> 
							 		
							 		<p> 
							       <label for="motif">Motif disponibilité poste  :<span class="requis">*</span> </label>
							       
							        <textarea name="motif" id="motif" rows="2" cols="40" size="30" maxlength="30">Ex: décéde, congé maternité...
							       </textarea> 
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
				        <select name="categorie" id="categorie" required autofocus>
				           <option value="">Choisissez une option </option>
				           <option value="A">A </option>
				           <option value="B">B </option>
				           <option value="C">C </option>
				       </select>
				       </p> 
				       
				      
				       
				       <p> 
				       
				       
				       <label for="ficheposte">Fiche de poste :<span class="requis">*</span> </label>
				       <input type="file" name="ficheposte" id="ficheposte"  />
				       <input type="submit" value="Ajouter" name="action">
				      
					  </p> 
					 
						 
						 <p> 
				       <label for="intitule">Intitule de la fonction :<span class="requis">*</span> </label>
				       <input type="text" name="intitule" id="intitule" />
				       </p> 
				       
				       <p> 
				       <label for="niveau">Niveau diplôme  :<span class="requis">*</span> </label>
				        <select name="niveau" id="niveau"  required autofocus>
				           <option value="">Choisissez une option </option>
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
				       </p> 
				       
				      <p>
				       <label for="argumentaire"> Argumentaires :<span class="requis">*</span> </label>
				       <textarea name="argumentaire" id="argumentaire" rows="6" cols="50" >Votre argumentaire par rapport à la demande
				       </textarea>       
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
				   <input type="submit" value="Enregistrer" id="action" name="action">
				   <input type="submit" value="Envoyer" id="action" name="action"    >
				   
				   
				  </fieldset> 
				   
				   
				</form>
			</div>
		
		 </section>
     
     	<footer >
		<jsp:include page="footer.jsp"></jsp:include>
		</footer>



	 <%-- Petite fonction jQuery permettant de masquer le bloc "agent a remplacer" en fonction du type de besoin. --%>
	 
	    <script src="//code.jquery.com/jquery-2.0.3.min.js"></script>
   
        <script type="text/javascript">
	 
	 
        	$(document).ready(function(){
        		/* 1 - Au lancement de la page, on cache le bloc d'éléments du formulaire correspondant aux clients existants */
//         		$("div#ancienClient").hide();
        		/* 2 - Au clic sur un des deux boutons radio "choixNouveauClient", on affiche le bloc d'éléments correspondant (nouveau ou ancien client) */
                
        		 $("div#agent").hide();
        		 $("#nature").change(function() {
                	
                    
                    if(($("#nature").val()) != "3" && ($("#nature").val()!="")){
                    	
                    	$("div#agent").show();
                   }
                    else  $("div#agent").hide();
                });
        		 
            });
        	
        	
        	
        	
        	
        	
        	function validerform(formulaire){
        		
  	
        		
        			
        			var nature = formulaire.nature.value;
        			var action = formulaire.action.value;
         			var quotite= formulaire.quotite.value;
         			var nomagt= formulaire.nomagt.value;
         			var prenomagt= formulaire.prenomagt.value;
         			var dateagt= formulaire.dateagt.value;
         			var motif= formulaire.motif.value; 
        			
        			
        	
        			if(action.equals("Envoyer")){
        				
        			
        			
        			if ( nature!='3'){
        				
        					
        					
        					if(nomagt.length <2){
        						
        						document.getElementById('errornomagt').innerHTML = "Le nom doit tenir au moins sur 02 positions!!! ";
        						
        						return false;
        					}
        					
        					else if(prenomagt.length<2){
        						document.getElementById('errorprenomagt').innerHTML = "Le prénom doit tenir au moins sur 02 positions!!! ";
        						
        						return false;
        					} 
        			
        			}	//|| prenomagt.length==0 || dateagt.length < 10 ||motif.length < 10){
        			
        			
        				
        				return true;
        			
        			
        			
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