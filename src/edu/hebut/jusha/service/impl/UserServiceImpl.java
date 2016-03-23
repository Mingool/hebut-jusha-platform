package edu.hebut.jusha.service.impl;

import java.util.ArrayList;
import java.util.List;

import edu.hebut.jusha.dao.impl.UserDaoHibernate;
import edu.hebut.jusha.pojo.User;

public class UserServiceImpl {

	private UserDaoHibernate userDaoHibernate = new UserDaoHibernate();
	
	public User login(User user) {
		User usr = userDaoHibernate.queryUserByUsername(user.getUsername());
		if (usr == null)
			return null;
		if (!usr.getPassword().equals(user.getPassword()))
			return null;
		return usr;
	}

	public void regist(User user, RegistCallBack callback) {
		List<String> errorList = new ArrayList<String>();
		User usr = userDaoHibernate.queryUserByUsername(user.getUsername());
		if (usr == null) {
			// �û���û�б�ע���
			user.setActive(true);
			userDaoHibernate.save(user);
			callback.onSuccess(user);
			return;
		}
		errorList.add("����û����Ѿ���ʹ�ù���:)");
		callback.onFailed(user, errorList);
	}
	
	public User getUserByID(String userid){
		return userDaoHibernate.get(Integer.parseInt(userid));
	}
}

