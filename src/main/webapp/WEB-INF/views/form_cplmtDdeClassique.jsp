<fieldset>
       <legend>Agent à remplacer  </legend> <!-- Titre du fieldset --> 
 
       
       <p> 
       <label for="nom">Nom : <span class="requis">*</span> </label>
       <input type="text" name="nom" id="nom" value="<c:out value=""/>" size="30" maxlength="30" onblur="verifNom(this)"/>
       <span id="erreurnom" class="erreur"></span>
		</p>
		
		<p> 
       <label for="prenom">Prénom :</label>
       <input type="text" name="prenom" id="prenom" />
       </p> 
       
       <p> 
       <label for="dateagt">Date fin de service* :</label>
       <input type="date" name="dateagt" id="dateagt" rvalue="<c:out value=""/>" size="30" maxlength="30" onblur="verifDateFin(this)"/>
 		</p> 
 		
 		<p> 
       <label for="motif">Motif disponibilité poste * :</label>
       
        <textarea name="motif" id="motif" rows="2" cols="40" value="<c:out value=""/>" size="30" maxlength="30" onblur="verifMotif(this)">
          Ex: décéde, congé maternité...
       </textarea> 
       </p> 

   </fieldset>
   

