package com.service;

import java.util.List;
import com.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import com.util.PageBean;
import java.util.Map;
import com.mapper.UserMapper;

/**
 * 应聘人员Service实现类
 */
@Service
public class UserServiceImpl implements UserService {
	/**
	 * 注入mapper
	 */
	@Autowired
	private UserMapper userMapper;

	/**
	 * 查询应聘人员记录数
	 * 
	 * @param user
	 * @return
	 */
	public int getCount(User user) {
		Map<String, Object> map = getQueryMap(user, null);
		return userMapper.getCount(map);
	}

	/**
	 * 查询所有应聘人员
	 * 
	 * @return
	 */
	public List<User> queryUserList(User user, PageBean page) throws Exception {
		Map<String, Object> map = getQueryMap(user, page);
		List<User> list = userMapper.query(map);
		return list;
	}

	/**
	 * 封装查询条件
	 * 
	 * @param user
	 * @param page
	 * @return
	 */
	private Map<String, Object> getQueryMap(User user, PageBean page) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (user != null) {
			map.put("id", user.getId());
			map.put("uname", user.getUname());
			map.put("upwd", user.getUpwd());
			map.put("name", user.getName());
			map.put("xueli", user.getXueli());
			map.put("catelogid", user.getCatelogid());
			map.put("zt", user.getZt());
			map.put("state", user.getState());
		}
		if (page != null) {
			PageBean.setPageMap(map, page);
		}
		return map;
	}

	/**
	 * 保存应聘人员
	 * 
	 * @param user
	 * @return
	 */
	public int insertUser(User user) throws Exception {
		return userMapper.insertUser(user);
	}

	/**
	 * 删除应聘人员
	 * 
	 * @param id
	 * @return
	 */
	public int deleteUser(int id) throws Exception {
		return userMapper.deleteUser(id);
	}

	/**
	 * 更新应聘人员
	 * 
	 * @param user
	 * @return
	 */
	public int updateUser(User user) throws Exception {
		return userMapper.updateUser(user);
	}

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public User queryUserById(int id) throws Exception {
		return userMapper.queryUserById(id);
	}
}
