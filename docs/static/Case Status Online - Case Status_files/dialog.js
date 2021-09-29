
// This is a customized JQuery dialog that is similar to JavaScript alert.
function alertDialog(position, boxWidth, title, targetElementId, okBtn, okCallBack, closeBtnCaption){
	this.position = position;
	this.boxWidth = boxWidth,
	this.targetElementId = targetElementId;
	this.okBtn = okBtn;
	this.title = title;
	this.closeBtnCaption = closeBtnCaption;
	this.open = function (markup) {
		 $j('#' + this.targetElementId).dialog({
	        width: this.boxWidth,
	        height: 'auto',
	        position: this.position,
	        modal : true,
	        draggable: false,
	        title: this.title,
	        closeText:this.closeBtnCaption, 
	        dialogClass: 'no-close',
	        open: function () {
	        	 $j(this).html(markup);
	        },
	        buttons :[
	          { text: this.okBtn,
	            click: function(){	
	            	 $j(this).dialog("close");
	                     var callbacks =  $j.Callbacks();
	                     callbacks.add(okCallBack);
	                     callbacks.fire();				 			
	                   }
	          }
	        ]
		});			
	}
}


//This is a customized JQuery dialog that is similar to JavaScript confirm.
function confirmDialog(position, boxWidth, title, targetElementId, okBtn, okCallBack, cancelBtn, cancelCallBack, closeBtnCaption){
	this.position = position;
	this.boxWidth = boxWidth,
	this.targetElementId = targetElementId;
	this.okBtn = okBtn;
	this.cancelBtn = cancelBtn;
	this.title = title;
	this.closeBtnCaption = closeBtnCaption;
	this.open = function (markup) {
		$j('#' + this.targetElementId).dialog({
	        width: this.boxWidth,
	        height: 'auto',
	        position: this.position,
	        modal : true,
	        draggable: false,
	        title: this.title,
	        closeText:this.closeBtnCaption, 
	        dialogClass: 'no-close',
	        open: function () {
	        	 $j(this).html(markup);
	        },
	        buttons :[
  				{ text: this.okBtn,
  				  click: function(){	
  					 $j(this).dialog("close");
  					 var callbacks = $j.Callbacks();
  					 callbacks.add(okCallBack);
  					 callbacks.fire();				 			
  				  }
  				},
  				{ text: this.cancelBtn,
  				  click: function() {
  					 $j(this).dialog("close");
  					 var callbacks = $j.Callbacks();
  					 callbacks.add(cancelCallBack);
  					 callbacks.fire();						  
  				  }			  
  				}	
  			]		
		});	
	}
}


