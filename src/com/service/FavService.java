package com.service;

import java.util.List;
import com.util.PageBean;
import com.model.Fav;

/**
 * 收藏Service接口
 */
public interface FavService {
	/**
	 * 查询收藏记录数
	 * 
	 * @param fav
	 * @return
	 */
	public int getCount(Fav fav);

	/**
	 * 查询所有收藏
	 * 
	 * @return
	 */
	public List<Fav> queryFavList(Fav fav, PageBean page) throws Exception;

	/**
	 * 保存收藏
	 * 
	 * @param fav
	 * @return
	 */
	public int insertFav(Fav fav) throws Exception;

	/**
	 * 删除收藏
	 * 
	 * @param id
	 * @return
	 */
	public int deleteFav(int id) throws Exception;

	/**
	 * 更新收藏
	 * 
	 * @param fav
	 * @return
	 */
	public int updateFav(Fav fav) throws Exception;

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Fav queryFavById(int id) throws Exception;
}
