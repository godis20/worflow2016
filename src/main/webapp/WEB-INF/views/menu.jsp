<div class="verticalaccordion">


 		<ul>
 		
			<li> 
				<a href="#" id="classique">Gestion demande classique</a>
			 
		
				<div>
				<ul id="myul">
				
					<li>
					  <a href="listdemandeclas">Liste demande</a>
					</li>
					
					 <li>
					     <a href="ajoutdemandeclas">Nouvelle Demande </a>
					 </li>
					
					<li>
					    <a href="listddeclasafinaliser">Finalisation Demande</a>
					</li>
					
					<li>
					    <a href="listddeclasarenouveller">Renouvellement Demande</a>
					</li>
									
					<li>
					    <a href="listddeainstruire">Instruction Demande</a>
					</li>
					
					<li>
					    <a href="listddeclasavalider">Validation Demande</a>
					</li>
					
					<li>
					    <a href="listddeclasacloturer">Clôture Demande</a>
					</li>
					
					
				</ul>
				
				</div>
			</li>
			
			<li> 
				<a href="#" id="recherche">Gestion demande recherche</a>
			 
		
				<div>
				<ul id="myul">
				
					<li>
					  <a href="listdemanderech">Liste demande</a>
					</li>
					
					 <li>
					     <a href="ajoutdemanderech">Nouvelle Demande </a>
					 </li>
					
					<li>
					    <a href="listdderechafinaliser">Finalisation Demande</a>
					</li>
					
					<li>
					    <a href="">Renouvellement Demande</a>
					</li>
			
					<li>
					    <a href="listdderechavalider">Validation Demande</a>
					</li>
					
					<li>
					    <a href="">Clôture Demande</a>
					</li>
					
					
				</ul>
				
				</div>
			</li>
			
			
			<li> 
				<a href="#" id="administration">Administration</a>
			 
		
				<div>
				<ul id="myul">
				
					<li>
					  <a href="ajoututilisateur">Nouveau utilisateur</a>
					</li>
					
					 <li>
					     <a href="listutilisateurs"> Parametrage utilisateur </a>
					 </li>
					
					
					
				</ul>
				
				</div>
			</li>
		</ul>	
</div>

<script src="//code.jquery.com/jquery-2.0.3.min.js"></script>
<script type="text/javascript" >
$(document).ready(function() {

	$("#classique").click(function(e){
	     $(this).parent().find('div').find('ul').slideToggle();
      }
    );
	
	$("#recherche").click(function(e){
	     $(this).parent().find('div').find('ul').slideToggle();
     }
   );
	
	$("#administration").click(function(e){
	     $(this).parent().find('div').find('ul').slideToggle();
    }
  );
});

</script>