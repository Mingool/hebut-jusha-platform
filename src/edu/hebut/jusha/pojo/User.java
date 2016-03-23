package edu.hebut.jusha.pojo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class User {
	
	private Integer id;
	private String username;
	private String password;
	private String nickname;
	private Boolean active;
	private Boolean isVolunteer;
	private Address addressInfo;
	private Date registTime = new Date();
	
	private Set<Demands> demandsSet = new HashSet<Demands>();
	private Set<Appointment> appointmentSet = new HashSet<Appointment>();
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Boolean getActive() {
		return active;
	}
	public void setActive(Boolean active) {
		this.active = active;
	}
	public Boolean getIsVolunteer() {
		return isVolunteer;
	}
	public void setIsVolunteer(Boolean isVolunteer) {
		this.isVolunteer = isVolunteer;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Address getAddressInfo() {
		return addressInfo;
	}
	public void setAddressInfo(Address addressInfo) {
		this.addressInfo = addressInfo;
	}
	public Date getRegistTime() {
		return registTime;
	}
	public void setRegistTime(Date registTime) {
		this.registTime = registTime;
	}
	public Set<Demands> getDemandsSet() {
		return demandsSet;
	}
	public void setDemandsSet(Set<Demands> demandsSet) {
		this.demandsSet = demandsSet;
	}
	public Set<Appointment> getAppointmentSet() {
		return appointmentSet;
	}
	public void setAppointmentSet(Set<Appointment> appointmentSet) {
		this.appointmentSet = appointmentSet;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", nickname=" + nickname + ", active=" + active
				+ ", isVolunteer=" + isVolunteer + ", addressInfo="
				+ addressInfo + ", registTime=" + registTime + "]";
	}
	
}
