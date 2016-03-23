package edu.hebut.jusha.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import edu.hebut.jusha.dao.HibernateUtils;
import edu.hebut.jusha.pojo.Demands;
import edu.hebut.jusha.pojo.Item;
import edu.hebut.jusha.pojo.User;

import javax.transaction.Transactional;

public class ItemDaoHibernate extends GenericDaoHibernate<Item, Integer> {

	/**
	 * Constructor to create a Generics-based version using Law as the entity
	 */
	public ItemDaoHibernate() {
		super(Item.class);
	}


}
