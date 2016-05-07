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
			
			<fieldset>
				
				<legend>Demande recrutement classique </legend>
				
				<div>Demande emise le : <label><c:out value="${demande.datecreationDemande} ${demande.demandeur.prenom} "/> </label></div>
				<div>Demande emise par :<label> <c:out value="${demande.demandeur.nom} ${demande.demandeur.prenom}, ${demande.demandeur.composante.libelle_composante} "/> </label></div>
				
				
			
			
			</fieldset>
		
		
		
		
		
		</div>
	</section>
	
	<footer >
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>

</body>
</html>