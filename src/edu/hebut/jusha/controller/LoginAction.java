package edu.hebut.jusha.controller;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import edu.hebut.jusha.pojo.User;
import edu.hebut.jusha.service.impl.RegistCallBack;
import edu.hebut.jusha.service.impl.UserServiceImpl;

public class LoginAction extends ActionSupport {

	private Boolean flag;
	private User user;
	private String message;

	private UserServiceImpl userServiceImpl = new UserServiceImpl();

	public String login() throws Exception {
		// TODO Auto-generated method stub
		User us = userServiceImpl.login(user);
		if (us != null) {
			this.flag = true;
			ActionContext.getContext().getSession().put("user", us);
		} else
			flag = false;
		message = "用户名或密码错误.";
		return SUCCESS;
	}

	public String regist() throws Exception {
		userServiceImpl.regist(user, new RegistCallBack() {

			public void onSuccess(User user) {
				flag = true;
			}

			public void onFailed(User user, List<String> errorList) {
				flag = false;
				message = errorList.toString();
			}
		});
		return SUCCESS;

	}

	public String logout() throws Exception {
		ActionContext.getContext().getSession().remove("user");
		return SUCCESS;
	}

	public Boolean getFlag() {
		return flag;
	}

	public void setFlag(Boolean flag) {
		this.flag = flag;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
