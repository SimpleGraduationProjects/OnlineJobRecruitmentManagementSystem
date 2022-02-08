package com.service;

import java.util.List;
import com.util.PageBean;
import com.model.Tadmin;

/**
 * 管理员信息Service接口
 */
public interface TadminService {
	/**
	 * 查询管理员信息记录数
	 * 
	 * @param tadmin
	 * @return
	 */
	public int getCount(Tadmin tadmin);

	/**
	 * 查询所有管理员信息
	 * 
	 * @return
	 */
	public List<Tadmin> queryTadminList(Tadmin tadmin, PageBean page)
			throws Exception;

	/**
	 * 保存管理员信息
	 * 
	 * @param tadmin
	 * @return
	 */
	public int insertTadmin(Tadmin tadmin) throws Exception;

	/**
	 * 删除管理员信息
	 * 
	 * @param id
	 * @return
	 */
	public int deleteTadmin(int id) throws Exception;

	/**
	 * 更新管理员信息
	 * 
	 * @param tadmin
	 * @return
	 */
	public int updateTadmin(Tadmin tadmin) throws Exception;

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Tadmin queryTadminById(int id) throws Exception;
}
