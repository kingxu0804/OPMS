/**
 * 
 */
package com.opms.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.opms.entity.PmsUsers;

/**
 * description:
 * @author liyanpeng
 * @date 2017年8月11日
 */
public class ReLoginFilter implements Filter{

	/**
	 * description:
	 * @author liyanpeng
	 * @date 2017年8月11日
	 */
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	/**
	 * description:
	 * @author liyanpeng
	 * @date 2017年8月11日
	 */
	@Override
public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)arg0;
		HttpServletResponse response=(HttpServletResponse)arg1;
		StringBuffer url=request.getRequestURL();
		String action=url.substring(url.lastIndexOf("/")+1);
		HttpSession session=request.getSession();
		PmsUsers sessionuser=(PmsUsers) session.getAttribute("user");
		if(url.lastIndexOf(".")<0){
			if(!"tologin".equals(action)&&!"signin".equals(action)&&sessionuser==null){
				response.sendRedirect("tologin");
			}else
				chain.doFilter(arg0, arg1);
		}else
			chain.doFilter(arg0, arg1);
	}

	/**
	 * description:
	 * @author liyanpeng
	 * @date 2017年8月11日
	 */
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
}
