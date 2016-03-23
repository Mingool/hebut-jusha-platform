package edu.hebut.jusha.junit;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.junit.Test;

import edu.hebut.jusha.constant.Constant;
import edu.hebut.jusha.dao.HibernateUtils;
import edu.hebut.jusha.dao.impl.DemandsDaoHibernate;
import edu.hebut.jusha.dao.impl.UserDaoHibernate;
import edu.hebut.jusha.pojo.Address;
import edu.hebut.jusha.pojo.Demands;
import edu.hebut.jusha.pojo.Item;
import edu.hebut.jusha.pojo.User;
import edu.hebut.jusha.service.impl.DemandsServiceImpl;

public class DemandsJunit {

	@Test
	public void initTable() {
		SessionFactory sf = new Configuration().configure()
				.buildSessionFactory();

		Session s = sf.openSession();
		s.beginTransaction();
		s.getTransaction().commit();
		s.close();
		sf.close();
	}

	@Test
	public void insertUser() {
		SessionFactory sf = new Configuration().configure()
				.buildSessionFactory();
		Session s = sf.openSession();
		s.beginTransaction();
		// start
		User user = new User();
		user.setActive(true);
		Address addressInfo = new Address();
		addressInfo.setAddr("天津市红桥区");
		addressInfo.setTelephone("18002137253");
		user.setAddressInfo(addressInfo);
		user.setIsVolunteer(true);
		user.setNickname("长颈鹿");
		user.setPassword("6615219");
		user.setUsername("Giraffe");
		s.save(user);
		// ends
		s.getTransaction().commit();
		s.close();
		sf.close();
	}

	@Test
	public void insertDemands() {
		SessionFactory sf = new Configuration().configure()
				.buildSessionFactory();
		Session s = sf.openSession();
		s.beginTransaction();
		// code
		Demands demands = new Demands();
		demands.setTitle("四川地震灾区需要帐篷");
		demands.setStatus(Constant.DEMANDS_OPEN);
		demands.setPowertyArea("四川省");
		demands.setDescription("这里是四川汶川县，灾民需要大量的帐篷用以安置他们，请物资捐助者尽快捐助，谢谢大家!");
		User user = (User) s.get(User.class, 1);
		demands.setUser(user);
		Item item1 = new Item();
		item1.setDescription("帐篷是一种生活用品");
		item1.setName("帐篷");
		item1.setTotalNum(50);
		Item item2 = new Item();
		item2.setDescription("用来做饭的");
		item2.setName("锅");
		item2.setTotalNum(60);
		demands.getItemSet().add(item1);
		demands.getItemSet().add(item2);
		s.save(demands);
		// ends
		s.getTransaction().commit();
		s.close();
		sf.close();
	}

	@Test
	public void testServiceClass() {
		DemandsServiceImpl service = new DemandsServiceImpl();
		List<Demands> demandsList = service.getAllDemands();
		Demands demands = service.getDemandsById(3);
		System.out.println(demands.getUser());
	}

	@Test
	public void testSession() {
		Session session1 = HibernateUtils.getSession();
		System.out.println(session1);
		session1.beginTransaction();
		session1.getTransaction().commit();

		Session session2 = HibernateUtils.getSession();
		System.out.println(session2);
		session2.beginTransaction();
		session2.getTransaction().commit();
	}

	@Test
	public void testAppointment() {
		DemandsServiceImpl demandsServiceImpl = new DemandsServiceImpl();
		UserDaoHibernate userDao = new UserDaoHibernate();
		User user = userDao.get(1);
		DemandsDaoHibernate demandsDao = new DemandsDaoHibernate();
		Demands demands = demandsDao.get(3);
		HashMap<String, String> itemDonateInfo = new HashMap<String, String>();
		itemDonateInfo.put("5", "5");
		itemDonateInfo.put("6", "10");
		demandsServiceImpl.mkAppointment(itemDonateInfo, demands, user);

	}

	@Test
	public void testQueryAppointment() {
		UserDaoHibernate userDao = new UserDaoHibernate();
		User user = userDao.get(1);
		System.out.println(user);
		System.out.println(user.getAppointmentSet().size());
		Object[] arr = user.getAppointmentSet().toArray();
		System.out.println(arr[0]);
	}

	@Test
	public void testt() {
		SessionFactory sf = new Configuration().configure()
				.buildSessionFactory();
		Session s1 = sf.openSession();
		s1.beginTransaction();
		//
		User user1 = (User) s1.get(User.class, 1);
		System.out.println(user1);
		s1.getTransaction().commit();

		s1.beginTransaction();
		//
		User user2 = (User) s1.get(User.class, 2);
		System.out.println(user2);
		s1.getTransaction().commit();

		s1.close();
	}
}
