	/*  Script jQuery pour l'affichage du bloc agent a remplacer du formulaire */
	
        	$(document).ready(function(){
        		/* 1 - Au lancement de la page, on cache le bloc d'éléments du formulaire correspondant aux clients existants */

        		/* 2 - Au clic sur un des deux boutons radio "choixNouveauClient", on affiche le bloc d'éléments correspondant (nouveau ou ancien client) */
         
        	
        	
        		 $("div#agent").hide();
        		 $("#nature").change(function() {
                	
                    
                    if(($("#nature").val()) != "3" && ($("#nature").val()!="")){
                    	
                    	$("div#agent").show("fast");
                   }
                    else  $("div#agent").hide();
                });
        		 
            });