<%@ page pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
	

    <head>

        <meta charset="utf-8" />

        <title>Création d'un utilisateur</title>

        <link type="text/css" rel="stylesheet" href="<c:url value="/resources/style.css"/>" />
       


    </head>

    <body>
    <header class="header">
    	<jsp:include page="header.jsp"></jsp:include>
    
    </header>
    <section >
		
		<div class="menu">
			
			<jsp:include page="menu.jsp"></jsp:include>
		
		</div>
        

        <div class="content">

            <form method="post" action="<c:url value="/ajoututilisateur"/>"  onsubmit="return validerform()"  onreset="return confirm('Voulez vous vraiment reinitialiser  ?');">

               <fieldset>

                    <legend>Informations utilisateur</legend>
						
						<p>
						<label for="nom">Nom :<span class="requis">*</span></label>
						
						<input type="text" id="nom" name="nom" value="<c:out value=""/>" size="30" maxlength="30" onblur="verifNom(this)" />
						
						<span id="erreurnom" class="erreurnom"></span>
						
						</p>
						
						<p>
						<label for="prenom">Prénom : </label>
						
						<input type="text" id="prenom" name="prenom" value="<c:out value=""/>" size="30" maxlength="30" />
						</p>
						
						<p>
						<label for="email">Adresse email :</label><span class="requis">*</span></label>
						
						<input type="email" id="email" name="email" value="" size="30" maxlength="60"  onblur="verifMail(this)" />
						
						<span id="erreuremail"></span>
						</p>
						
						<p>
						<label for="password">Mot de passe : <span class="requis">*</span></label>
						
						<input type="password" id="password" name="password" value="" size="30" maxlength="60" onblur="verifPassword(this)"/>
						
						<span id="erreurpass"></span>
						
						</p>
						
						<p>
						<label for="password1">Confirmer Mot de passe : <span class="requis">*</span></label>
						
						<input type="password" id="password1" name="password1" value="" size="30" maxlength="60" onblur="verifPassword1(this)"/>
						
						<span id="erreurpass1"></span>
						
						</p>
						
						<p>
						<label for="poste">Poste : <span class="requis">*</span></label>
						
						<input type="text" id="poste" name="poste" value="" size="30" maxlength="30" onblur="verifPoste(this)"/>
						
						<span id="erreurposte"></span>
						
						</p>
						
						<p>
						<label for="poste">Composante : <span class="requis">*</span></label>
						
						<select id = "id_composante" name = "id_composante"   onblur="verifCompo(this)">
						
						   <option value="" > Choisissez une composante </option>
						   <c:forEach items = "${composantes}" var = "composante">
						        <option value="${composante.id}" > <c:out value="${composante.libelle_composante}"></c:out> </option>
						   </c:forEach>
						</select>
						
						<span id="erreurcompo"></span>
						
						</p>
						
						<span> <c:out value="${error}"/></span>
                      

                </fieldset>

                
                <span id="formulaire"></span>
                
				
                <input type="submit" value="Valider"  />

                <input type="reset" value="Remettre à zéro" /> <br />

            </form>
   
        </div>

	</section>
	
	
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
    </body>
    
        <script src="//code.jquery.com/jquery-2.0.3.min.js"></script>
   
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
		              document.getElementById('erreurnom').innerHTML = 'le nom doit tenir au moins sur deux positions';
		              
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
		              document.getElementById('erreurmail').innerHTML = 'le mail est mal ecrit. Ex: toto@yahoo.fr';
		              return false;
		           }else if (champ.value==""){
		        	   
		        	    surligne(champ, true);
			            document.getElementById('erreurmail').innerHTML = 'le champ mail est vide';
		           }
		           else
		           {
		              surligne(champ, false);
		              return true;
		           }
		        }
		        
		        
				function verifPassword(champ){
					
				
					    var illegalChars = /[\W_]/; // allow only letters and numbers
					 
					    if (champ.value == "") {
					    	
					    	surligne(champ, true);
					        document.getElementById('erreurpass').innerHTML = "Vous n'avez pas entré un mot de passe";
					        return false;
					 
					    } else if ((champ.value.length < 6) || (champ.value.length > 15)) {
					    	surligne(champ, true);
					        document.getElementById('erreurpass').innerHTML = "La taille du mot de passe doit etre compris entre 6 et 15 ";
					       
					        return false;
					 
					    } else if (illegalChars.test(fld.value)) {
					        
					        surligne(champ, true);
					        document.getElementById('erreurpass').innerHTML = "La mot de passe contient des caracteres non acceptés ";
					        return false;
					 
					    } else if ( (fld.value.search(/[a-zA-Z]+/)==-1) || (fld.value.search(/[0-9]+/)==-1) ) {
					    	
					    	surligne(champ, true);
					        document.getElementById('erreurpass').innerHTML = "Le mot de passe doit contenir uniquement des lettres et des chiffres ";
					       
					        return false;
					 
					    } else {
					    	surligne(champ, true);
					    	 return true;
					    }
					  
				}
		        
		     
		        
		        function verifPassword1(champ){	
		        	if(champ!=document.getElementById("password").value){
		        		
		        		surligne(champ, true);
		        		document.getElementById('erreurpass1').innerHTML = "Veuillez entrer un mot de passe identique au precedent ";
			            return false;
		        	}
			        else if(champ.value==""){
			        	
			        	surligne(champ, true);
		        		document.getElementById('erreurpass1').innerHTML = "Vous n'avez pas confirmé le mot de passe ";
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
		              document.getElementById('erreurposte').innerHTML = "Veuillez renseigner le champ ";
		              return false;
		           }
		           else
		           {
		              surligne(champ, false);
		              return true;
		           }
		        }
		        
		        function verifCompo(champ)
		        {
		           if(champ.value=="" )
		           {
		              surligne(champ, true);
		              document.getElementById('erreurposte').innerHTML = "Veuillez selectionnez une composante ";
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
					   var compoOk = verifCompo(formu.id_composante);

					if(pseudoOk && mailOk && passOk && passOk1 && posteOk && compoOk)
                    {
						
                       	return true;
                    } else
                    {
                    	document.getElementById('formulaire').innerHTML = "le formulaire est mal rempli ";
                        return false;
                     }
                    
     
				}


        </script>

</html>