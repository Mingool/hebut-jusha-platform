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
		// �ж��Ƿ��е�½Ȩ��
		User user = (User) ActionContext.getContext().getSession().get("user");
		if (user == null)
			return "error";
		// ��ѯ�����б�
		List<Demands> demandsList = demandsService.getAllDemands();
		// ��ѯԤԼ�б�
		User usr = userServiceImpl.getUserByID(user.getId() + "");
		Set<Appointment> appointmentSet = usr.getAppointmentSet();
		ActionContext.getContext().put("demandsList", demandsList);
		ActionContext.getContext().put("appointmentSet", appointmentSet);
		return SUCCESS;
	}

}
