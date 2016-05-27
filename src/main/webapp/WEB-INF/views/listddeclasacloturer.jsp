<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8" />
        <title>Liste demande classique à clôturer</title>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/style.css"/>" />
    <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
  	 <script src="<c:url value="resources/javascript/hautdepage.js"/>" > </script>    

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
			
			<legend>Demandes en attente de cloture</legend>
		
			<table>
        			<tr>

                    <th>N° Demande</th>

                    <th>Demandeur</th>

                    <th>Composante</th>

                    <th>Date demande</th>

                    <th>Nature demande</th>
                    
                    <th class="statut">Clôture</th> 

                    <th class="document">Demande</th>                    

           			</tr>
            
            
            
                <%-- Parcours de la liste des clients en session, et utilisation de l'objet varStatus. --%>
            
           		 <c:forEach items="${listddeclasacloturer}" var="mapDde" varStatus="boucle">
            	
            
               		 <%-- Simple test de parité sur l'index de parcours, pour alterner la couleur de fond de chaque ligne du tableau. --%>

                	<tr class="${boucle.index % 2 == 0 ? 'pair' : 'impair'}">
                	

			                    <%-- Affichage des propriétés du bean demande, qui est stocké en tant que valeur de l'entrée courante de la list --%>
			
			                    <td><c:out value="${ mapDde.id }"/></td>
			
			                    <td><c:out value="${ mapDde.demandeur.nom }  ${ mapDde.demandeur.prenom }"/></td>
			
			                    <td><c:out value="${ mapDde.demandeur.composante.libelle_composante }"/></td> 
			
			                    <td><c:out value="${ mapDde.datecreationDemande }"/></td>
			
			                    <td><c:out value="${ mapDde.besoinDemande.libelleBesoinDemande }"/></td> 
			                    
			                    
			                    
			                     <td class="statut" align="center">
			                     
			                		<a href="<c:url value="/cloturedemandeclas"><c:param name="idDde" value="${mapDde.id }" /></c:url>">
			                        <img src="<c:url value="/resources/modifier.jpg"/>" alt="Clôturer" /> 
			                        </a>
			
			
			                     </td>
			
			                    <%-- Lien vers la servlet de suppression, avec passage du nom du client - c'est-à-dire la clé de la Map - en paramètre grâce à la balise <c:param/>. --%>
			
			                    <td class="document" align="center">
			
			                            <a href="<c:url value="/afficherdemandeclas"><c:param name="idDde" value="${mapDde.id }" /></c:url>">
			
			                            <img src="<c:url value="/resources/pdf.jpg"/>" alt="" />
			
			                       		 </a> 
			
			                    </td>
			    

               				 </tr>

            		</c:forEach>
            
			</table>
			
			<jsp:include page="barredefilement.jsp"></jsp:include>
			
			</fieldset>
		
		</div>
		
	</section>

	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
	<a href="#" title="Haut de page" class="scrollup"><i class="fa fa-arrow-up"></i></a>
	
    </body>

</body>
</html>