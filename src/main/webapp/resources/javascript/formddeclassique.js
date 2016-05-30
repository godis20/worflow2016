 /*  Script verification champs du formulaire 	 */
	
       
        	function surligne(champ, erreur)
        	
        	{
        	   if(erreur){
        		
        	      champ.style.borderColor = "#c42622";
        	   	  champ.style.fontWeight= "bold";
        	   }else{
        		   
        		   champ.style.borderColor = "";
         	   	   champ.style.fontWeight= "";
        	   }
        	
        	}
        	
        	
        	
        	function verifNomagt(champ)
        	{
        		
        		if(document.getElementById('nature').value!=3 && document.getElementById('nature').value!=""){
        			
        		
		        	   if(champ.value.trim().length < 2 || champ.value.trim().length > 30)
		        	   {
		        	      document.getElementById('errornomagt').innerHTML="Le nom doit tenir sur 3 positions, max 30!!";
		        		  surligne(champ, true);
		        	      return false;
		        	   }
		        	   else
		        	   {
		        	      surligne(champ, false);
		        		  document.getElementById('errornomagt').innerHTML="";
		        	      return true;
		        	   }
        		}
        	}
        	
        	
        	
        	function verifPrenomagt(champ)
        	
        	{
        		
        		if(document.getElementById('nature').value!=3 && document.getElementById('nature').value!=""){
        		
	        	   if(champ.value.trim().length < 2 || champ.value.trim().length > 30)
	        	   {
	        	      document.getElementById('errorprenomagt').innerHTML="Le prenom doit tenir sur 3 positions, max 30!!";
	        		  surligne(champ, true);
	        	      return false;
	        	   }
	        	   else
	        	   {
	        	      surligne(champ, false);
	        		  document.getElementById('errorprenomagt').innerHTML="";
	        	      return true;
	        	   }
        		}
        	
        	}
        	
        	
        	
        	function verifDateagt(champ)
        	{
        		if(document.getElementById('nature').value!=3 && document.getElementById('nature').value!=""){
        			
        		
			        	   if(champ.value==null|| champ.value== "")
			        	   {
			        	      document.getElementById('errordateagt').innerHTML="La date doit être renseignée!!";
			        		  surligne(champ, true);
			        	      return false;
			        	   }
			        	   else
			        	   {
			        	      surligne(champ, false);
			        		  document.getElementById('errordateagt').innerHTML="";
			        	      return true;
			        	   }
        		}
        	}
        	
        	
        	
        	function verifMotif(champ)
        	{
        		
        		if(document.getElementById('nature').value!=3 && document.getElementById('nature').value!=""){
        			
        		
			        	   if(champ.value.trim().length < 6)
			        	   {
			        		  document.getElementById('errormotif').innerHTML = "Le motif doit tenir au moins sur 6 positions!";
			        		  surligne(champ, true);
			        	      return false;
			        	   }
			        	   else
			        	   {
			        	      surligne(champ, false);
			        		  document.getElementById('errormotif').innerHTML="";
			        	      return true;
			        	   }
        		}
        	}
        	
        	

        	function verifQuotite(champ)
        	{
        	
        		
			        	   if(champ.value=="")
			        	   {
			        		  document.getElementById('errorquotite').innerHTML = "Veuillez choisir une option!!";
			        		  surligne(champ, true);
			        	      return false;
			        	   }
			        	   else
			        	   {
			        	      surligne(champ, false);
			        		  document.getElementById('errorquotite').innerHTML="";
			        	      return true;
			        	   }
        		
        	}
        	
        	
        /* 	function verifCategorie(champ)
        	{
        	
        		
			        	   if(champ.value=="")
			        	   {
			        		  document.getElementById('errorcategorie').innerHTML = "Veuillez choisir une option!!";
			        		  surligne(champ, true);
			        	      return false;
			        	   }
			        	   else
			        	   {
			        	      surligne(champ, false);
			        		  document.getElementById('errorcategorie').innerHTML="";
			        	      return true;
			        	   }
        		
        	}
        	  */
        	
    
        	
        	
    
        	

        	
        	function verifForm(form)
        	
        	{

        		 		if(document.getElementById("pushedbutton").value == 0){return true;}
        			
        				var nature= document.getElementById("nature").value;
    					
    					var nomagt = verifNomagt(form.nomagt);
        				var prenomagt = verifPrenomagt(form.prenomagt);		
        				var dateagt = verifDateagt(form.dateagt);
        				var motif = verifMotif(form.motif);
        				
        				var quotite = verifQuotite(form.quotite);
        				
//         			    var categorie = verifCatgerorie(form.categorie); 
        				
				
        				if(nature!=3 && nature!=""){
        					
        				
            				if(nomagt && prenomagt && dateagt && motif && quotite ){
            					
            					return true;
            					
            				} 
            				
            				else {
            				
            					document.getElementById('errorform').innerHTML= "Le formulaire est mal rempli!!!";
            					return false;
            					
            				}
            				
        				}
        				
        				else{
        					
        					
							if( quotite ){
            					
            					return true;
            					
            				} 
            				
            				else {
            				
            					document.getElementById('errorform').innerHTML= "Le formulaire est mal rempli!!!";
            					return false;
            					
            				}
        					
        				}
          		}
       
    				
    	
       
        	function envoyerform(){  
        		
        	    if (confirm ('Voulez vous vraiment soumettre cette demande pour instruction ? ')){
        	      document.forms["myForm"].submit();
        	    }
        	  }
        	