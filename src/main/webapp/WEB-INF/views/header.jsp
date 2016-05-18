<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="header">


 					<nav id="logoUniv">
<%--  						 <img src="<c:url value="/resources/logoUniv.jpg"/>"  /> --%>
                       
                           
                    </nav>
                    
                    <nav id="logoAppli"> 
<%--                     	<img src="<c:url value="/resources/logoApplication.jpg"/>" /> --%>
                    </nav>
                    
                
                
                <nav id="others">
                    <ul>
                        <li ><img src="<c:url value="/resources/connexion.jpg" />">Vous etes connectés en tant que : <c:out value="${user.nom } "/> </li>
                        <li><a href="listdemandeclas">Acceuil</a></li>
                        <li><a href="deconnexionutilisateur">Se deconnecter</a></li>
                        <li><a href="https://www.univ-rennes1.fr/">Contact</a></li>
                    </ul>
                </nav>
                
                
</div>