(function($){

 	$.fn.extend({

		//pass the options variable to the function
 		cckwTTS: function(options) {


			//Set the default values, use comma to separate the settings, example:
			var defaults = {
				selector: 'body'
			}

			var options =  $.extend(defaults, options);

    		return this.each(function() {
				var o = options;

				//create the hidden iframe for precache
			  	$(this).attr('cckwTTSSelector',o.selector);
						  if( $( $(this).attr('cckwTTSSelector') ).val() ){
						  	$(this).attr('cckwTTSTEXT',escape( $( $(this).attr('cckwTTSSelector') ).val()));
						  }else{
						  	 $(this).attr('cckwTTSTEXT',escape( $( $(this).attr('cckwTTSSelector') ).text()));
						  }

				  $('<iframe id="cckwTTS" name="cckwTTS" style="width:0px; height:0px; border: 0px" src="http://translate.google.com/translate_tts?tl=pt&q='+$(this).attr('cckwTTSTEXT')+'"></iframe>').appendTo('body');

				  $(this).click(function(){
						  if( $( $(this).attr('cckwTTSSelector') ).val() ){
						  	$(this).attr('cckwTTSTEXT',escape( $( $(this).attr('cckwTTSSelector') ).val()));
						  }else{
						  	 $(this).attr('cckwTTSTEXT',escape( $( $(this).attr('cckwTTSSelector') ).text()));
						  }

						$('#cckw_rm').remove();
						
						
						$('<iframe id="cckwTTS" name="cckwTTS" style="width:0px; height:0px; border: 0px" src="http://translate.google.com/translate_tts?tl=pt&q='+$(this).attr('cckwTTSTEXT')+'"></iframe>').appendTo('body');
						
						$('#cckw_rm').css("height","1px");
						$('#cckw_rm').css("width","1px");

						return false;
				  });
				  

    		});
    	}
	});

})(jQuery);