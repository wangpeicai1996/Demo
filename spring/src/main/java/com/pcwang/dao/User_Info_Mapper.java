package com.pcwang.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.pcwang.domain.User_Info;

/**
 * user_infoʵ�����dao��ӿ�
 * @author Administrator
 *
 */
@Repository
public interface User_Info_Mapper {

	public User_Info getUser(@Param("username")String username,@Param("password")String password);
	
}
