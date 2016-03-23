package edu.hebut.jusha.pojo;

import java.util.HashSet;
import java.util.Set;

public class Item {
	private Integer id;
	private String name;
	private String description;
	
	private Integer totalNum;
	private Integer receiveNum = 0;
	private Integer reservationNum = 0;
	
	private Demands demands;
	private Set<Donation> donationSet = new HashSet<Donation>();
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(Integer totalNum) {
		this.totalNum = totalNum;
	}
	public Integer getReceiveNum() {
		return receiveNum;
	}
	public void setReceiveNum(Integer receiveNum) {
		this.receiveNum = receiveNum;
	}
	public Integer getReservationNum() {
		return reservationNum;
	}
	public void setReservationNum(Integer reservationNum) {
		this.reservationNum = reservationNum;
	}
	public Demands getDemands() {
		return demands;
	}
	public void setDemands(Demands demands) {
		this.demands = demands;
	}
	public Set<Donation> getDonationSet() {
		return donationSet;
	}
	public void setDonationSet(Set<Donation> donationSet) {
		this.donationSet = donationSet;
	}
	@Override
	public String toString() {
		return "Item [id=" + id + ", name=" + name + ", description="
				+ description + ", totalNum=" + totalNum + ", receiveNum="
				+ receiveNum + ", reservationNum=" + reservationNum + "]";
	} 
	
}
