package edu.hebut.jusha.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import edu.hebut.jusha.dao.HibernateUtils;
import edu.hebut.jusha.pojo.User;

import javax.transaction.Transactional;

public class UserDaoHibernate extends GenericDaoHibernate<User, Integer> {

	/**
	 * Constructor to create a Generics-based version using Law as the entity
	 */
	public UserDaoHibernate() {
		super(User.class);
	}

	public User queryUserByUsername(String username) {
		Session session = HibernateUtils.getSession();
		session.beginTransaction();
		List datas = HibernateUtils.getSession().createCriteria(User.class)
				.add(Restrictions.eq("username", username)).list();
		session.getTransaction().commit();
		if (datas.isEmpty()) {
			return null;
		} else {
			return (User) datas.get(0);
		}
	}

}
