package edu.hebut.jusha.junit;

import java.util.HashSet;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.junit.Test;

import edu.hebut.jusha.pojo.Demands;
import edu.hebut.jusha.pojo.User;

public class UserJunit {
	
	@Test
	public void initTable(){
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
		User user = new User();
		user.setUsername("username");
		user.setPassword("password");
		Demands demands = new Demands();
		demands.setTitle("title");
		demands.setDescription("desc");
		demands.setUser(user);
		Set<Demands> demandsSet = new HashSet<Demands>();
		demandsSet.add(demands);
		user.setDemandsSet(demandsSet);
		s.save(demands);
		s.save(user);

		s.getTransaction().commit();
		s.close();
		sf.close();
	}

	@Test
	public void testJavaBeanRelationMapping() {
		SessionFactory sf = new Configuration().configure()
				.buildSessionFactory();

		Session s = sf.openSession();
		s.beginTransaction();
		User user = new User();
		user.setUsername("username");
		user.setPassword("password");
		Demands demands = new Demands();
		demands.setTitle("title");
		demands.setDescription("description");
		Set<Demands> demandsSet = new HashSet<Demands>();
		demandsSet.add(demands);
		user.setDemandsSet(demandsSet);

		s.save(user);

		s.getTransaction().commit();
		s.close();
		sf.close();
	}

	@Test
	public void testQuery() {
		SessionFactory factory = new Configuration().configure()
				.buildSessionFactory();
		Session session = factory.openSession();
		session.beginTransaction();

		User user = (User) session.get(User.class, 1);

		System.out.println("before");
		System.out.println(user.getDemandsSet());
		System.out.println("ends");

		session.getTransaction().commit();
		session.close();
		factory.close();
	}

	@Test
	public void testCascade() {
		SessionFactory factory = new Configuration().configure()
				.buildSessionFactory();
		Session session = factory.openSession();
		session.beginTransaction();

		User user = (User) session.get(User.class, 1);
		System.out.println(user.getDemandsSet().size());
		user.getDemandsSet().clear();
		session.delete(user);

		session.getTransaction().commit();
		session.close();
		factory.close();
	}

	@Test
	public void testCascadeFromDemandsTable() {
		SessionFactory factory = new Configuration().configure()
				.buildSessionFactory();
		Session session = factory.openSession();
		session.beginTransaction();

		Demands demands = (Demands) session.get(Demands.class, 2);
		System.out.println(demands.getUser().toString());
		session.delete(demands);

		session.getTransaction().commit();
		session.close();
		factory.close();
	}

}
