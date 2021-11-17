
jQuery(document).ready(function($){
	
	$("#drop_link1").click(function(){		 
			$(".application-list1").slideToggle("500");			 
	});
	$("#drop_link").click(function(){		 
			$(".application-list").slideToggle("500");			 
	});	

  $('.block').click(function () {
    if ($(window).width() > 1006) {
      /*Reset All*/
     var div_id = $(this).attr('id');
     var pos = div_id.indexOf("_div");     
     var box_id = div_id.substring(0,pos);       
     var anchor_id = box_id + "_a";
     var image_id = box_id + "_img";
     if ($(this).children('.show-content').hasClass('selected') == false) {
        $('.show-content-section').fadeOut(200);
        $('.get-info a').removeClass('white_icon');
        $('.drop-arrow').fadeOut(50);
        $('.show-content').removeClass('selected');       
        changeRelatedToolImageStatus( 'expand', div_id, anchor_id, box_id );
      } else {
    	changeRelatedToolImageStatus( 'collapse', div_id, anchor_id, box_id );
      }
      $(this).children('.show-content').toggleClass('selected');
      $(this).children().find('.get-info a').toggleClass('white_icon', 1000, "fade");
      $(this).children().find('.get-info a').fadeIn(500);
      $(this).children('.show-content').next('.drop-arrow').fadeToggle(500);
      $('#' + box_id).slideToggle(500);
      $('#' + image_id).focus();
    }
  });
  
  
  function changeRelatedToolImageStatus( purposeIs, div_id, anchor_id, box_id ) {
    if( purposeIs == 'expand' ) {
    	for (i=0; i < divIds.length; i++){    		
    		if (div_id == divIds[i]){    	    	
    	    	$("#" + div_id).attr("title", relatedToolsDivTitleExpanded[div_id]);
    	    	$("#" + anchor_id).attr("title", relatedToolsDivTitleExpanded[div_id]);    	    	
    		} else {
    		   	$("#" + divIds[i]).attr("title", relatedToolsDivTitleCollapsed[divIds[i]]);    		   	
    		     var pos =divIds[i].indexOf("_div");     
    		     var anchor_id_other = (divIds[i].substring(0,pos)) + "_a";   	
    	    	$("#" + anchor_id_other).attr("title", relatedToolsDivTitleCollapsed[divIds[i]]);
    		}
    	}
    } else {
    	$("#" + div_id).attr("title", relatedToolsDivTitleCollapsed[div_id]);
    	$("#" + anchor_id).attr("title", relatedToolsDivTitleCollapsed[div_id]);
    }
  }; 
  
   
  // keyboard support to show or hide the display of visit button
  $('.block').keypress(function (event) {
	  if( event.which == 13 ) {
		  $(this).click();
		// This is to prevent the form from being submitted in IE when the Enter key is pressed
		  event.preventDefault();
	  }
  });

    
 $("#menuIcon").keypress(function (event) {
	  if( event.which == 13 ) {
		  $(this).click();
		// This is to prevent the form from being submitted in IE when the Enter key is pressed
		  event.preventDefault();
	  }
  });
  
    $("#menuIcon").click(function(){ 
    	
		if($("#menuIcon").attr("src") == "images/menu_closed.png"){
			$("#menuIcon").attr("src", "images/menu_open.png");  
			$("#menuIcon").attr("alt", "Select to close menu");
		}else{
			$("#menuIcon").attr("src", "images/menu_closed.png");
			$("#menuIcon").attr("alt", "Select to open menu");
		}
	});


  function mobileToggleMenu() {
    if ($(window).width() < 1007) {
      $('.show-content-section').fadeOut(200);
      $('.get-info a').removeClass('white_icon');
      $('.drop-arrow').fadeOut(50);
      $('.show-content').removeClass('selected');
      $(".footer-nav .mobile-togglemenu").remove();
      $(".footer-nav .heading").append("<a class='mobile-togglemenu'>&nbsp;</a>");
      $(".footer-nav .heading").addClass('toggle');      
      $(".footer-nav .mobile-togglemenu").click(function () {
        $('.footer-nav').children().find('ul').slideUp(500);
        $('.heading').removeClass('active');
        if ($(this).parent().parent().find('ul').css('display') == 'none') {
          $(this).parent().toggleClass('active').parent().find('ul').slideToggle('slow');
        }
      });
      // Pressing Enter on the Div that contains the footer menus triggers the click event of +/-  
      $("div.footer-block").keypress(function(e){
		if (e.which == 13){
			if ($(e.target).is('div')){ // Trigger the mobile toggle menu event only when the user presses on the Div and not any of its children
				$(this).children().find('.mobile-togglemenu').click();
				return false;
			}
		}		
	  });/*
	  if(document.getElementById("tabval").innerText.includes("Address")){
	  $("div#coaTools").wrap( "<a href='https://www.uscis.gov/addresschange'></a>" );
	  }
	  else{
	  $("div#coaTools").wrap( "<a href='https://www.uscis.gov/es/cambiodireccion'></a>" );
	  }*/
	  $("div#coaTools").wrap( "<a href='https://www.uscis.gov/addresschange'></a>" );
      $("div#sroTools").wrap( "<a href='https://egov.uscis.gov/e-Request/Intro.do'></a>" );
      $("div#ptTools").wrap( "<a href='https://egov.uscis.gov/processing-times/'></a>" );
      $("div#olTools").wrap( "<a href='https://egov.uscis.gov/crisgwi/go?action=offices'></a>" );
      $(".footer-block").attr('tabindex', "0");
    } else {
      $(".footer-nav .heading").parent().find('ul').removeAttr('style');
      $(".footer-nav .heading").removeClass('active');
      $(".footer-nav .heading").removeClass('toggle');
      $(".footer-nav .mobile-togglemenu").remove();
      $(".footer-block").removeAttr('tabindex');
      $("div.footer-block").unbind("keypress");
    }
  } 

  $(window).resize(function () {
    mobileToggleMenu();
  });

  mobileToggleMenu();

});