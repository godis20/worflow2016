	/* Script pour la gestion du bouton "remonter plus haut" */


			  ScrollToTop=function() 
			  {
	        	  var s = $(window).scrollTop();
	        	  if (s > 25) {
	        	    $('.scrollup').fadeIn();
	        	  } 
	        	  else {
	        		  $('.scrollup').fadeOut();
        	  }
        	 
	        	  
        	  $('.scrollup').click(function () {
        	      $("html, body").animate({ scrollTop: 0 }, 'slow');
        	      return false;
        	  });
			  }
        	 
	        	StopAnimation=function() {
	        	  $("html, body").bind("scroll mousedown DOMMouseScroll mousewheel keyup", function(){
	        	    $('html, body').stop();
	        	  });
	        	}
        	 
        	 
        	$(window).scroll(function() {
        	  ScrollToTop();
        	  StopAnimation();
        	});