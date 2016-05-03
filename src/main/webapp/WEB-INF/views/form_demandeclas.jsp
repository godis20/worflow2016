<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8" />
        <title>Page de connexion principale</title>
<!--         <link type="text/css" rel="stylesheet" href="inc/style.css" /> -->

</head>

<body>

<form method="post" action="ajoutdemandeclas">
<fieldset class="pere">
 
   <fieldset>
       <legend>Emetteur de la demande </legend> <!-- Titre du fieldset --> 
       
	   <p> 
       <label for="composante">Composante demandeuse :</label>
       <input type="text" name="composante" id="composante" value="<c:out value="${user. }"/>" size="30" maxlength="30"/>
       </p>
       
       <p> 
       <label for="nom">Nom demandeur :</label>
       <input type="text" name="nom" id="nom" required/>
		</p>
		
		<p> 
       <label for="prenom">Prenom demandeur :</label>
       <input type="text" name="prenom" id="prenom" required/>
       </p> 
       
       <p> 
       <label for="telephone">Téléphone :</label>
       <input type="text" name="telephone" id="telephone" required/>
 		</p> 
 		
 		<p> 
       <label for="email">Adresse email * :</label>
       <input type="email" name="email" id="email" required/>
       </p> 

   </fieldset>
   
 
   <fieldset>
       <legend>Détermination du besoin</legend> <!-- Titre du fieldset -->
       <p> 
       <label for="nature">Nature de la demande</label>
       <select name="nature" id="nature" required autofocus>
       	   <option value="none">Choisissez une option </option>
           <option value="vacant">Emploi vacant</option>
           <option value="temporaire">Emploi temporaire</option>
           <option value="renforcement">Emploi pour renforcement</option>
           <option value="autres">Autres</option>
        </select> 
        </p> 
        
        <p>
        <label for="precisions">Si "Autres", veuillez préciser :</label>
        <textarea name="precisions" id="precisions" cols="40" rows="1"></textarea>
      	</p>
          
     
       <p> 
       <label for="dateDeb">Date de prise de fonctions souhaitée* : </label>
       <input type="date" name="dateDeb" id="dateDeb" required>
       </p>
        
       <p> 
       <label for="dateFin">Date de fin de fonctions souhaitée* : </label>
       <input type="date" name="dateFin" id="dateFin" required>
       </p> 
       
		<p> 
       <label for="quotite">Quotité de temps de travail* : </label>
        <select name="nature" id="nature" required>
           <option value="none">Choisissez une option </option>
           <option value="100">100 %</option>
           <option value="75">75 %</option>
           <option value="50">50 %</option>
           <option value="25">25 %</option>
          
       </select>
       </p> 
   </fieldset>
   
   
    <fieldset>
       <legend>Eléments constitutifs de la demande </legend> <!-- Titre du fieldset --> 
		<p> 
       <label for="fonction">Type de fonction * </label>
       <input type="text" name="fonction" id="fonction" required/>
       </p> 
       <p> 
       <label for="branche">Branche d'activité * </label>
       <input type="text" name="branche" id="branche" required/>
		</p> 
		
		<p> 
       <label for="categorie">Catégorie poste </label>
        <select name="categorie" id="categorie" >
           <option value="none">Choisissez une option </option>
           <option value="A">A </option>
           <option value="B">B </option>
           <option value="C">C </option>
       </select>
       </p> 
       
       <p> 
       <label for="fiche">Fiche de poste * </label>
       <input type="file" name="fiche" id="fiche" required />
       <input type="submit" name="ajouter" value="Ajouter" />
	  </p> 
		 
		 <p> 
       <label for="intitule">Intitule de la fonction *</label>
       <input type="text" name="intitule" id="intitule" required/>
       </p> 
       
       <p> 
       <label for="niveau">Niveau diplôme  *</label>
        <select name="niveau" id="niveau"  required>
           <option value="none">Choisissez une option </option>
           <option value="sup">BAC </option>
           <option value="sup1">BAC + 1</option>
           <option value="sup2">BAC + 2</option>
           <option value="sup3">BAC + 3</option>
           <option value="sup4">BAC + 4</option>
           <option value="sup5">BAC + 5</option>
           <option value="sup6">BAC + 6</option>
           <option value="sup7">BAC + 7</option>
           <option value="sup8">BAC + 8</option>
           <option value="sup9">BAC + 9</option>
       </select>
       </p> 
       
      <p>
       <label for="argumentaire"> Argumentaires* : </label> 
       <textarea name="argumentaire" id="argumentaire" rows="6" cols="50" required>
       Votre argumentaire par rapport à la demande
       </textarea>       
       </p>

   </fieldset>
   
   <input type="reset" value="Annuler" >
   <input type="button" value="Enregistrer" >
   <input type="submit" value="Envoyer" >
   
   
  </fieldset> 
   
   
</form>

</body>



</html>