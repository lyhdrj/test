package com.nasoft.util;

/**
 * html��ǩ
 * @author xt
 */

public class HtmlTags {

	
	public static String getHtmlTags(String url,String index,boolean next,boolean previous){
		
		String tags = null;
		if(next){
			
			if(next&&previous){
				tags= "<td colspan= 15 align=center>" +
					  "<a href ="+url+(Integer.parseInt(index)-1)+">��һҳ</a>" +
					  "<a href ="+url+(Integer.parseInt(index)+1)+">��һҳ</a>" +
					  "</td>";
				return tags;
			}
			//����һҳû����һҳ
			if(previous){
				tags= "<td colspan= 15 align=center>" +
				  "��ҳ" +
				  "<a href ="+url+(Integer.parseInt(index)+1)+">��һҳ</a>" +
				  "</td>";
				return tags;
			}
			
			
		}else if(previous){
			//����һҳû����һҳ
			if(!next&&previous){
				tags= "<td colspan= 15 align=center>" +
				"ĩҳ" +
				"<a href ="+url+(Integer.parseInt(index)-1)+">��һҳ</a>" +
				"</td>";
				return tags;
			}
			
		}else if(!next&&!previous){
			//û����һҳ����һҳ
			tags= "<td colspan =11 align=center>��ҳ</td>";
			return tags;
			
		}
		
		return tags;
	}
	
}
