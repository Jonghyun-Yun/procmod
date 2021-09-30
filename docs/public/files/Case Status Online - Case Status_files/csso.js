//Use $j or jQuery to reference the jQuery library outside of document.ready(). May continue to use $ for jQuery inside
// document.ready()
//The use of $ has been relinquished to bootstrap (see cssolayout.jsp)
var userSecQAPick = new Object;
var totalSecQAEachUser = 4;
var USA = "United States of America";
// 2014-0919
var currentHistPage;
var currentUpcomePage;
var appReceiptNum;

function buildReceiptPrefixPattern(){
	var receiptPrefixPattern="";
	var counter=0;
	//receiptPrefixMap is set in validationmessages.jsp
	for (var mapKey in receiptPrefixMap){
		if (counter > 0){
			receiptPrefixPattern += "|";	
		}
		receiptPrefixPattern += receiptPrefixMap[mapKey];			
		++counter;		 
	}
	return receiptPrefixPattern;
}

jQuery(document).ready(function($){
	
    $("#skipper").click(function () {
    	//Global variable mainContentId is set in cssolayout.jsp 
        $('#' + mainContentId).attr('tabIndex', -1).focus();
    });
    
    //last minute change to make password field blank when the login page is displayed
    if (existsInDom($('#password')) && existsInDom($('#loginBtn'))){
		$('#password').val('');
	}
    
    $("#applicant_cust_div").keypress(function(event) {
    	if (13==event.keyCode){
    		$("#applicant-customer").trigger( "click" );
    		event.preventDefault()
    	}
    });
    
    $("#applicant_rep_div").keypress(function(event) {
    	if (13==event.keyCode){
    		$("#customer_representative").trigger( "click" );
    		event.preventDefault()
    	}
    });
    
       
	 function prependError(message){
		 return "Error: " + message;
	 }
	 
	 function hasTwoIdenticalConsecutiveChars(value){
        var check = false;
   	 	for (var i = 0; i < value.length - 2; i++) {
	      if ((value.substring(i,i+1)) == (value.substring(i+1, i+2))) {
	        if ((value.substring(i+1, i+2)) == (value.substring(i+2, i+3))) {
	          check = true;
	          break;
	        } // end if
	      } // end if
		} // end for
        return check;
     }    
	 
	 function isUndefined(object){
		 return typeof object === 'undefined';
	 }
	 
	 
	var alertBox = new alertDialog( 
			{my:'left+40 top+10', at:'center-200', of:window,				
				collision:'flip' 
			}, 
			'55%', '', "popupDialogArea", 
			okButtonCaption,  	
		    function(){ return true; }, 
		    closeButtonCaption
	   );	 
	 
	 page.init();
	 	 
	 $("#country").change(function () {
		 page.setState();
	 });  
	 
	 $.validator.addMethod(
			"validReceiptNumber",
			function (value, element) {
			    var pattern = new RegExp("^(" + buildReceiptPrefixPattern() + ")(\\*|\\d)\\d{9}$");
			    return this.optional(element) || pattern.test(value.toUpperCase());
			},
			prependError(validationMessages['error.invalid.receiptnumber'])
	  );
	 
	 $.validator.addMethod(
			"validMobilePhone",
			function (value, element) {
				// A valid phone number is either 10 digits as in 2025551212
				// or 12 characters (3 digits-3 digits-4 digits) as in 202-555-1212.
			    var pattern = /^\d{10}|\d{3}\-\d{3}\-\d{4}$/;
			    return this.optional(element) || pattern.test(value);
			},
			prependError(validationMessages['error.invalid.mobilePhone'])
	 );	 
	 
	 $.validator.addMethod(
			"validPostalCode",
			function (value, element) {
				// A valid US zip code is either five digits or 'five digits-four digits'
			    var pattern = /^\d{5}(?:\-\d{4})?$/;
			    var country = $("#country :selected").text();			   
			    return this.optional(element) || (country == USA && pattern.test(value)) || country != USA  ;
			},
			prependError(validationMessages['error.invalid.postalCode'])
	); 
	 
	 $.validator.addMethod(
			"userNameLength",
			function (value, element) {		
				var userNameRules = $("#userNameRules").val();
				if (isUndefined(userNameRules) || userNameRules.indexOf("userNameLength") == -1){
					return true;
				} else {				
					return this.optional(element) || 
						(value.length > 7 && value.length < 15) ;
				}
			},
			prependError(validationMessages['error.invalid.userNameLength'])
	 );
	 

	 $.validator.addMethod(
			"userNameDollarSign",
			function (value, element) {
				var userNameRules = $("#userNameRules").val();
				if (isUndefined(userNameRules) ||  userNameRules.indexOf("userNameDollarSign") == -1){
					return true;
				} else {				
					return this.optional(element) || value.indexOf("$") == -1;
				}
			},
			prependError(validationMessages['error.invalid.userNameDollarSign'])
	);	 
		 
	 
	 $.validator.addMethod(
				"passwordLength",
				function (value, element) {
					var passwordRules = $("#passwordRules").val();
					if (isUndefined(passwordRules) ||  passwordRules.indexOf("passwordLength") == -1){
						return true;
					} else {				
						return this.optional(element) || (value.length > 7 && value.length < 15);
					}
				},
				prependError(validationMessages['error.invalid.passwordLength'])
		);	 
	 
	 $.validator.addMethod(
			"passwordDollarSign",
			function (value, element) {
				var passwordRules = $("#passwordRules").val();
				if (isUndefined(passwordRules) ||  passwordRules.indexOf("passwordDollarSign") == -1){
					return true;
				} else {				
					return this.optional(element) || value.indexOf("$") == -1;
				}
			},
			prependError(validationMessages['error.invalid.passwordDollarSign'])
	);	 
	 
	 
	 $.validator.addMethod(
			"passwordUpperCase",
			function (value, element) {
				var passwordRules = $("#passwordRules").val();
				var pattern = /[A-Z]/;
				if (isUndefined(passwordRules) || passwordRules.indexOf("passwordUpperCase") == -1){
					return true;
				} else {				
					return this.optional(element) ||  pattern.test(value);
				}
			},
			prependError(validationMessages['error.invalid.passwordUpperCase'])
	);	 	
	 
	 $.validator.addMethod(
			"passwordLowerCase",
			function (value, element) {
				var passwordRules = $("#passwordRules").val();
				var pattern = /[a-z]/;
				if (isUndefined(passwordRules) || passwordRules.indexOf("passwordLowerCase") == -1){
					return true;
				} else {	
					return this.optional(element) || pattern.test(value);
			   }			    				
			},
			prependError(validationMessages['error.invalid.passwordLowerCase'])
	);	 		 
	 

	 $.validator.addMethod(
			"passwordUserName",
			function (value, element) {
				var username = $("#username").val(); 
				var passwordRules = $("#passwordRules").val();
				// Enforce this constraint only on the signup page (step 3 of signup)
				if (isUndefined(passwordRules) || passwordRules.indexOf("passwordUserName") == -1){
					return true;
				} else {
					return this.optional(element) || 
						value.toLowerCase().indexOf(username.toLowerCase()) == -1;					
				}
			},
			prependError(validationMessages['error.invalid.passwordUserName'])
	);	 			 
	 
	 
	 $.validator.addMethod(
			"passwordNumber",
			function (value, element) {
				var pattern = /\d/;
				var passwordRules = $("#passwordRules").val();
				if (isUndefined(passwordRules) || passwordRules.indexOf("passwordNumber") == -1){
					return true;
				} else {
					return this.optional(element) || pattern.test(value);
				}
			},
			prependError(validationMessages['error.invalid.passwordNumber'])
	);	 	
	 
	 
	 $.validator.addMethod(
			"passwordPassword",
			function (value, element) {
				var passwordRules = $("#passwordRules").val();
				if (isUndefined(passwordRules) || passwordRules.indexOf("passwordNumber") == -1){
					return true;
				} else {
					return this.optional(element) || value.toLowerCase().indexOf('password') == -1;					
				}
			},
			prependError(validationMessages['error.invalid.passwordPassword'])
	);	
	 
	 $.validator.addMethod(
			"passwordConsecutiveChars",
			function (value, element) {
				var passwordRules = $("#passwordRules").val();
				if (isUndefined(passwordRules) || passwordRules.indexOf("passwordNumber") == -1){
					return true;
				} else {
					return this.optional(element) || !hasTwoIdenticalConsecutiveChars(value);					
				}
			},
			prependError(validationMessages['error.invalid.passwordConsecutiveChars'])
	);		 
	 
	 $.validator.addMethod(
			"passwordConfirmationMatch",
			function (value, element) {
				var passwordRules = $("#passwordRules").val();
				if (isUndefined(passwordRules) || passwordRules.indexOf("passwordConfirmationMatch") == -1){
					return true;
				} else {
					return this.optional(element) || (value == $("#password").val() || value == $("#newPassword").val());
				}
			},
			prependError(validationMessages['error.invalid.passwordConfirmationMatch'])
	);		 	 
	 

	 // Added this to prevent a form with validation errors from being submitted in Firefox
	 // when the user presses Enter in an text field
	 $("form :input[type=text]").keypress(function(e){
		 if (e.which == 13){
			 e.preventDefault();
			 return false;
		 }		
	 });
	 
	  $("form").validate({
    	errorElement: "span",
    	onfocusout: false,
       	invalidHandler: function(event, validator){
 
        	var summary = validationMessages["error.popup.introduction"] + " \n\n";
        	$.each(validator.errorList, function(){	        		        		
        		summary += this.message + "\n";
        	}); 
        	
        	alert(summary);       		
        	
    	},   		
        errorPlacement: function (error, element) {    
             error.insertAfter(element);
        },
        ignore: [], // Set to empty array so that hidden fields get validated
        ignoreTitle: true,
        rules: {		        	
        	appReceiptNum: {
                required: true,
                validReceiptNumber: true
            },
            // The User Name input box has the name "username" on same pages
            // and "userId" on others. Therefore, the validation rules have to apply to both.
            username: {
            	required: function(){
            		var userNameRules = $("#userNameRules").val();
    				if (isUndefined(userNameRules) ||  userNameRules.indexOf("userNameRequired") == -1){
    					return false;
    				}  else {
    					return true;
    				}          		
            	},
            	userNameLength: true
            },
            userId: {
            	required: function(){
            		var userNameRules = $("#userNameRules").val();
            		if (isUndefined(userNameRules) ||  userNameRules.indexOf("userNameRequired") == -1){
    					return false;
    				}  else {
    					return true;
    				}  
            	},
            	userNameLength: true,
            	userNameDollarSign: true
            },            
            password:{
            	required: true,
            	passwordDollarSign: true,
            	passwordLowerCase: true,
            	passwordUpperCase: true,
            	passwordUserName: true,
            	passwordNumber: true,
            	passwordPassword: true,
            	passwordConsecutiveChars: true,
            	passwordLength: true
            },
            confirmPassword:{
            	required: true,
            	passwordConfirmationMatch: true
            },
            firstName:{required: true},
            lastName: {required: true},
            city: {required: true},
            state: {
                required: function() {                	
                	var country = 
                		$("#country :selected").text();
                	return (country == USA);               	
                }
            },   
            country:{required: true},
            zipCode: {
            	required: true,
            	validPostalCode: true
            },   
            email: {
            	required: true,
            	email: true
            },
            phone: {
            	required: false,
            	validMobilePhone: true
            },
            userSubType: {required: true},
            question1: {required: true},
            question2: {required: true},
            question3: {required: true},
            question4: {required: true},
            answer1: {required: true},
            answer2: {required: true},
            answer3: {required: true},
            answer4: {required: true},
            orgName: {required: true},
            orgType:  {required: true},
            answer: {required: true},            
            newPassword: {
            	required: true,
            	passwordDollarSign: true,
            	passwordLowerCase: true,
            	passwordUpperCase: true,
            	passwordUserName: true,
            	passwordNumber: true,
            	passwordPassword: true,
            	passwordConsecutiveChars: true,
            	passwordLength: true
            }          
        },
        messages: {
        	appReceiptNum: {required: prependError(validationMessages['error.empty.receiptnumber'])},
            username: {required: prependError(validationMessages['error.empty.username'])},
            userId: {required: prependError(validationMessages['error.empty.username'])},            
            password: {required: prependError(validationMessages['error.empty.password'])},
            confirmPassword: {required: prependError(validationMessages['error.empty.passwordconfirmation'])},            
            firstName: {required: prependError(validationMessages['error.empty.firstname'])},
            lastName: {required: prependError(validationMessages['error.empty.lastname'])},    
            city: {required: prependError(validationMessages['error.empty.city'])}, 
            state: {required: prependError(validationMessages['error.empty.state'])},   
            country: {required: prependError(validationMessages['error.empty.country'])},   
            zipCode: {required: prependError(validationMessages['error.empty.postalcode'])},   
            email: {
            	 required: prependError(validationMessages['error.empty.email']),
            	 email:prependError(validationMessages['error.invalid.email'])
            },
            userSubType: {required: prependError(validationMessages['error.empty.userSubType'])},
            question1: {required: prependError(validationMessages['error.empty.passwordhintquestion1'])},
            question2: {required: prependError(validationMessages['error.empty.passwordhintquestion2'])},
            question3: {required: prependError(validationMessages['error.empty.passwordhintquestion3'])},
            question4: {required: prependError(validationMessages['error.empty.passwordhintquestion4'])},
            answer1:  {required: prependError(validationMessages['error.empty.passwordhintanswer1'])},
            answer2: {required: prependError(validationMessages['error.empty.passwordhintanswer2'])},
            answer3: {required: prependError(validationMessages['error.empty.passwordhintanswer3'])},
            answer4: {required: prependError(validationMessages['error.empty.passwordhintanswer4'])},
            orgName: {required:  prependError(validationMessages['error.empty.organizationName'])},
            orgType:  {required:  prependError(validationMessages['error.empty.organizationType'])},
            answer: {required: prependError(validationMessages['error.empty.passwordhintanswer'])},
            newPassword: {required:  prependError(validationMessages['error.empty.password'])}
        },
        submitHandler: function(form) {       
        	form.submit();
        }   
    });
	
	  
    /* helper text */
    $( '#receiptNumberHelperAnchor' ).click(function() {
    	alertBox.title= "";
    	alertBox.open( receiptNumberHelperText );
        return false;
    });
    $( '#passwordReqHelperAnchor' ).click(function() {
    	alertBox.title= passwordHelpTitle;
    	alertBox.open( passwordReqHelperText );
        return false;
    });
    $( '#usernameReqHelperAnchor' ).click(function() {
    	alertBox.title= userNameHelpTitle;
    	alertBox.open( usernameReqHelperText );
        return false;
    });

    // completed
    $('#prevHistPageBtn').click(function() {
    	currentHistPage = (currentHistPage > 0) ? currentHistPage-1 : currentHistPage;
    	$('#completedActionsCurrentPage').val(currentHistPage);
    	page.setCompletedActionsArea();
    	return false;
    });
    
    $('#nextHistPageBtn').click(function() {
    	currentHistPage = (currentHistPage < totalHistPages-1) ? currentHistPage+1 : currentHistPage;
    	$('#completedActionsCurrentPage').val(currentHistPage);
    	page.setCompletedActionsArea();
    	return false;
    });

    // upcoming
    $('#prevUpcomePageBtn').click(function() {
    	currentUpcomePage = (currentUpcomePage > 0) ? currentUpcomePage-1 : currentUpcomePage;
    	$('#upcomingActionsCurrentPage').val(currentUpcomePage);
    	page.setUpcomingActionsArea();
    	return false;
    });
    
    $('#nextUpcomePageBtn').click(function() {
    	currentUpcomePage = (currentUpcomePage < totalUpcomePages-1) ? currentUpcomePage+1 : currentUpcomePage;
    	$('#upcomingActionsCurrentPage').val(currentUpcomePage);
    	page.setUpcomingActionsArea();
    	return false;
    });

    // security question option tags dynamic rendering
    $('#question1').change(function(){
    	userSecQAPick[1] = $('#question1').val();
    	page.setSecQuestionsOptions( 1 );
    });
    $('#question2').change(function(){
    	userSecQAPick[2] = $('#question2').val();
    	page.setSecQuestionsOptions( 2 );
    });
    $('#question3').change(function(){
    	userSecQAPick[3] = $('#question3').val();
    	page.setSecQuestionsOptions( 3 );
    });
    $('#question4').change(function(){
    	userSecQAPick[4] = $('#question4').val();
    	page.setSecQuestionsOptions( 4 );
    }); 
    
    $("#systemWarningLink").click(function () {
    
    	var systemSecurityConfirm = new alertDialog( 
			{my:'left+40 top-200', at:'center-200', of:window,					
				collision:'flip'						
			}, 
			'55%',  systemSecurityTitle, "popupDialogArea", 
			okButtonCaption, 
			function(){ return true; },  closeButtonCaption				 
		);	
		systemSecurityConfirm.open( systemSecurityWarning );         	
        return false;
     });
        
    
    $("#privacyStatementsAnchor").click(function () {
    	alertBox.title= privacyActTitle;
        alertBox.open( privacyStatementsContentsJS );
        return false;
     });

	// prevent existing users to access profile or portfolio until they updated security Q and A
	$('.noActionUntilSecQAUpdated').click(function(e){
	    e.preventDefault();
	});
	
	
	$('#changeLocaleAnchor').click(function() {
		if (existsInDom($('#changeLocale'))){
			$('#changeLocale').val(changeLangTo);
		}		
		var receiptExistsinDom = existsInDom($('#receipt_number'));
		var appReceiptNumDefined = !isUndefined(appReceiptNum);
		if (receiptExistsinDom  && appReceiptNumDefined ){
			$('#receipt_number').val(appReceiptNum);
		}	
		if (existsInDom($('form'))){
			$("form").validate().cancelSubmit = true;
			$("form").submit();
		} else {
			var tmpA = document.createElement('a'); 
			tmpA.href = document.URL; 
			var pathName = tmpA.pathname; 
			var myuscis = 'casestatus/';
			var myuscisAt = (pathName.toLowerCase()).lastIndexOf(myuscis);
			var dotDo = (pathName.toLowerCase()).lastIndexOf('.do'); 
			var path = pathName.substring( myuscisAt + myuscis.length, dotDo ); 			
			var newUrl = (tmpA.href).replace(path,"changeLocale") + "?localeLang=" + changeLangTo + "&path=" + path;
			window.location.replace( newUrl );
		}
		return false;
	});	
	
	
});

