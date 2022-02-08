package com.mapper;

import com.model.Comment;
import java.util.List;
import java.util.Map;

public interface CommentMapper {
	/**
	 * 查询所有评论
	 * 
	 * @return
	 */
	public List<Comment> query(Map<String, Object> inputParam);

	/**
	 * 查询评论记录数
	 * 
	 * @param inputParam
	 * @return
	 */
	public int getCount(Map<String, Object> inputParam);

	/**
	 * 保存评论
	 * 
	 * @param comment
	 * @return
	 */
	public int insertComment(Comment comment);

	/**
	 * 删除评论
	 * 
	 * @param id
	 * @return
	 */
	public int deleteComment(int id);

	/**
	 * 更新评论
	 * 
	 * @param comment
	 * @return
	 */
	public int updateComment(Comment comment);

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Comment queryCommentById(int id);
}
