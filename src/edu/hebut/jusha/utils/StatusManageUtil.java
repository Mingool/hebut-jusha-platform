package edu.hebut.jusha.utils;

import java.util.Set;

import edu.hebut.jusha.constant.Constant;
import edu.hebut.jusha.dao.impl.DemandsDaoHibernate;
import edu.hebut.jusha.pojo.Demands;
import edu.hebut.jusha.pojo.Donation;
import edu.hebut.jusha.pojo.Item;

public class StatusManageUtil {

	public synchronized static void checkAndModifyStatus(Demands demands,
			DemandsDaoHibernate demandsDao) {
		if (demands == null)
			return;
		Set<Item> itemSet = demands.getItemSet();
		boolean needChange = true;
		for (Item item : itemSet) {
			if (item.getTotalNum() - item.getReservationNum()
					- item.getReceiveNum() > 0) {
				needChange = false;
				break;
			}
		}
		if (!needChange)
			return;
		demands.setStatus(Constant.DEMANDS_CLOSE);
		demandsDao.update(demands);
	}
}
