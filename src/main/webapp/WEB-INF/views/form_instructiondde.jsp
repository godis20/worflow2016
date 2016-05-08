<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8" />
        <title>Creation demande classique</title>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/style.css"/>" />
       


    </head>

    <body>
    
    <header>
    	<jsp:include page="header.jsp"></jsp:include>
    
    </header>
    
    <section>
    
   	    <div class="menu">
			
			<jsp:include page="menu.jsp"></jsp:include>
		
		</div>
		
		<div class="content">
		
			<form method="post" action="instruiredemande">
			
			<fieldset class="pere">
			<fieldset>
				
				<legend>Demande recrutement classique </legend>
				
				<div>- Demande emise le  <br/>
						<label><c:out value="${demande.datecreationDemande}" /></label></div>
						
				<div>- Informations emmeteur de la demande <br/>
						<label>Composante demandeur :   <c:out value="${demande.demandeur.nom}"/> </label>
						<label>Nom et prenom demandeur: <c:out value="${demande.demandeur.nom} ${demande.demandeur.prenom}, ${demande.demandeur.composante.libelle_composante} "/> </label>		
						<label> Contact demandeur :  <c:out value="${demande.demandeur.email}"/> </label>
				</div>
				
				
				<div>- Informations sur l'objet de la demande <br/>
						<label>Nature de la demande :   <c:out value="${demande.besoinDemande.libelleBesoinDemande}"/> </label>
						<label>Date de debut et de fin de fonctions souhaitée : <c:out value="${demande.dateFinService} ${demande.dateFinSouhaite} "/> </label>		
						<label> Quotité de temps de travail :  <c:out value="${demande.quotite}"/> </label>
				</div>
				
				
				<div id="agentAremplacer">- Informations sur l'Agent à remplacer  <br/>
						<label>Nom et prenom Agent :   <c:out value="${demande.nomAgentAremplacer}"/> </label>
						<label>Date fin de service : <c:out value="${demande.dateDebSouhaite} ${demande.dateFinSouhaite} "/> </label>		
						<label> Motif indisponibilité d l'Agent :  <c:out value="${demande.motif}"/> </label>
				</div>
				
				
				<div>- Eléments constitutifs de la demande <br/>
				
						<label>Type de fonction, Branche d'activité et Catégorie poste:   <c:out value="${demande.foncAgentArecrute demande.branchAgentArecruter  demande.catAgentArecruter}"/> </label>
						<label>Fiche de poste :<%--  <c:out value="${demande.dateDebSouhaite} ${demande.dateFinSouhaite} "/> --%> </label>		
						<label> Intitule de la fonction et Niveau de diplome requis :  <c:out value="${demande.intfoncAgentArecruter  demande.diplomAgentArecruter}"/> </label>
						<label> Argumentaire de la demande:  <c:out value="${demande.argumentaires}"/> </label>
				
				</div>
				
			
			</fieldset>
		
		
			<fieldset>
				
				<legend> Instruction de la demande </legend>
				
				<p>
				<label for="observation"> Observations :<span class="requis">*</span> </label>
				<textarea name="observation" id="observation" rows="6" cols="50" required>
				Vos observations				       
			    </textarea>       
				</p>
			
			
			
			</fieldset>
			
					<input type="reset" value="Annuler" >
				 
				    <input type="submit" value="Instruire" name="action">
			
			
			</fieldset>
			
			</form>
		
		
		</div>
		
	</section>
	
	<footer >
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>

</body>
</html>