package edu.hebut.jusha.controller;

import java.util.List;
import java.util.Set;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import edu.hebut.jusha.pojo.Appointment;
import edu.hebut.jusha.pojo.Demands;
import edu.hebut.jusha.pojo.User;
import edu.hebut.jusha.service.impl.DemandsServiceImpl;
import edu.hebut.jusha.service.impl.UserServiceImpl;

public class AdminAction extends ActionSupport {
	
	private DemandsServiceImpl demandsService = new DemandsServiceImpl();
	private UserServiceImpl userServiceImpl = new UserServiceImpl();

	/**
	 * 
	 * @return
	 */
	public String showAdminPage() {
		// 判断是否有登陆权限
		User user = (User) ActionContext.getContext().getSession().get("user");
		if (user == null)
			return "error";
		// 查询需求列表
		List<Demands> demandsList = demandsService.getAllDemands();
		// 查询预约列表
		User usr = userServiceImpl.getUserByID(user.getId() + "");
		Set<Appointment> appointmentSet = usr.getAppointmentSet();
		ActionContext.getContext().put("demandsList", demandsList);
		ActionContext.getContext().put("appointmentSet", appointmentSet);
		return SUCCESS;
	}

}
