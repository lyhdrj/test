function IFrameResize(){    
           		var defaultHeight = top.document.body.clientHeight;
		   		defaultHeight = defaultHeight - 118 - 10 - 20 - 2;
		   		if (defaultHeight < 400)
		   			defaultHeight = 400;
		   			
           		var tmpHeight = document.body.scrollHeight;
           		if (tmpHeight < defaultHeight)
           			tmpHeight = defaultHeight;
           			
 				var obj = parent.document.getElementById("main");
 				
 				if (obj == null) 
 					return;
 				
 				if (this.document.body.scrollHeight < tmpHeight) 
				 	obj.height = tmpHeight;
				else {					 
					 obj.height = this.document.body.scrollHeight;
				}
		   }