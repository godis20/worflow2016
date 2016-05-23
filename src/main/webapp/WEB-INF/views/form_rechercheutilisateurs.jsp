<%@ page pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<form action="rechercheutilisateur" method="post">

<fieldset>

			<legend>Critère de recherche </legend> <!-- Titre du fieldset --> 
			
				       
		    <p> 
		    <label for="datedebliste">Du :</label>
		    <input type="date" name="datedebliste" id="datedebliste" />
		    <label for="datefinliste">Au :</label>
		    <input type="date" name="datefinliste" id="datefinliste" />
		    </p>
		    
		    <p> 
		    <label for="composante">Composante :</label>
		    <input type="text" name="composante" id="composante" />
		    
		    <label for="role">Rôle utilisateur :</label>
		     <select name="role" id="role" >
		     
		     	<option value="" > Choisissez un rôle </option>
				 <c:forEach items = "${privilege}" var = "privilege">
						   <option value="${privilege.id}" > <c:out value="${privilege.libellePrivilege}"></c:out> </option>
				 </c:forEach>
		     								          
			</select>
		    
		    </p>
		    
		    <p> 
		  
		    <input type="submit" value="Rechercher" name="action">
		    
		    </p>
		    


</fieldset>

</form>