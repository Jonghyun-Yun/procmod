jQuery.noConflict();
jQuery(document).ready(function($){
	 //Event for clicking on the close icon 'X'	 
	 $('.close-icon').click(function(){
			$('.appointment-sec-show').attr('tabindex', 0);
			$('.close-icon').attr('tabindex', -1);		 
	  		$('.appointment-sec').hide();
			$('.current-status-sec').show();
			
	  });  
	 
	 //Event for clicking on the open/expand icon '+'	 
	  $('.appointment-sec-show').click(function(){
			$('.appointment-sec-show').attr('tabindex', -1);
			$('.close-icon').attr('tabindex', 0);
	  		$('.appointment-sec').show();
			$('.current-status-sec').hide();
		
	  }); 
	  
  
	  //Event for pressing the Enter key on the close icon 'X'	  
	  $('.close-icon').keypress(function(e){
		  if (e.which == 13){
			  $(this).click();
			  // This is to prevent the form from being submitted in IE when the Enter key is pressed
			  e.preventDefault();			
		  } 					
	  });  	 	  	  
	  
	  //Event for pressing the Enter key on the open/expand icon '+'	 
	  $('.appointment-sec-show').keypress(function(e){
		  if (e.which == 13){
			  $(this).click();
			  // This is to prevent the form from being submitted in IE when the Enter key is pressed
			  e.preventDefault();
		  }		 
	  });  	  	  
	  
});