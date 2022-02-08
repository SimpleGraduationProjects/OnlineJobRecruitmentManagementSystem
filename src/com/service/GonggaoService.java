package com.service;

import java.util.List;
import com.util.PageBean;
import com.model.Gonggao;

/**
 * 资讯Service接口
 */
public interface GonggaoService {
	/**
	 * 查询资讯记录数
	 * 
	 * @param gonggao
	 * @return
	 */
	public int getCount(Gonggao gonggao);

	/**
	 * 查询所有资讯
	 * 
	 * @return
	 */
	public List<Gonggao> queryGonggaoList(Gonggao gonggao, PageBean page)
			throws Exception;

	/**
	 * 保存资讯
	 * 
	 * @param gonggao
	 * @return
	 */
	public int insertGonggao(Gonggao gonggao) throws Exception;

	/**
	 * 删除资讯
	 * 
	 * @param id
	 * @return
	 */
	public int deleteGonggao(int id) throws Exception;

	/**
	 * 更新资讯
	 * 
	 * @param gonggao
	 * @return
	 */
	public int updateGonggao(Gonggao gonggao) throws Exception;

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Gonggao queryGonggaoById(int id) throws Exception;
}
