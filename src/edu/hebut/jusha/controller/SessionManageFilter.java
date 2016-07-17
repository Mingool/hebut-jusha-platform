package edu.hebut.jusha.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import edu.hebut.jusha.dao.HibernateUtils;

public class SessionManageFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		System.out.println("我执行了doFilter方法." + " Thread_ID="
				+ Thread.currentThread().getId());
		chain.doFilter(request, response);
		// 关闭此次线程的session
		HibernateUtils.closeThreadSession();
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
