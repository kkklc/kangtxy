package com.kangtxy.dao;

import com.kangtxy.entity.User;

public interface UserDao {
	public User getUser(User user);
	public void addUser(User user);
	public void updateUser(User user);
	public void deleteUser(String userid);
}
