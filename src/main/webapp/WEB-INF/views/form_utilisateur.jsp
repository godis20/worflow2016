<%@ page pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

    <head>

        <meta charset="utf-8" />

        <title>Création d'un utilisateur</title>

        <link type="text/css" rel="stylesheet" href="<c:url value="/inc/style.css"/>" />
       


    </head>

    <body>

        

        <div>

            <form method="post" action="<c:url value="/ajoututilisateur"/>"  onsubmit="return validerform()"  onreset="return confirm('Voulez vous vraiment reinitialiser  ?');">

               <fieldset>

                    <legend>Informations utilisateur</legend>

						<label for="nom">Nom :<span class="requis">*</span></label>
						
						<input type="text" id="nom" name="nom" value="<c:out value=""/>" size="30" maxlength="30" onblur="verifNom(this)"/>
						
						<span id="erreurnom" class="erreur"></span>
						
						<br />
						
						
						<label for="prenom">Prénom : </label>
						
						<input type="text" id="prenom" name="prenom" value="<c:out value=""/>" size="30" maxlength="30" />
						
						<span class="erreur"></span>
						
						<br />
						
						<label for="email">Adresse email :</label><span class="requis">*</span></label>
						
						<input type="email" id="email" name="email" value="<c:out value=""/>" size="30" maxlength="60"  onblur="verifMail(this)" />
						
						<span class="erreuremail"></span><br />
						
						
						
						<label for="password">Mot de passe : <span class="requis">*</span></label>
						
						<input type="password" id="password" name="password" value="<c:out value=""/>" size="30" maxlength="60" onblur="verifPassword(this)"/>
						
						<span class="erreur"></span>
						
						<br />
						
						<label for="password1">Confirmer Mot de passe : <span class="requis">*</span></label>
						
						<input type="password" id="password1" name="password1" value="<c:out value=""/>" size="30" maxlength="60" onblur="verifPassword1(this)"/>
						
						<span class="erreur"></span>
						
						<br />
						
						
						<label for="poste">Poste : <span class="requis">*</span></label>
						
						<input type="text" id="poste" name="poste" value="<c:out value="" />" size="30" maxlength="30" onblur="verifPoste(this)"/>
						
						<span class="erreur"></span>
						
						<br />
						
						<label for="poste">Composante : <span class="requis">*</span></label>
						
						<select id = "id_composante" name = "id_composante">
						   <c:forEach items = "${composantes}" var = "composante">
						        <option value="${composante.id}" > <c:out value="${composante.libelle_composante}"></c:out> </option>
						   </c:forEach>
						</select>
						
						<span class="erreur"></span>
						
						<br />
                      

                </fieldset>

                <p class="info">${ erreur }</p>

                <input type="submit" value="Valider"  />

                <input type="reset" value="Remettre à zéro" /> <br />

            </form>
   
        </div>

    </body>
    
              
        <script type="text/javascript">
        
		        function surligne(champ, erreur)
		        {
		           if(erreur){
		              champ.style.backgroundColor = "#fba";
		              
		        }
		           else
		              champ.style.backgroundColor = "";
		        }
		        
		        function verifNom(champ)
		        {
		           if(champ.value.length < 2 )
		           {
		              surligne(champ, true);
		              
		              return false;
		           }
		           else
		           {
		              surligne(champ, false);
		              return true;
		           }
		        }
        
		        function verifMail(champ)
		        {
		           var regex = /^[a-zA-Z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$/;
		           if(!regex.test(champ.value))
		           {
		              surligne(champ, true);
		              return false;
		           }
		           else
		           {
		              surligne(champ, false);
		              return true;
		           }
		        }
		        
		        
				function verifPassword(champ){
					
				
					    var error = "";
					    var illegalChars = /[\W_]/; // allow only letters and numbers
					 
					    if (champ.value == "") {
					        
					        error = "Vous n'avez pas entré un mot de passe";
					        alert(error);
					        return false;
					 
					    } else if ((champ.value.length < 6) || (champ.value.length > 15)) {
					        error = "La taille du mot de passe doit etre compris entre 6 et 15 \n";
					        alert(error);
					        return false;
					 
					    } else if (illegalChars.test(fld.value)) {
					        error = "The password contains illegal characters.\n";
					        
					        alert(error);
					        return false;
					 
					    } else if ( (fld.value.search(/[a-zA-Z]+/)==-1) || (fld.value.search(/[0-9]+/)==-1) ) {
					        error = "Le mot de passe doit contrnir uniquement des lettres et des chiffres\n";
					    
					        alert(error);
					        return false;
					 
					    } else {
					    	champ.style.background = 'White';
					    }
					   return true;
				}
		        
		     
		        
		        function verifPassword1(champ){	
		        	if(champ!=document.getElementById("password").value){
		        		
		        		surligne(champ, true);
			            return false;
			            
		        	}else{
		        		 surligne(champ, false);
			             return true;
		        	}
		        	
		        }
		        
		        function verifPoste(champ)
		        {
		           if(champ.value.length < 10 )
		           {
		              surligne(champ, true);
		              
		              return false;
		           }
		           else
		           {
		              surligne(champ, false);
		              return true;
		           }
		        }

		        
				function validerform(){
				
					   var pseudoOk = verifNom(formu.nom);
					   var mailOk = verifMail(formu.email);
					   var passOk = verifPassword(formu.age);
					   var passOk1 = verifPassword1(formu.nom);
					   var posteOk = verifPoste(formu.email);
					   

					if(pseudoOk && mailOk && passOk && passOk1 && posteOk)
                    {
						
                    	document.getElementById("erreurnom").innerHTML = "le champ Nom n'est pas renseigne";
                       	return true;
                    } else
                    {
                        alert("Veuillez remplir correctement tous les champs");
                        return false;
                     }
                    
     
				}


        </script>

</html>