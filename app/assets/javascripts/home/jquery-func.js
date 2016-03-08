$(document).ready(function(){

	//=================================== Slider  ===================================//
	 $("#slider1").responsiveSlides({
              speed: 1000
            });

   //=================================== Sticky nav =================================//
	$("nav").sticky({topSpacing:0});
	
	//=================================== ScrollTo nav ===============================//
	$('#menu').onePageNav();

 	//=================================== Nav Responsive =============================//
    $('#menu').tinyNav({
       active: 'selected'
    });
  
    //=================================== Totop  ===================================//
	$().UItoTop({ 		
		scrollSpeed:500,
		easingType:'linear'
	});	
	   //=================================== Last version of Fancybox V2  ===================================//
	
	$('.fancybox').fancybox();
	  jQuery("a[class*=fancybox]").fancybox({
		'overlayOpacity'	:	0.7,
		'overlayColor'		:	'#000000',
		'transitionIn'		: 'fade',
		'transitionOut'		: 'fade',
		'easingIn'      	: 'easeOutBack',
		'easingOut'     	: 'easeInBack',
		'speedIn' 			: '700',
		'centerOnScroll'	: true,
		'titlePosition'     : 'over'
	});
	
  //=================================== Subtmit Form  =================================//

	$('#form').submit(function(event) {  
	  event.preventDefault();  
	  var url = $(this).attr('action');  
	  var datos = $(this).serialize();  
	  $.get(url, datos, function(resultado) {  
	    $('#result').html(resultado);  
	  });  
	}); 
 //=================================== Slider  ===================================//

	$('.flexslider').flexslider({
	   	animation: "slide",
	   	animationLoop: true,
	   	itemWidth: 200,
	   	slideshow: true, 
	   	itemMargin: 1,
	   	minItems: 1,
	   	maxItems: 1
      });
	
	//=================================== Tooltips ====================================//

	if( $.fn.tooltip() ) {
		$('[class="tooltip_hover"]').tooltip();
	}
   
    
});

 //=================================== Skins Changer ====================================//
	google.setOnLoadCallback(function()
	{
	    // Color changer
	    $(".colordefault").click(function(){
	        $("link").attr("href", "css/skins/default.css");
	        return false;
	    });
	    
	    $(".color1").click(function(){
	        $("link").attr("href", "css/skins/blue.css");
	        return false;
	    });
	    
	    $(".color2").click(function(){
	        $("link").attr("href", "css/skins/red.css");
	        return false;
	    });

	     $(".color3").click(function(){
	        $("link").attr("href", "css/skins/gray.css");
	        return false;
	    });
	});