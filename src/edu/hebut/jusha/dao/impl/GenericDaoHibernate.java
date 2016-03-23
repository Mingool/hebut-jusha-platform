package edu.hebut.jusha.dao.impl;

import org.hibernate.*;
import org.hibernate.criterion.Restrictions;

import edu.hebut.jusha.dao.HibernateUtils;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.*;

public class GenericDaoHibernate<T, PK extends Serializable> {

	private Class<T> persistentClass;

	public GenericDaoHibernate(final Class<T> persistentClass) {
		this.persistentClass = persistentClass;
	}

	public List<T> getAll() {
		Session sess = HibernateUtils.getSession();
		sess.beginTransaction();
		List<T> list = sess.createCriteria(persistentClass).list();
		sess.getTransaction().commit();
		return list;
	}

	public List<T> getAllDistinct() {
		Collection<T> result = new LinkedHashSet<T>(getAll());
		return new ArrayList<T>(result);
	}

	public T get(PK id) {
		Session sess = HibernateUtils.getSession();
		sess.beginTransaction();
		T entity = (T) sess.get(persistentClass, id);
		sess.getTransaction().commit();
		return entity;
	}

	public boolean exists(PK id) {
		T entity = get(id);
		return entity != null;
	}

	public T save(T object) {
		Session sess = HibernateUtils.getSession();
		sess.beginTransaction();
		T t = (T) sess.save(object);
		sess.flush();
		sess.getTransaction().commit();
		return t;
	}

	public void remove(T object) {
		Session sess = HibernateUtils.getSession();
		sess.beginTransaction();
		sess.delete(object);
		sess.flush();
		sess.getTransaction().commit();
	}

	public void update(T object) {
		Session session = HibernateUtils.getSession();
		session.beginTransaction();
		session.update(object);
		session.flush();
		session.getTransaction().commit();
	}

	/**
	 * {@inheritDoc}
	 */
	public List<T> queryByField(String fieldName, Object para) {
		Session sess = HibernateUtils.getSession();
		List datas = sess.createCriteria(persistentClass)
				.add(Restrictions.eq(fieldName, para.toString())).list();
		if (datas.isEmpty()) {
			return null;
		} else {
			return datas;
		}
	}

	/*
	 * @SuppressWarnings("unchecked") public List<T> hql(String hql, Map<String,
	 * Object> params) { Query query =
	 * HibernateUtils.getSession().createQuery(hql); for (String key :
	 * params.keySet()) { query.setParameter(key, params.get(key)); } return
	 * query.list(); }
	 * 
	 * public Integer count() { String hqlString = "select count(*) from " +
	 * persistentClass.getName(); Query query =
	 * HibernateUtils.getSession().createQuery(hqlString); Integer num =
	 * (Integer) query.list().get(0); return num; }
	 */

}
