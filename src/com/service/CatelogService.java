package com.service;

import java.util.List;
import com.util.PageBean;
import com.model.Catelog;

/**
 * 职位类别Service接口
 */
public interface CatelogService {
	/**
	 * 查询职位类别记录数
	 * 
	 * @param catelog
	 * @return
	 */
	public int getCount(Catelog catelog);

	/**
	 * 查询所有职位类别
	 * 
	 * @return
	 */
	public List<Catelog> queryCatelogList(Catelog catelog, PageBean page)
			throws Exception;

	/**
	 * 保存职位类别
	 * 
	 * @param catelog
	 * @return
	 */
	public int insertCatelog(Catelog catelog) throws Exception;

	/**
	 * 删除职位类别
	 * 
	 * @param id
	 * @return
	 */
	public int deleteCatelog(int id) throws Exception;

	/**
	 * 更新职位类别
	 * 
	 * @param catelog
	 * @return
	 */
	public int updateCatelog(Catelog catelog) throws Exception;

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Catelog queryCatelogById(int id) throws Exception;
}