function existsInDom(object){
	if (object.length > 0){
		return true;
	}
	return false;
};

page = {
	init : function(){	
		this.setPageTitle();
		if( existsInDom($j('#completedActionListDiv')) ) { 
			this.setCompletedActionsArea();
		}
		if(  existsInDom($j('#upcomingActionListDiv'))) { 
			this.setUpcomingActionsArea();
		}
		if(existsInDom($j('#question1')) && !(typeof allSecQuestions === "undefined") && Object.size(allSecQuestions) > 0 ) {
			for(var i = 1; i <= totalSecQAEachUser; i++) {
				userSecQAPick[i] = ( $j('#question' + i).val() ) ? $j('#question' + i).val() : 0;
			}
			this.setSecQuestionsOptions( 0 );
		}
		// set up pagination current page numbers if these values available in the hidden fields
		if($j('#completedActionsCurrentPage') != null && $j('#completedActionsCurrentPage').value != '' ) {
			currentHistPage = parseInt( $j('#completedActionsCurrentPage').val() ); 
		}
		if($j('#upcomingActionsCurrentPage') != null && $j('#upcomingActionsCurrentPage').value != '' ) { 
			currentUpcomePage = parseInt( $j('#upcomingActionsCurrentPage').val() ); 
		}
		if($j('#changeLocale') != null ){ 
			$j('#changeLocale').val( null ); 
		}		
		
		this.setState();		
		this.displayServerSideErrors();
	},
	serverSideErrorFound: function(){			
		errorRegion = $j("#formErrorMessages").html();
		// The content of the  Error region (div with Id formErrorMessages) is null in IE when there are no errors, 
		// but in Firefox the length of this area is greater than zero (8 spaces) when there are no errors.
		//Therefore to determine whether there are any server side errors we need to check for two conditions:
		// the area being null for IE or the length of the area after being trimmed being zero for Firefox
		// Be aware that the Javascript function trim() doesn't work in IE 8. I (Leila) had to use the jquery function $.trim()
		// to trim the content of the error area.
		if (!errorRegion){ // Error region is null/undefined in IE when no errors
			return false;
		} else if ( $j.trim($j("#formErrorMessages").html()).length == 0 ){	// For Firefox when there is no error
			return false;
		}
		return true;	
	},
	setInitFocus: function(){
		this.setFocus('.initial-focus');
	},
	scrollTo: function(objectId){
		$j('body').scrollTo("#" + objectId);
	},
	setFocus: function(selector){
		$j(selector).focus();
	},
	setPageTitle: function(){
	   if (typeof pageTitle !== "undefined"){
		   document.title = appName + ' - ' + pageTitle;
	   }
	},	
	disableArea : function(area){
		$j("#" + area).prop("disabled", true);
	},
	enableArea : function(area){
		$j("#" + area).prop("disabled", false);
	},
	setState: function(){
		var country = $j.trim($j("#country :selected").text());
		if (country == USA) {
        	this.enableArea("state");          	
        } else {
        	$j('#state').val("");
        	this.disableArea("state");
        }		
	},
	setCompletedActionsArea:function() {
		var markup = '<ul>';
		for (var i = actionsPerPage * currentHistPage; 
			i < actionsPerPage * (currentHistPage + 1) && i < completedActionListSize; i++) { 
				markup += '<li>' +
					'<div class="date-sec">' +
					'<span class="date-sec span">' + completedActionListDate[i] + '</span>' +
					'<br/>' +
					'<span class="mt10" ><img src="' + imgCheckmark + '" alt=""/></span>' +
					'</div>' +
					'<div class="contant-sec">' +
					'<p class="search-status-list ul li contant-sec p">' +
					completedActionListText[i] + 
					'</p>' +
					'</div>' +
					'</li>';
		}
		markup += '</ul>';
		$j('#completedActionListDiv').html( markup );
		var d = document.getElementById("completedActionListDiv");
		d.className = d.className + 
			" .search-status-list" +
			" .search-status-list ul" +
			" .search-status-list ul li" +
			" .search-status-list ul li .date-sec" +
			" .search-status-list ul li .date-sec span" +
			" .search-status-list ul li .date-sec span.red" +
			" .search-status-list ul li .contant-sec" +
			" .search-status-list ul li .contant-sec p" +
			" .search-status-list ul li .contant-sec a" 
			;
		var tempPageNum = (currentHistPage + 1) / 1; 
		markup = '<i>' + tempPageNum + '</i>';
		$j('#currentPageNumInHist').html( markup );
		markup = '<i>' + totalHistPages + '</i>';
		$j('#totalPageNumInHist').html( markup );
	},  
	setUpcomingActionsArea:function() {
		var markup = '<ul>';
		for (var i = actionsPerPage * currentUpcomePage; 
			i < actionsPerPage * (currentUpcomePage + 1) && i < upcomingActionListSize; i++) { 
				markup += '<li>' +
					'<div class="date-sec">' + (
					(currentUpcomePage == 0 && i == 0) ? 
					'<span class="date-sec span mt10"><img src="' + imgTorchMark + '" alt="' + imgTorchAlt + '"/></span>' :
					'<span class="date-sec span"><img src="' + imgDownArrow + '" alt="' + imgDownArrowAlt + '"/>' + upcomingActionListDate[i] + '</span>') +
					'<br/>' +
					'<span class="mt10"></span>' +
					'</div>' +
					'<div class="contant-sec">' +
					'<p class="search-status-list ul li contant-sec p upcoming">' +
					upcomingActionListText[i] + 
					'</p>' +
					'</div>' +
					'</li>';
		}
		markup += '</ul>';
		$j('#upcomingActionListDiv').html( markup );
		var d = document.getElementById("upcomingActionListDiv");
		d.className = d.className + 
			" .search-status-list" +
			" .search-status-list ul" +
			" .search-status-list ul li" +
			" .search-status-list ul li .date-sec" +
			" .search-status-list ul li .date-sec span" +
			" .search-status-list ul li .date-sec span.red" +
			" .search-status-list ul li .contant-sec" +
			" .search-status-list ul li .contant-sec p" +
			" .search-status-list ul li .contant-sec p.upcoming" +
			" .search-status-list ul li .contant-sec a"
			;
		var tempPageNum = (currentUpcomePage + 1) / 1; 
		markup = '<i>' + tempPageNum + '</i>';
		$j('#currentPageNumInUpcome').html( markup );
		markup = '<i>' + totalUpcomePages + '</i>';
		$j('#totalPageNumInUpcome').html( markup );
	},  
	setSecQuestionsOptions: function( activeCtrlIdx ) {
	      userSecQAPick[activeCtrlIdx] = (activeCtrlIdx) ? $j('#question' + activeCtrlIdx).val() : 0;
		  for( var targetCtrlIdx = 1; targetCtrlIdx <= totalSecQAEachUser; targetCtrlIdx++ ) {
	        var htmlStr = '<option value="">' + htmlDropdownDefaultStr;
	        for( var key in allSecQuestions ) {
	          var skip = false;
	          for( var checkCtrlIdx = 1; checkCtrlIdx <= totalSecQAEachUser; checkCtrlIdx++ ) {
	            if( userSecQAPick[checkCtrlIdx] == key ) {
	            	skip = (targetCtrlIdx == checkCtrlIdx) ? skip : true;
	            }        	  
	          }
	          htmlStr += (skip) ? '' : '</option>\n<option value="' + key + '">' + allSecQuestions[key];
	        }
	        htmlStr += '</option>';
	        $j('#question'+targetCtrlIdx).html( htmlStr );
	        if( userSecQAPick[targetCtrlIdx] ) {
	          $j('#question'+targetCtrlIdx).val( userSecQAPick[targetCtrlIdx] );
	        }
		  }
		},

	displayServerSideErrors: function(){
		if (this.serverSideErrorFound()){
			var serverSideErrorBox = new alertDialog( 
				{my:'top 700', at:'center', of:window, collision:'flip'}, 
				'83%', '', "popupDialogArea", 
				okButtonCaption,  	
				function(){page.setInitFocus(); }, 
				closeButtonCaption
		    );	 
			serverSideErrorBox.open($j("#formErrorMessages").html());
		} 
	},
	submit: function(){
		$j("form").submit();	
	}

};


function caseInfo( caseSelected, receiptNumber, trackingNumber, lastUpdated, formNumber, eMailAlertOn, smsAlertOn ) {
    this.caseSelected = caseSelected;
    this.receiptNumber = receiptNumber;
    this.trackingNumber = trackingNumber;
    this.lastUpdated = lastUpdated;
    this.formNumber = formNumber;
    this.eMailAlertOn = eMailAlertOn;
    this.smsAlertOn = smsAlertOn;
    return this;
};

