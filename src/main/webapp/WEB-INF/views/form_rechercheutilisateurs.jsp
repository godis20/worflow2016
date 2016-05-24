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
				<option value="1" > Demandeur classique </option>
				<option value="2" > Instructeur classique </option>
				<option value="3" > Validateur classique </option>
				<option value="4" > Gestionnaire classique </option>
				<option value="5" > Demandeur recherche </option>
				<option value="6" > Validateur recherche </option>
				<option value="7" > Clôture recherche </option>
										          
			 </select>
		  	
		    
		    <input type="checkbox" name="admin" id="admin" value="5"><label> Admin ? </label>
		    
		    </p>
		    
		
		  
		    <input type="submit" value="Rechercher" name="action">
		    
		    </p>
		    


</fieldset>

</form>