<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8" />
        <title>Liste demande classique</title>
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
		
		
			<jsp:include page="form_recherchedemandeclas.jsp"></jsp:include>
			
			<fieldset>
			
			<legend>Liste demandes classiques du système </legend>
		
			<table>
        			<tr>

                    <th>N° Demande</th>

                    <th>Demandeur</th>

                    <th>Composante</th>

                    <th>Date demande</th>

                    <th>Nature demande</th>
                    
                    <th class="statut">Statut</th> 

                    <th class="document">Demande</th>                    

           			</tr>
            
            
            
                <%-- Parcours de la liste des clients en session, et utilisation de l'objet varStatus. --%>
            
           		 <c:forEach items="${listdemandeclas}" var="mapClients" varStatus="boucle">
            	
            
               		 <%-- Simple test de parité sur l'index de parcours, pour alterner la couleur de fond de chaque ligne du tableau. --%>

                	<tr class="${boucle.index % 2 == 0 ? 'pair' : 'impair'}">
                	

			                    <%-- Affichage des propriétés du bean demande, qui est stocké en tant que valeur de l'entrée courante de la list --%>
			
			                    <td><c:out value="${ mapClients.id }"/></td>
			
			                    <td><c:out value="${ mapClients.demandeur.nom }  ${ mapClients.demandeur.prenom }"/></td>
			
			                    <td><c:out value="${ mapClients.demandeur.composante.libelle_composante }"/></td> 
			
			                    <td><c:out value="${ mapClients.datecreationDemande }"/></td>
			
			                    <td><c:out value="${ mapClients.besoinDemande.libelleBesoinDemande }"/></td> 
			                    
			                    
			                    
			                     <td class="statut">
			                     
			                
			                        <img src="<c:url value="/ressources/favicon.jpeg"/>" alt="" /> 
			
			
			                     </td>
			
			                    <%-- Lien vers la servlet de suppression, avec passage du nom du client - c'est-à-dire la clé de la Map - en paramètre grâce à la balise <c:param/>. --%>
			
			                    <td class="document">
			
			                            <a href="<c:url value="/afficherdemandeclass"><c:param name="" value="" /></c:url>">
			
			                            <img src="<c:url value="/ressources/pdf.png"/>" alt="" />
			
			                       		 </a> 
			
			                    </td>
			    

               				 </tr>

            		</c:forEach>
            
			</table>
			
			</fieldset>
		
		</div>
		
	</section>

	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
    </body>

</body>
</html>