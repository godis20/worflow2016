<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8" />
        <title>Liste demande recherche</title>
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
		
		
			<jsp:include page="form_recherchedemanderech.jsp"></jsp:include>
			
			<fieldset>
			<p>
			  <span class="error">
				   		<c:if test="${error!=null}">
				   			<img src="<c:url value="/resources/warning.jpg"/>" alt="" />
				   			<c:out value="${error}"/>
				   		</c:if>
				   </span>
				   
				    <span class="succes">
				   		<c:if test="${succes!=null}">
				   			<img src="<c:url value="/resources/succes.jpg"/>" alt="" />
				   			<c:out value="${succes}"/>
				   		</c:if>
				   </span>
			</p>
			
			<legend>Liste demandes recherches du système </legend>
		
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
            
           		 <c:forEach items="${listdemanderech}" var="mapDde" varStatus="boucle">
            	
            
               		 <%-- Simple test de parité sur l'index de parcours, pour alterner la couleur de fond de chaque ligne du tableau. --%>

                	<tr class="${boucle.index % 2 == 0 ? 'pair' : 'impair'}">
                	

			                    <%-- Affichage des propriétés du bean demande, qui est stocké en tant que valeur de l'entrée courante de la list --%>
			
			                    <td><c:out value="${ mapDde.id }"/></td>
			
			                    <td><c:out value="${ mapDde.demandeur.nom }  ${ mapDde.demandeur.prenom }"/></td>
			
			                    <td><c:out value="${ mapDde.demandeur.composante.libelle_composante }"/></td> 
			
			                    <td><c:out value="${ mapDde.datecreationDemande }"/></td>
			
			                    <td><c:out value="${ mapDde.autreBesoinDemande }"/></td> 
			                    
			                    
			                    
			                     <td class="statut"  align="center">
			                     
			                     	<c:if test="${mapDde.statutEnCours.id==1 }">
			                     		<img src="<c:url value="/resources/envoyer.jpg"/>" alt="" /> 
			                     	</c:if>
			                     	
			                     
			                     	
			                     	<c:if test="${mapDde.statutEnCours.id==3 }">
			                     		<img src="<c:url value="/resources/valider.jpg"/>" alt="" /> 
			                     	</c:if>
			                     
			                		<c:if test="${mapDde.statutEnCours.id==4 }">
			                     		<img src="<c:url value="/resources/cloture.jpg"/>" alt="" /> 
			                     	</c:if>
			                     
			                
			                      
			
			
			                     </td>
			
			                    <%-- Lien vers la servlet de suppression, avec passage du nom du client - c'est-à-dire la clé de la Map - en paramètre grâce à la balise <c:param/>. --%>
			
			                    <td class="document" align="center">
			
			                            <a href="<c:url value="/afficherdemanderech"><c:param name="iddemande" value="${ mapDde.id }" /></c:url>">
			
			                            <img src="<c:url value="/resources/pdf.jpg"/>" alt="" />
			
			                       		 </a> 
			
			                    </td>
			    

               				 </tr>

            		</c:forEach>
            
			</table>
			
			<jsp:include page="barredefilement.jsp"></jsp:include>
			
			<p>
			<img src="<c:url value="/resources/envoyer.jpg"/>" alt="" />   <label> Demande envoyée/ en attente de validation    </label>
			
			<img src="<c:url value="/resources/valider.jpg"/>" alt="" />   <label> Demande validée/ en attente de clôture    </label><br/>
			<img src="<c:url value="/resources/cloture.jpg"/>" alt="" />   <label> Demande clôturée    </label>
			
			</p>
			
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