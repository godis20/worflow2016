<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8" />
        <title>Entête de page</title>
        <link type="text/css" rel="stylesheet" href="inc/style.css" />

</head>
<body>
		



			<header>
                <div id="entetePage">
                
                    <div id="logoUniv">
                        <img src="images/logoUniv.jpg" alt="Logo Univ. Rennes1" />
                           
                    </div>
                    <div id="logoAppli"> 
                    	<img src="images/logoApplication.jpg" alt="Logo application workflow" />
                    </div>
                   
                </div>
                
                <nav>
                    <ul>
                        <li>Vous etes connectés en tant que : <c:out value="${connexion.login}"/> </li>
                        <li><a href="menuPrincipal.jsp">Acceuil</a></li>
                        <li><a href="deconnecter">Se deconnecter</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </nav>
            </header>

		

			


</body>
</html>
