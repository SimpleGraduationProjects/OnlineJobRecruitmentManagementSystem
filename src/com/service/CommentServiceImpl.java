package com.service;

import java.util.List;
import com.model.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import com.util.PageBean;
import java.util.Map;
import com.mapper.CommentMapper;

/**
 * 评论Service实现类
 */
@Service
public class CommentServiceImpl implements CommentService {
	/**
	 * 注入mapper
	 */
	@Autowired
	private CommentMapper commentMapper;

	/**
	 * 查询评论记录数
	 * 
	 * @param comment
	 * @return
	 */
	public int getCount(Comment comment) {
		Map<String, Object> map = getQueryMap(comment, null);
		return commentMapper.getCount(map);
	}

	/**
	 * 查询所有评论
	 * 
	 * @return
	 */
	public List<Comment> queryCommentList(Comment comment, PageBean page)
			throws Exception {
		Map<String, Object> map = getQueryMap(comment, page);
		List<Comment> list = commentMapper.query(map);
		return list;
	}

	/**
	 * 封装查询条件
	 * 
	 * @param comment
	 * @param page
	 * @return
	 */
	private Map<String, Object> getQueryMap(Comment comment, PageBean page) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (comment != null) {
			map.put("id", comment.getId());
			map.put("uid", comment.getUid());
			map.put("bid", comment.getBid());
		}
		if (page != null) {
			PageBean.setPageMap(map, page);
		}
		return map;
	}

	/**
	 * 保存评论
	 * 
	 * @param comment
	 * @return
	 */
	public int insertComment(Comment comment) throws Exception {
		return commentMapper.insertComment(comment);
	}

	/**
	 * 删除评论
	 * 
	 * @param id
	 * @return
	 */
	public int deleteComment(int id) throws Exception {
		return commentMapper.deleteComment(id);
	}

	/**
	 * 更新评论
	 * 
	 * @param comment
	 * @return
	 */
	public int updateComment(Comment comment) throws Exception {
		return commentMapper.updateComment(comment);
	}

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Comment queryCommentById(int id) throws Exception {
		return commentMapper.queryCommentById(id);
	}
}
