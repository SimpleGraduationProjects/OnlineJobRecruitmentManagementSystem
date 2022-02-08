package com.mapper;

import com.model.User;
import java.util.List;
import java.util.Map;

public interface UserMapper {
	/**
	 * 查询所有应聘人员
	 * 
	 * @return
	 */
	public List<User> query(Map<String, Object> inputParam);

	/**
	 * 查询应聘人员记录数
	 * 
	 * @param inputParam
	 * @return
	 */
	public int getCount(Map<String, Object> inputParam);

	/**
	 * 保存应聘人员
	 * 
	 * @param user
	 * @return
	 */
	public int insertUser(User user);

	/**
	 * 删除应聘人员
	 * 
	 * @param id
	 * @return
	 */
	public int deleteUser(int id);

	/**
	 * 更新应聘人员
	 * 
	 * @param user
	 * @return
	 */
	public int updateUser(User user);

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public User queryUserById(int id);
}
