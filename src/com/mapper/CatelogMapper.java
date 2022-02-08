package com.mapper;

import com.model.Catelog;
import java.util.List;
import java.util.Map;

public interface CatelogMapper {
	/**
	 * 查询所有职位类别
	 * 
	 * @return
	 */
	public List<Catelog> query(Map<String, Object> inputParam);

	/**
	 * 查询职位类别记录数
	 * 
	 * @param inputParam
	 * @return
	 */
	public int getCount(Map<String, Object> inputParam);

	/**
	 * 保存职位类别
	 * 
	 * @param catelog
	 * @return
	 */
	public int insertCatelog(Catelog catelog);

	/**
	 * 删除职位类别
	 * 
	 * @param id
	 * @return
	 */
	public int deleteCatelog(int id);

	/**
	 * 更新职位类别
	 * 
	 * @param catelog
	 * @return
	 */
	public int updateCatelog(Catelog catelog);

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Catelog queryCatelogById(int id);
}
