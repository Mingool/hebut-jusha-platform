package edu.hebut.jusha.controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import edu.hebut.jusha.pojo.Appointment;
import edu.hebut.jusha.service.impl.AppointmentServiceImpl;

public class AppointmentAction extends ActionSupport {

	private String appointmentID;

	private AppointmentServiceImpl appointmentServiceImpl = new AppointmentServiceImpl();

	public String showAppointmentInfo() {
		if (this.appointmentID == null || "".equals(this.appointmentID))
			return "error";
		Appointment appointment = appointmentServiceImpl
				.getAppointmentById(Integer.parseInt(appointmentID));
		ActionContext.getContext().put("appointment", appointment);
		return SUCCESS;
	}

	// ..................

	public String getAppointmentID() {
		return appointmentID;
	}

	public void setAppointmentID(String appointmentID) {
		this.appointmentID = appointmentID;
	}

}
