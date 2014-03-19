package com.nasoft.baseinfo.struts.action;

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
@Controller("baseInfoAction")
@Scope("prototype")
public class BaseInfoAct extends BaseAction implements ModelDriven<BaseInfoBean>{
	private BaseInfoBean baseInfoBean=new BaseInfoBean();
	@Autowired
	private IBaseInfoService baseInfoService;
	//@Autowired
	//private ReportService reportService;
	private String page;
	private String rows;
	
	public BaseInfoBean getModel() {
		return baseInfoBean;
	}
	//保存
	public String save(){
		PrintWriter out= null;
		String errorMsg="";
		try{
		 errorMsg=new String("{'errorMsg':'操作失败!'}".getBytes("gbk"),"iso8859-1");
		 out=response.getWriter();
		 baseInfoService.addBaseInfo(baseInfoBean);
		 out.write(new String("{'msg':'操作成功!'}".getBytes("UTF-8"),"iso8859-1"));
		}catch(Exception e){
			String errorMessage = "在执行BaseInfoAction类中的query方法时出错：" + e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage",errorMessage);
			out.write(errorMsg);
		}
		return NONE;
	}
	
	//更新
	public String update(){
		PrintWriter out= null;
		String errorMsg="";
		try{
			errorMsg=new String("{'errorMsg':'操作失败!'}".getBytes("gbk"),"iso8859-1");
			out=response.getWriter();
				baseInfoService.updateBaseInfo(baseInfoBean);
			//response.setCharacterEncoding("utf-8");
			//response.setContentType("text/html;charset=utf-8");
			 out.print(new String("{'msg':'操作成功!'}".getBytes("UTF-8"),"iso8859-1"));
		}catch(Exception e){
			String errorMessage = "在执行BaseInfoAction类中的query方法时出错：" + e.getMessage();
			log.error(errorMessage);
			out.write(errorMsg);
		}
		return NONE;
	}
	
	//删除
	public String del(){
		try{
		    baseInfoService.deleteBaseInfo(getArrs());
			setJsonResult(JSONObject.fromObject("{'success':'操作成功!'}"));
		}catch(Exception e){
			String errorMessage = "在执行BaseInfoAction类中的query方法时出错：" + e.getMessage();
			log.error(errorMessage);
			setJsonResult(JSONObject.fromObject(("{'errorMsg':'操作失败!'}")));
		}
		return JSON_RESULT;
	}


	/***
	 * output JSON数据格式
	 * @return Stirng
	 * {"total":"8","rows":[{"id":"25594","firstname":"111","lastname":"111","phone":"","email":""},{"id":"25595","firstname":"111","lastname":"111","phone":"","email":""},{"id":"25596","firstname":"111","lastname":"111","phone":"","email":""},{"id":"25597","firstname":"111","lastname":"111","phone":"","email":""},{"id":"25602","firstname":"dewdsd","lastname":"adasd","phone":"asdad","email":"aaaa@hh.com"},{"id":"25603","firstname":"dewdsd","lastname":"adasd","phone":"asdad","email":"aaaa@hh.com"},{"id":"25604","firstname":"asdsad","lastname":"asdasdadad","phone":"asda","email":"aaaa@hh.com"},{"id":"25609","firstname":"df","lastname":"sdfa","phone":"asdfa","email":"asdf@126.cim"}]}
	 */
	public String list(){
		try{
	        pageBean=new PageBean();
	        pageBean.setMaxResult(new Integer(rows));
			pageBean.setCurrentPage(new Integer(page));
			int count = baseInfoService.queryBaseInfoCount(baseInfoBean);
			pageBean.setTotalCount(count);
			List<BaseInfoBean> baseInfosList=baseInfoService.queryBaseInfo(baseInfoBean,pageBean);
			Map jsonMap=new HashMap();
			jsonMap.put("total", count);
			jsonMap.put("rows", baseInfosList);
			setJsonResult(JSONObject.fromObject(jsonMap));
			//response.setContentType("text/html;charset=utf-8");
			//response.setCharacterEncoding("utf-8");
			// out=	response.getWriter();
			//out.print(getJsonResult().toString());
			//System.out.println(getJsonResult().toString());
		}catch(Exception e){
			e.printStackTrace();
			String errorMessage = "在执行BaseInfoAction类中的query方法时出错：" + e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage",errorMessage);
			return ERROR;
		}
		return JSON_RESULT;
	}
	
	public String initUI(){
		return "init";
	}
	public String init(){
		return "init2";
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
