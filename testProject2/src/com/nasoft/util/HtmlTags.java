package com.nasoft.util;

/**
 * html标签
 * @author xt
 */

public class HtmlTags {

	
	public static String getHtmlTags(String url,String index,boolean next,boolean previous){
		
		String tags = null;
		if(next){
			
			if(next&&previous){
				tags= "<td colspan= 15 align=center>" +
					  "<a href ="+url+(Integer.parseInt(index)-1)+">上一页</a>" +
					  "<a href ="+url+(Integer.parseInt(index)+1)+">下一页</a>" +
					  "</td>";
				return tags;
			}
			//有下一页没有上一页
			if(previous){
				tags= "<td colspan= 15 align=center>" +
				  "首页" +
				  "<a href ="+url+(Integer.parseInt(index)+1)+">下一页</a>" +
				  "</td>";
				return tags;
			}
			
			
		}else if(previous){
			//有上一页没有下一页
			if(!next&&previous){
				tags= "<td colspan= 15 align=center>" +
				"末页" +
				"<a href ="+url+(Integer.parseInt(index)-1)+">上一页</a>" +
				"</td>";
				return tags;
			}
			
		}else if(!next&&!previous){
			//没有上一页和下一页
			tags= "<td colspan =11 align=center>本页</td>";
			return tags;
			
		}
		
		return tags;
	}
	
}
