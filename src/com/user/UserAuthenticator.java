package com.user;

public interface UserAuthenticator {
	public boolean authenticateUser(String username,String password,String usertype);
}
