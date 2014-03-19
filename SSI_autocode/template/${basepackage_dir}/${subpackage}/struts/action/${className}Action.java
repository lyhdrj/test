<#assign className = table.className>   
<#assign classNameLower = table.classNameFirstLower> 
package ${basepackage}.${subpackage}.struts.action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.nasoft.base.BaseAction;
import com.nasoft.baseinfo.model.BaseInfoBean;
import com.nasoft.baseinfo.service.IBaseInfoService;
import com.nasoft.sysmanage.model.PageBean;
import com.opensymphony.xwork2.ModelDriven;
import ${basepackage}.${subpackage}.service.I${className}Service;
import ${basepackage}.${subpackage}.struts.vo.${className}VO;
import ${basepackage}.util.ErrorUtil;



@Controller("${classNameLower}Manage")
@Scope("prototype")
public class ${className}Action extends BaseAction implements ModelDriven<${className}VO>{
	@Autowired
	private I${className}Service ${classNameLower}Service;
	private ${className}VO ${classNameLower}VO = new ${className}VO();
	private String page;
	private String rows;
	
//查询
	public String query${className}() {
		try{
			pageBean=new PageBean();
	        pageBean.setMaxResult(new Integer(rows));
			pageBean.setCurrentPage(new Integer(page));
			int count = ${classNameLower}Service.query${className}Count(${classNameLower}VO);
			pageBean.setTotalCount(count);
			List<${className}VO> ${classNameLower}sList=${classNameLower}Service.query${className}(${classNameLower}VO,pageBean);
			Map jsonMap=new HashMap();
			jsonMap.put("total", count);
			jsonMap.put("rows", ${classNameLower}sList);
			setJsonResult(JSONObject.fromObject(jsonMap));
		}catch(Exception e){
			e.printStackTrace();
			String errorMessage = "在执行${className}Action类中的query${className}方法时出错：" + e.getMessage();
			log.error(errorMessage);
			return ERROR;
		}
		return JSON_RESULT;
	}
	
	public String delete${className}() {
		try{
			${classNameLower}Service.delete${className}(getArrs());
			setJsonResult(JSONObject.fromObject("{'success':'操作成功!'}"));		
		}catch(Exception e){
			String errorMessage = "在执行${className}Action类中的delete${className}方法时出错：" + e.getMessage();
			log.error(errorMessage);
			setJsonResult(JSONObject.fromObject(("{'errorMsg':'操作失败!'}")));
		}
		return JSON_RESULT;
	}
	public String add${className}(){
		PrintWriter out= null;
		String errorMsg="";
		try{
		 errorMsg=new String("{'errorMsg':'操作失败!'}".getBytes("gbk"),"iso8859-1");
		 out=response.getWriter();
		 ${classNameLower}Service.add${className}(${classNameLower}VO);
		 out.write(new String("{'msg':'操作成功!'}".getBytes("UTF-8"),"iso8859-1"));
		}catch(Exception e){
			String errorMessage = "在执行${className}Action类中的add${className}方法时出错：" + e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage",errorMessage);
			out.write(errorMsg);
		}
		return NONE;
	}
	
		
	
	public String update${className}(){
		PrintWriter out= null;
		String errorMsg="";
		try{
			errorMsg=new String("{'errorMsg':'操作失败!'}".getBytes("gbk"),"iso8859-1");
			out=response.getWriter();
			${classNameLower}Service.update${className}(${classNameLower}VO);
			 out.print(new String("{'msg':'操作成功!'}".getBytes("UTF-8"),"iso8859-1"));
		}catch(Exception e){
			String errorMessage = "在执行${className}Action类中的update${className}方法时出错：" + e.getMessage();
			log.error(errorMessage);
			out.write(errorMsg);
		}
		return NONE;
	}
	public String initUI(){
		return "init";
	}
	
	public ${className}VO getModel() {
		return ${classNameLower}VO;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getRows() {
		return rows;
	}
	public void setRows(String rows) {
		this.rows = rows;
	}
}
