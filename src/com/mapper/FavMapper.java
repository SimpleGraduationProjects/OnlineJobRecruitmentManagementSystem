package com.mapper;

import com.model.Fav;
import java.util.List;
import java.util.Map;

public interface FavMapper {
	/**
	 * 查询所有收藏
	 * 
	 * @return
	 */
	public List<Fav> query(Map<String, Object> inputParam);

	/**
	 * 查询收藏记录数
	 * 
	 * @param inputParam
	 * @return
	 */
	public int getCount(Map<String, Object> inputParam);

	/**
	 * 保存收藏
	 * 
	 * @param fav
	 * @return
	 */
	public int insertFav(Fav fav);

	/**
	 * 删除收藏
	 * 
	 * @param id
	 * @return
	 */
	public int deleteFav(int id);

	/**
	 * 更新收藏
	 * 
	 * @param fav
	 * @return
	 */
	public int updateFav(Fav fav);

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Fav queryFavById(int id);
}
