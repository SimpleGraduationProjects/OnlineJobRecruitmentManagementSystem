package com.service;

import java.util.List;
import com.util.PageBean;
import com.model.Comment;

/**
 * 评论Service接口
 */
public interface CommentService {
	/**
	 * 查询评论记录数
	 * 
	 * @param comment
	 * @return
	 */
	public int getCount(Comment comment);

	/**
	 * 查询所有评论
	 * 
	 * @return
	 */
	public List<Comment> queryCommentList(Comment comment, PageBean page)
			throws Exception;

	/**
	 * 保存评论
	 * 
	 * @param comment
	 * @return
	 */
	public int insertComment(Comment comment) throws Exception;

	/**
	 * 删除评论
	 * 
	 * @param id
	 * @return
	 */
	public int deleteComment(int id) throws Exception;

	/**
	 * 更新评论
	 * 
	 * @param comment
	 * @return
	 */
	public int updateComment(Comment comment) throws Exception;

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Comment queryCommentById(int id) throws Exception;
}
