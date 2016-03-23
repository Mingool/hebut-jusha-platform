package edu.hebut.jusha.controller;

import java.util.HashMap;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import edu.hebut.jusha.pojo.Demands;
import edu.hebut.jusha.pojo.User;
import edu.hebut.jusha.service.impl.DemandsServiceImpl;

public class DemandsAction extends ActionSupport {

	private String demandsID;
	private String itemDonationInfo;

	// ”√”⁄‘§‘º
	private Boolean flag;
	private String message;
	private String j;

	private DemandsServiceImpl demandsService = new DemandsServiceImpl();

	public String showDemandsInfo() {
		if (demandsID == null || "".equals(this.demandsID))
			return "error";
		Demands demands = demandsService.getDemandsById(Integer
				.parseInt(this.demandsID));
		ActionContext.getContext().put("demands", demands);
		return SUCCESS;
	}

	public String showMkAppointmentPage() {
		return showDemandsInfo();
	}

	public String mkAppointment() {
		this.flag = true;
		System.out.println("this.j=" + this.j);
		String items[] = this.j.split(";");
		System.out.println("items[]=" + items.toString());
		HashMap<String, String> itemDonateInfo = new HashMap<String, String>();
		for (int i = 0; i < items.length; i++) {
			String str = items[i];
			String singleItem[] = str.split("=");
			System.out.println("singleItem[]=" + singleItem.toString());
			String key = singleItem[0];
			String value = singleItem[1];
			System.out.println("key=" + key);
			System.out.println("value=" + value);
			if (value == null || "".equals(value))
				continue;
			if (value.equals("0"))
				continue;
			itemDonateInfo.put(key, value);
		}

		User user = (User) ActionContext.getContext().getSession().get("user");
		Demands demands = demandsService.getDemandsById(Integer
				.parseInt(this.demandsID));
		demandsService.mkAppointment(itemDonateInfo, demands, user);
		return SUCCESS;
	}

	// ..................................

	public String getDemandsID() {
		return demandsID;
	}

	public void setDemandsID(String demandsID) {
		this.demandsID = demandsID;
	}

	public String getItemDonationInfo() {
		return itemDonationInfo;
	}

	public void setItemDonationInfo(String itemDonationInfo) {
		this.itemDonationInfo = itemDonationInfo;
	}

	public Boolean getFlag() {
		return flag;
	}

	public void setFlag(Boolean flag) {
		this.flag = flag;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getJ() {
		return j;
	}

	public void setJ(String j) {
		this.j = j;
	}
}
