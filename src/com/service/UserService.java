package com.service;

import java.util.List;
import com.util.PageBean;
import com.model.User;

/**
 * 应聘人员Service接口
 */
public interface UserService {
	/**
	 * 查询应聘人员记录数
	 * 
	 * @param user
	 * @return
	 */
	public int getCount(User user);

	/**
	 * 查询所有应聘人员
	 * 
	 * @return
	 */
	public List<User> queryUserList(User user, PageBean page) throws Exception;

	/**
	 * 保存应聘人员
	 * 
	 * @param user
	 * @return
	 */
	public int insertUser(User user) throws Exception;

	/**
	 * 删除应聘人员
	 * 
	 * @param id
	 * @return
	 */
	public int deleteUser(int id) throws Exception;

	/**
	 * 更新应聘人员
	 * 
	 * @param user
	 * @return
	 */
	public int updateUser(User user) throws Exception;

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public User queryUserById(int id) throws Exception;
}
