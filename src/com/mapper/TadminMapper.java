package com.mapper;

import com.model.Tadmin;
import java.util.List;
import java.util.Map;

public interface TadminMapper {
	/**
	 * 查询所有管理员信息
	 * 
	 * @return
	 */
	public List<Tadmin> query(Map<String, Object> inputParam);

	/**
	 * 查询管理员信息记录数
	 * 
	 * @param inputParam
	 * @return
	 */
	public int getCount(Map<String, Object> inputParam);

	/**
	 * 保存管理员信息
	 * 
	 * @param tadmin
	 * @return
	 */
	public int insertTadmin(Tadmin tadmin);

	/**
	 * 删除管理员信息
	 * 
	 * @param id
	 * @return
	 */
	public int deleteTadmin(int id);

	/**
	 * 更新管理员信息
	 * 
	 * @param tadmin
	 * @return
	 */
	public int updateTadmin(Tadmin tadmin);

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Tadmin queryTadminById(int id);
}
