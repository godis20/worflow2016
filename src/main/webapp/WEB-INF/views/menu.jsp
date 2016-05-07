<div class="verticalaccordion">


 		<ul>
 		
			<li> 
				<a href="#" id="classique">Gestion demande classique</a>
			 
		
				<div>
				<ul id="myul">
				
					<li>
					  <a href="">Liste demande</a>
					</li>
					
					 <li>
					     <a href="">Nouvelle Demande </a>
					 </li>
					
					<li>
					    <a>Finalisation Demande</a>
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
		</ul>	
</div>

<script src="//code.jquery.com/jquery-2.0.3.min.js"></script>
<script type="text/javascript" >
$(document).ready(function() {

	$("#classique").click(function(e){
	     $(this).parent().find('div').find('ul').slideToggle();
      }
    );
});

</script>