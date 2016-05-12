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
		    
		    <label for="statut">Statut demande :</label>
		     <select name="statut" id="statut" required>
		     				<option value="1"> Choisissez une option</option>
				           <option value="1">Envoyées </option>
				           
				           <option value="3">Validées</option>
				           <option value="4">Clôturées</option>
				          
			</select>
		    
		    </p>
		    
		    <p> 
		  
		    <input type="submit" value="Rechercher" name="action">
		    
		    </p>
		    


</fieldset>

</form>