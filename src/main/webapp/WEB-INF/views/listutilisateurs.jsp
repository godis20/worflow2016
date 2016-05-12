<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8" />
        <title>Liste utilisateurs</title>
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
		
		
			<jsp:include page="form_rechercheutilisateurs.jsp"></jsp:include>
			
			<fieldset>
			
			<legend>Liste demandes classiques du système </legend>
		
			<table>
        			<tr>

                    <th>Nom</th>

                    <th>Composante</th>

                    <th>Date creation</th>
                    
                    <th>Login</th>

                    <th>Password</th>
                   
                    <th class="action">Modifier</th> 

                    <th class="etat">Etat </th> 
                         
                     <th>Cree par  </th>              

           			</tr>
            
            
            
                <%-- Parcours de la liste des utilisateurs de la BD --%>
            
           		 <c:forEach items="${listutilisateurs}" var="mapUser" varStatus="boucle">
            	
            
               		 <%-- Simple test de parité sur l'index de parcours, pour alterner la couleur de fond de chaque ligne du tableau. --%>

                	<tr class="${boucle.index % 2 == 0 ? 'pair' : 'impair'}">
                	

			                    <%-- Affichage des propriétés du bean demande, qui est stocké en tant que valeur de l'entrée courante de la list --%>
			
			                    <td><c:out value="${ mapUser.nom }  ${mapUser.prenom }"/></td>
			
			                    <td><c:out value="${ mapUser.composante.libelle_composante }  "/></td>
			
			                    <td><c:out value="${ mapUser.dateCreationUtilisateur }"/></td> 
			
			                    <td><c:out value="${ mapUser.email }"/></td>
			
			                    <td><c:out value="${ mapUser.password }"/></td> 
			                    
			                    
			                    
			                     <td class="action">
			                     
			                		<a href="<c:url value="/modifierutilisateur"><c:param name="" value="" /></c:url>">
			                        <img src="<c:url value="/ressources/modifier.png"/>" alt="Modifier" /> 
			
			
			                     </td>
			
			                    <%-- Lien vers la servlet de suppression, avec passage du nom du client - c'est-à-dire la clé de la Map - en paramètre grâce à la balise <c:param/>. --%>
			
			                    <td class="document">
			
			                            <a href="<c:url value="/etatcompte"><c:param name="" value="" /></c:url>">
			
			                            <img src="<c:url value="/ressources/etat.png"/>" alt="Actif" />
			
			                       		 </a> 
			
			                    </td>
			    
			    				<td><c:out value="${ mapUser.createur.nom }  ${mapUser.createur.prenom }"/></td> 

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