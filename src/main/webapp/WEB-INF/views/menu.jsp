<div>


 		<ul >
 		
			<li> 
			 <a href="#" id="iddemandeclas">
			    Gestion demande classique
			 </a>
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
			</li>
			
			
			<li>
				 <a id="iddemanderech">
				    Gestion demande recherche
				 </a>
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
			
			<li>
			      <a id="idadministration">
				    Administration
				 </a>
				 <ul>
				 
				 	<li>
					  <a>Liste utilisateur</a>
					</li>
					
					 <li>
					    Nouveau utilisateur
					 </li>
				 </ul>
			</li>
			
			
		</ul>
		
		
</div>
<script src="//code.jquery.com/jquery-2.0.3.min.js"></script>
<script type="text/javascript" >
$(document).ready(function() {

	$("#iddemandeclas").click(function(e){
	      $(this).parent().find('ul').slideToggle();
      }
    );
});

</script>