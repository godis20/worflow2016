<form action="rechercher" method="post">

<fieldset>

			<legend>Critère de recherche </legend> <!-- Titre du fieldset --> 
			
			<input type="hidden" name="typedemande" value="recherche" />	       
		    <p> 
		    <label for="datedebliste">Du :</label>
		    <input type="date" name="datedebliste" id="datedebliste" />
		    <label for="datefinliste">Au :</label>
		    <input type="date" name="datefinliste" id="datefinliste" />
		  
		    
		    <label for="statut">Statut demande :</label>
		     <select name="statut" id="statut" required>
		     				<option value="0"> Choisissez une option</option>
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