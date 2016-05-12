<form action="rechercher" method="post">

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
		    
		    <label for="statut">Rôle utilisateur :</label>
		     <select name="statut" id="statut" required>
		     				<option value="1"> Choisissez une option</option>
				           <option value="1">Emetteur demande </option>
				           <option value="2">Instructeur demande</option>
				           <option value="3">Validateur demande</option>
				           <option value="4">Clôture demande</option>
				          
			</select>
		    
		    </p>
		    
		    <p> 
		  
		    <input type="submit" value="Rechercher" name="action">
		    
		    </p>
		    


</fieldset>

</form>