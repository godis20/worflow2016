<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
        <title>Page de connexion principale</title>
<!--         <link type="text/css" rel="stylesheet" href="inc/style.css" /> -->

</head>

<body>


      
       <h1>BIENVENUE SUR NOTRE WORK FLOW DE "GESTION DEMANDE RECRUTEMENT"</h1>
       <form action="connexionutilisateur" method="post">
      
        <fieldset class="connexion" align="center">
       
       <legend> Identifiez-vous </legend> <!-- Titre du fieldset --> 
       
	   <p> 
       <label for="login">Identifiant / Login * :</label><br/>
       <input type="text" name="login" id="login" value="<c:out value="${connexionutilisateur.login}"/>" size="30" maxlength="60" required/>
       
       </p>
       
       <p> 
       <label for="pass">Mot de passe* :</label><br/>
       <input type="password" name="password" id="password" />
       
		</p> <br/>
		
		<c:out value="${error}"></c:out>
		 <p>
		 <input type="submit" value="Se connecter" >
		 </p>
		
		
		 </fieldset>
		 
		
	  </form>
  
 
 
  

</body>

<footer>
	

</footer>
</html>