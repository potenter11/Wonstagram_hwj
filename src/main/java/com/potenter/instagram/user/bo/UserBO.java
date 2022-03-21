package com.potenter.instagram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.potenter.instagram.common.EncryptUtils;
import com.potenter.instagram.user.dao.UserDAO;
import com.potenter.instagram.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(String loginId, String name, String phoneNumber, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(loginId, name, phoneNumber, encryptPassword);
		
	}
	
	public boolean isDuplicated(String loginId) {
		
		int count = userDAO.selectCountLoginId(loginId);
		
		if(count == 0) {
			return false; 
		} else {
			return true;
		}
		// return (count != 0);
	}
	
	public User signIn(String loginId, String password) {
		// 비밀번호를 암호화 하고 DAO 로 전달한다. 
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.selectUserByIdPassword(loginId, encryptPassword);
	}
	
}
