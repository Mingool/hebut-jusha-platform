package edu.hebut.jusha.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.zip.DataFormatException;

import edu.hebut.jusha.dao.impl.AppointmentDaoHibernate;
import edu.hebut.jusha.dao.impl.DemandsDaoHibernate;
import edu.hebut.jusha.dao.impl.DonationDaoHibernate;
import edu.hebut.jusha.dao.impl.ItemDaoHibernate;
import edu.hebut.jusha.dao.impl.UserDaoHibernate;
import edu.hebut.jusha.pojo.Appointment;
import edu.hebut.jusha.pojo.Demands;
import edu.hebut.jusha.pojo.Donation;
import edu.hebut.jusha.pojo.Item;
import edu.hebut.jusha.pojo.User;
import edu.hebut.jusha.utils.RandomUtils;
import edu.hebut.jusha.utils.StatusManageUtil;

public class DemandsServiceImpl {

	private UserDaoHibernate userDaoHibernate = new UserDaoHibernate();
	private DemandsDaoHibernate demandsDaoHibernate = new DemandsDaoHibernate();
	private ItemDaoHibernate itemDaoHibernate = new ItemDaoHibernate();
	private AppointmentDaoHibernate appointmentDaoHibernate = new AppointmentDaoHibernate();
	private DonationDaoHibernate donationDaoHibernate = new DonationDaoHibernate();

	public List<Demands> getAllDemands() {
		return demandsDaoHibernate.getAll();
	}

	public Demands getDemandsById(Integer id) {
		return demandsDaoHibernate.get(id);
	}

	public boolean mkAppointment(HashMap<String, String> itemDonateInfo,
			Demands demands, User user) {
		if (itemDonateInfo.size() <= 0)
			return false;
		// 保存appointment
		Appointment appointment = new Appointment();
		appointment.setDemands(demands);
		appointment.setUser(user);
		appointment.setStartTime(new Date());
		appointment.setIsFinished(false);
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMddhhmmss");
		String appointmentNumber = dateFormat.format(new Date());
		appointmentNumber = appointmentNumber + RandomUtils.getRandomNumber(2);
		appointment.setAppointmentNumber(appointmentNumber);
		appointmentDaoHibernate.save(appointment);
		// 保存donation
		Set<String> keySet = itemDonateInfo.keySet();
		Iterator it_key = keySet.iterator();
		while (it_key.hasNext()) {
			String key = (String) it_key.next();
			String value = itemDonateInfo.get(key);
			if (value == null || "".equals(value))
				continue;

			Donation donation = new Donation();
			donation.setAppointment(appointment);
			donation.setAccount(Integer.parseInt(value));
			Item item = itemDaoHibernate.get(Integer.parseInt(key));
			donation.setItem(item);
			donationDaoHibernate.save(donation);

			item.setReservationNum(item.getReservationNum()
					+ donation.getAccount());
			itemDaoHibernate.update(item);
		}
		// 检查是否需要更改Demands的状态
		StatusManageUtil.checkAndModifyStatus(demands, demandsDaoHibernate);
		return true;
	}
}
