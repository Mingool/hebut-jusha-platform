package edu.hebut.jusha.pojo;

import java.util.HashSet;
import java.util.Set;

public class Demands {
	
	private Integer id;
	private String title;
	private String description;
	private String expressNumber;
	private String powertyArea;
	private Integer status;
	
	private User user;
	private Set<Item> itemSet = new HashSet<Item>(); 
	private Set<Appointment> appointmentSet = new HashSet<Appointment>();
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getExpressNumber() {
		return expressNumber;
	}
	public void setExpressNumber(String expressNumber) {
		this.expressNumber = expressNumber;
	}
	public String getPowertyArea() {
		return powertyArea;
	}
	public void setPowertyArea(String powertyArea) {
		this.powertyArea = powertyArea;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<Item> getItemSet() {
		return itemSet;
	}
	public void setItemSet(Set<Item> itemSet) {
		this.itemSet = itemSet;
	}
	public Set<Appointment> getAppointmentSet() {
		return appointmentSet;
	}
	public void setAppointmentSet(Set<Appointment> appointmentSet) {
		this.appointmentSet = appointmentSet;
	}
}
