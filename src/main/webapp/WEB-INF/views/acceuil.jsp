<%@ page pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
	

    <head>

        <meta charset="utf-8" />

        <title>Page d'acceuil</title>

        <link type="text/css" rel="stylesheet" href="<c:url value="/resources/style.css"/>" />
       


    </head>

    <body>
    
    <header class="header">
    	<jsp:include page="header.jsp"></jsp:include>
    
    </header>
    
    <section >
		
		<div class="menu">
			
			<jsp:include page="menu.jsp"></jsp:include>
		
		</div>
        

        <div class="content">BONJOUR
        
        </div>
        
     </section>
     
     <footer class="footer">
     
		<jsp:include page="footer.jsp"></jsp:include>
		
	</footer>
	
    </body>
    
    

</html>