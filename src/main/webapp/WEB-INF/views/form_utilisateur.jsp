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

            <form method="post" action="<c:url value="/ajoututilisateur"/>"  >

               <fieldset>

                    <legend>Informations utilisateur</legend>

						<label for="nom">Nom *:<span class="requis">*</span></label>
						
						<input type="text" id="nom" name="nom" value="<c:out value=""/>" size="30" maxlength="30" />
						
						<span class="erreur"></span>
						
						<br />
						
						
						<label for="prenom">Prénom *: </label>
						
						<input type="text" id="prenom" name="prenom" value="<c:out value=""/>" size="30" maxlength="30" />
						
						<span class="erreur"></span>
						
						<br />
						
						<label for="email">Adresse email</label>
						
						<input type="email" id="email" name="email" value="<c:out value=""/>" size="30" maxlength="60" />
						
						<span class="erreur"></span>
						
						
						
						<label for="password">Mot de passe *: <span class="requis">*</span></label>
						
						<input type="password" id="password" name="password" value="<c:out value=""/>" size="30" maxlength="60" />
						
						<span class="erreur"></span>
						
						<br />
						
						
						<label for="poste">Poste *: <span class="requis">*</span></label>
						
						<input type="text" id="poste" name="poste" value="<c:out value="" /> size="30" maxlength="30" />
						
						<span class="erreur"></span>
						
						<br />
						
						<label for="poste">Composante *: <span class="requis">*</span></label>
						
						<select id = "id_composante">
						   <c:forEach items = "${composantes}" var = composante>
						        <option value="${composante.id}" > <c:out value="${composante.libelle_composante}"></c:out> </option>
						   </c:forEach>
						</select>
						
						<span class="erreur"></span>
						
						<br />
                      

                </fieldset>

                <p class="info">${ form.resultat }</p>

                <input type="submit" onclick="validerform()" value="Valider"  />

                <input type="reset" value="Remettre à zéro" /> <br />

            </form>
   
        </div>

    </body>
    
          
        <script type="text/javascript">
    

				function validerform(){

					var nom=document.getElementById("nom").value();
					var prenom=document.getElementById("prenom").value();
					var email=document.getElementById("email").value();
					var password=document.getElementById("password").value();
					var poste=document.getElementById("poste").value();
					var composante=document.getElementById("id_composante").value();



     


				}


        </script>

</html>