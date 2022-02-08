package com.mapper;

import com.model.Gonggao;
import java.util.List;
import java.util.Map;

public interface GonggaoMapper {
	/**
	 * 查询所有资讯
	 * 
	 * @return
	 */
	public List<Gonggao> query(Map<String, Object> inputParam);

	/**
	 * 查询资讯记录数
	 * 
	 * @param inputParam
	 * @return
	 */
	public int getCount(Map<String, Object> inputParam);

	/**
	 * 保存资讯
	 * 
	 * @param gonggao
	 * @return
	 */
	public int insertGonggao(Gonggao gonggao);

	/**
	 * 删除资讯
	 * 
	 * @param id
	 * @return
	 */
	public int deleteGonggao(int id);

	/**
	 * 更新资讯
	 * 
	 * @param gonggao
	 * @return
	 */
	public int updateGonggao(Gonggao gonggao);

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Gonggao queryGonggaoById(int id);
}
