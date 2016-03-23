package edu.hebut.jusha.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {

	private static SessionFactory sessionFactory = new Configuration()
			.configure().buildSessionFactory();
	private static ThreadLocal<Session> threadLocal = new ThreadLocal<Session>();

	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public static Session getSession() {
		Session session = threadLocal.get();
		if (session == null) {
			session = sessionFactory.openSession();
			System.out.println("我打开了session,当前线程ID="
					+ Thread.currentThread().getId());
			threadLocal.set(session);
			return session;
		}
		return session;
	}

	public static void closeThreadSession() {
		Session session = threadLocal.get();
		if (session != null) {
			session.close();
			System.out.println("我关闭了session,当前线程ID="
					+ Thread.currentThread().getId());
			threadLocal.set(null);
		}
	}
}
