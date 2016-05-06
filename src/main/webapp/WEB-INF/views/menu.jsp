<div class="verticalaccordion">


 		<ul >
 		
			<li> 
				<h3>Gestion demande classique</h3>
			 
		
				<div id="classique">
				<ul>
				
					<li>
					  <a href="">Liste demande</a>
					</li>
					
					 <li>
					    Nouvelle Demande
					 </li>
					
					<li>
					    <a>Finalisation Demande</a>
					</li>
					
					<li>
					    <a>Renouvellment Demande</a>
					</li>
					
					<li>
					    <a>Instruction Demande</a>
					</li>
					
					<li>
					    <a>Validation Demande</a>
					</li>
					
					<li>
					    <a>Cloture Demande</a>
					</li>
					
					
				</ul>
				
				</div>
			</li>
			
			
			<li>
			
				<h3>Gestion demande recherche</h3>
				
				<div>
			 	<ul>
			 		<li>
					  <a>Liste demande</a>
					</li>
					
					 <li>
					    Nouvelle Demande
					 </li>
					
					<li>
					    <a>Finalisation Demande</a>
					</li>
					
					<li>
					    <a>Renouvellment Demande</a>
					</li>
					
					<li>
					    <a>Modification Demande</a>
					</li>
					
					<li>
					    <a>Validation Demande</a>
					</li>
					
					<li>
					    <a>Cloture Demande</a>
					</li>
			 	</ul>
			 	
			 	</div>
			 	
			 	
			 </li>
			
			<li>
			
				<h3>Administration</h3>
			     
			     <div>
				 <ul>
				 
				 	<li>
					  <a>Liste utilisateur</a>
					</li>
					
					 <li>
					    Nouveau utilisateur
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
	      $(this).parent().find('ul').slideToggle();
      }
    );
});

</script>