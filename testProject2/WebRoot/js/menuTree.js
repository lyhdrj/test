/*
 * Tooltip script 
 * powered by jQuery (http://www.jquery.com)
 * 
 * written by Alen Grakalic (http://cssglobe.com)
 * 
 * for more info visit http://cssglobe.com/post/1695/easiest-tooltip-and-image-preview-using-jquery
 *
 */
 


this.tooltip = function(){	
	/* CONFIG */		
		xOffset = 30;
		yOffset = 20;		
		// these 2 variable determine popup's distance from the cursor
		// you might want to adjust to get the right result		
	/* END CONFIG */		
	$("a.node").hover(function(e){									  
		this.t = this.title;
		this.title = "";									  
		$("body").append("<p id='node'>"+ this.t +"</p>");
		$("#node")
			.css("top",(e.pageY - xOffset) + "px")
			.css("left",(50 + yOffset) + "px")
			.fadeIn("fast");		
    },
	function(){
		this.title = this.t;		
		$("#node").remove();
    });	
	$("a.node").mousemove(function(e){
		$("#node")
			.css("top",(e.pageY - xOffset) + "px")
			.css("left",(50 + yOffset) + "px");
	});			
};



// starting the script on page load
$(document).ready(function(){
	tooltip();
});