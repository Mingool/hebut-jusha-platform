package edu.hebut.jusha.service.impl;

import java.util.List;

import edu.hebut.jusha.pojo.User;

public interface RegistCallBack {
	void onSuccess(User user);

	void onFailed(User user, List<String> errorList);
}
