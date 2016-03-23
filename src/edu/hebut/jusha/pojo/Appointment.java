package edu.hebut.jusha.pojo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Appointment {
	private Integer id;
	private Boolean isFinished;
	private Date startTime;
	private Date finishTime;
	private String appointmentNumber;
	
	private Set<Donation> donationSet = new HashSet<Donation>(); 
	private Demands demands;
	private User user;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Boolean getIsFinished() {
		return isFinished;
	}
	public void setIsFinished(Boolean isFinished) {
		this.isFinished = isFinished;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getFinishTime() {
		return finishTime;
	}
	public void setFinishTime(Date finishTime) {
		this.finishTime = finishTime;
	}
	public Set<Donation> getDonationSet() {
		return donationSet;
	}
	public void setDonationSet(Set<Donation> donationSet) {
		this.donationSet = donationSet;
	}
	public Demands getDemands() {
		return demands;
	}
	public void setDemands(Demands demands) {
		this.demands = demands;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getAppointmentNumber() {
		return appointmentNumber;
	}
	public void setAppointmentNumber(String appointmentNumber) {
		this.appointmentNumber = appointmentNumber;
	}
	@Override
	public String toString() {
		return "Appointment [id=" + id + ", isFinished=" + isFinished
				+ ", startTime=" + startTime + ", finishTime=" + finishTime
				+ "]";
	}
	
	
}
