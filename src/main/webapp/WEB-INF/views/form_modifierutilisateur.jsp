<%@ page pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
	

    <head>

        <meta charset="utf-8" />

        <title>Modifier parametres utilisateur</title>

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
        

        <div class="content">

            <form method="post" action="<c:url value="/modifierutilisateur"/>"   onreset="return confirm('Voulez vous vraiment reinitialiser  ?');">

               <fieldset>
               	  <span class="error">
				   		<c:if test="${error!=null}">
				   			<img src="<c:url value="/resources/warning.jpg"/>" alt="" />
				   			<c:out value="${error}"/>
				   		</c:if>
				   </span>
				   
				   <fieldset>

                    <legend>Informations utilisateur</legend>
						
						<p>
						<label for="nom">Nom :</label>
						
						<input type="text" id="nom" name="nom" size="30" maxlength="30" value="<c:out value="${utilisateur.nom}"/>" disabled="disabled"/>
						
						
						
						</p>
						
						<p>
						<label for="prenom">Prénom : </label>
						
						<input type="text" id="prenom" name="prenom"  size="30" maxlength="30" value="<c:out value="${utilisateur.prenom}" />" disabled="disabled"/>
						</p>
						
						<p>
						<label for="email">Adresse email :</label>
						
						<input type="email" id="email" name="email"  size="30" maxlength="60" value="<c:out value="${utilisateur.email}"/>" disabled="disabled"/>
						
						
						</p>
						
						<p>
						<label for="password">Mot de passe : </label>
						
						<input type="password" id="password" name="password"  size="30" maxlength="60" disabled="disabled"/>
						
						
						</p>
						
						
						
						<p>
						<label for="poste">Poste : </label>
						
						<input type="text" id="poste" name="poste" size="30" maxlength="30" value="<c:out value="${utilisateur.poste}"/>" disabled="disabled"/>
						
						
						
						</p>
						
						<p>
						<label for="composante">Composante : </label>
												
						<input type="text" id="composante" name="composante" size="30" maxlength="30" value="<c:out value="${utilisateur.composante.libelle_composante}"/>" disabled="disabled"/>
						
						
		
						</p>
						
						
						<p>
						<label for="etatuser">Etat User : <span class="requis">*</span></label>
							
							<c:if test="${utilisateur.etat_utilisateur==true }">
							<input type="radio" name="etatuser" id="actif" value="1" checked><label>Activé </label>
							<input type="radio" name="etatuser" id="nonactif" value="0" ><label>Desactivé </label>
							</c:if>
							
							<c:if test="${utilisateur.etat_utilisateur==false }">
							<input type="radio" name="etatuser" id="actif" value="1" ><label>Activé </label>
							<input type="radio" name="etatuser" id="nonactif" value="0" checked><label>Desactivé </label>
							</c:if>
						
						<span id="erreuretat" class="error"><c:out value="${erreuretat}"/></span>
						
						</p>
						
						</fieldset>
						
						<fieldset >
						
								<legend>Privileges utilisateur</legend>
								
								<div id="privilege">
								
								<div class="role" id="classique">
									<label id="clas"> Classique :</label>
									<p><input type="radio" name="classique" id="none" value="0" checked><label> Aucun </label></p>
									<p><input type="radio" name="classique" id="ddeurclas" value="1"><label> Demandeur </label></p>
									<p><input type="radio" name="classique" id="instructeur" value="2"><label> Instructeur </label></p>
									<p><input type="radio" name="classique" id="valclas" value="3"><label> Validateur </label></p>
									<p><input type="radio" name="classique" id="gestionnaire" value="4"><label> Gestionnaire </label></p>
								</div>
								
								
								<div class="role" id="recherche">
									<label id="clas"> Recherche :</label>
									<p><input type="radio" name="recherche" id="none" value="0" checked><label> Aucun </label></p>
									<p><input type="radio" name="recherche" id="ddeurech" value="5"><label> Demandeur </label></p>
									<p><input type="radio" name="recherche" id="valrech" value="6"><label> Validateur </label></p>
									<p><input type="radio" name="recherche" id="clotureur" value="7"><label> Clôtureur </label></p>
									
								</div>
								
								<div class="role" id="administrateur">
									<label id="clas"> Clas. & Rech. :</label>
									<p><input type="radio" name="admin" id="none" value="0" checked><label> Aucun </label></p>
									<p><input type="radio" name="administrateur" id="admin" value="8"><label> Gestion user</label></p>
									
									
								</div>
						
								<div class="role" id="superadmin">
									<label id="clas"> Clas. & Rech. :</label>
									<p><input type="radio" name="superadmin" id="none" value="0" checked><label> Aucun </label></p>
									<p><input type="radio" name="superadmin" id="superadmin" value="9"><label> Gestion appli.</label></p>
									
									
								</div>
								
								</div>
						
						</fieldset>
						
					
                      

                </fieldset>

                
                <span id="formulaire"></span>
                  <span class="error">
				   		<c:if test="${error!=null}">
				   			<img src="<c:url value="/resources/warning.jpg"/>" alt="" />
				   			<c:out value="${error}"/>
				   		</c:if>
				   </span>
				
                <input type="submit" value="Modifier"  />

                <input type="reset" value="Remettre à zéro" /> <br />

            </form>
   
        </div>

	</section>
	
	
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
    </body>
    
       
</html>