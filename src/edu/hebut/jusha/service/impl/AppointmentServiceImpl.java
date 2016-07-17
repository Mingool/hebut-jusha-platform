package edu.hebut.jusha.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

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

public class AppointmentServiceImpl {

	//private UserDaoHibernate userDaoHibernate = new UserDaoHibernate();
	//private DemandsDaoHibernate demandsDaoHibernate = new DemandsDaoHibernate();
	//private ItemDaoHibernate itemDaoHibernate = new ItemDaoHibernate();
	private AppointmentDaoHibernate appointmentDaoHibernate = new AppointmentDaoHibernate();
	//private DonationDaoHibernate donationDaoHibernate = new DonationDaoHibernate();

	public Appointment getAppointmentById(Integer id) {
		return appointmentDaoHibernate.get(id);
	}

}
