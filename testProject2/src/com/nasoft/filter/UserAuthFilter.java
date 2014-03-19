package com.nasoft.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nasoft.sysmanage.model.MenuBean;

/**
 * @author :david ����ʱ�䣺Jul 31, 2008 8:08:51 AM ��˵��
 */

public class UserAuthFilter implements Filter {
	private String encode;

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws ServletException, IOException {
		HttpServletRequest req = (HttpServletRequest) request;

		try {
			if (encode == null) {
				req.setCharacterEncoding("GBK");
			} else {
				req.setCharacterEncoding(encode);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String webroot = req.getContextPath();
		String actionUrl = req.getRequestURI();
		String actionDo = "";
		// ���session����
		HttpSession session = ((HttpServletRequest) request).getSession();
		try {
			// ���session
			if (actionUrl.indexOf("roleManage.jsp") == -1
					&& session.getAttribute("userlogin") == null) {
				// ����ҳ����ת
				((HttpServletResponse) response)
						.sendRedirect(webroot + "/error/sessionFailed.jsp");

			} else {
				MenuBean menuBean;
				String menuFun;
				List menuList = (List) session.getAttribute("menuList");
				if (menuList != null) {
					for (int i = 0; i < menuList.size(); i++) {
						menuBean = (MenuBean) menuList.get(i);
						menuFun = menuBean.getMenuFunc();
						if (menuFun != null) {
							if (menuFun.indexOf(actionDo) != -1) {
								chain.doFilter(request, response);
								return;
							}
						}
					}
					((HttpServletResponse) response)
							.sendRedirect(webroot + "/error/menuFailed.jsp");
				} else {
					((HttpServletResponse) response)
							.sendRedirect(webroot + "/error/sessionFailed.jsp");
				}
				// ��session���������ȷ����request��response
				chain.doFilter(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	public void init(FilterConfig config) throws ServletException {
		encode = config.getInitParameter("encoding");
	}

	public void destroy() {

	}
}