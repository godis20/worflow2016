<form action="rechercher" method="post">

<fieldset>

			<legend>Crit�re de recherche </legend> <!-- Titre du fieldset --> 
			
			
			<input type="hidden" name="typedemande" value="classique" />
				       
		    <p> 
		    <label for="datedebliste">Du :</label>
		    <input type="date" name="datedebliste" id="datedebliste" />
		    <label for="datefinliste">Au :</label>
		    <input type="date" name="datefinliste" id="datefinliste" />
		    
		   
		    <label for="statut">Statut demande :</label>
		     <select name="statut" id="statut" >
		     				<option value="0"> Choisissez une option</option>
				           <option value="1">Envoy�es </option>
				           <option value="2">Instruites</option>
				           <option value="3">Valid�es</option>
				           <option value="4">Cl�tur�es</option>
				          
			</select>
		    
		    </p>
		    
		    <p> 
		  
		    <input type="submit" value="Rechercher" name="action">
		    
		    </p>
		    


</fieldset>

</form>