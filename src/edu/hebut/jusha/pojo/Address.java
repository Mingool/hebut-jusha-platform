package edu.hebut.jusha.pojo;

public class Address {
	
	private String addr;
	private String telephone;
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	@Override
	public String toString() {
		return "Address [addr=" + addr + ", telephone=" + telephone + "]";
	}
	
	
}
