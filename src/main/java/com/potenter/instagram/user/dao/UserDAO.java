package com.potenter.instagram.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.potenter.instagram.user.model.User;

@Repository
public interface UserDAO {
	
	public int insertUser(
			@Param("loginId") String loginId,
			@Param("name") String name,
			@Param("phoneNumber") String phoneNumber,
			@Param("password") String password);
	
	public int selectCountLoginId(@Param("loginId") String loginId);
	
	public User selectUserByIdPassword(
			@Param("loginId") String loginID
			, @Param("password") String password);	
}
