<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8" />
        <title>Liste utilisateurs</title>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/style.css"/>" />
    <link rel="icon" type="image/png" href="<c:url value="/ressources/favicone.jpg"/>" />   

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
			
			<legend>Liste utilisateurs du système </legend>
		
			<table>
        			<tr>

                    <th>Nom</th>

                    <th>Composante</th>

                    <th>Date creation</th>
                    
                    <th>Login</th>
                    
                    <th>Rôle</th>
                   
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
			                    
			                    
			                    
			                     <td class="action" align="center">
			                     
			                		<a href="<c:url value="/modifierutilisateur"><c:param name="iduser" value="${ mapUser.id}" /></c:url>">
			                        <img src="<c:url value="/resources/modifier.jpg"/>" alt="" /> 
									</a>
			
			                     </td>
			
			                    <%-- Lien vers la servlet de suppression, avec passage du nom du client - c'est-à-dire la clé de la Map - en paramètre grâce à la balise <c:param/>. --%>
			
			                    <td class="etatuser" align="center">
			                    
										<c:if test="${mapUser.etat_utilisateur==true }">
			                            <img src="<c:url value="/resources/actif.jpg"/>" alt="" />
										</c:if>
										
										<c:if test="${mapUser.etat_utilisateur==false }">
										<img src="<c:url value="/resources/nonactif.jpg"/>" alt="" />
										</c:if>
			
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