package com.atyou.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atyou.dao.CommentMapper;
import com.atyou.dao.DetailMapper;
import com.atyou.dao.NewscolMapper;
import com.atyou.pojo.Comment;
import com.atyou.pojo.CommentExample;
import com.atyou.pojo.CommentExample.Criteria;
import com.atyou.pojo.CommentResult;
import com.atyou.pojo.Detail;
import com.atyou.pojo.Newscol;
import com.atyou.query.CommentQueryObject;
import com.atyou.query.PageResult;
import com.atyou.service.DetailService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class DetailServiceImpl implements DetailService {

	@Autowired
	private DetailMapper detailMapper;
	@Autowired
	private CommentMapper commentMapper;
	@Autowired
	private NewscolMapper newscolMapper;
	
	@Override
	public Detail queryDetail(Integer id) throws Exception {
		Detail detail = detailMapper.selectByPrimaryKey(id);
		
		return detail;

	}

	/*@Override
	public PageResult commentList(CommentQueryObject qo) throws Exception {
		int count = commentMapper.queryForCount(qo);
		if (count>0) {
			List<Comment> list = commentMapper.query(qo);
			return new PageResult(list, count, qo.getCurrentPage(), qo.getPageSize());
		}
		return PageResult.empty(qo.getPageSize());

	}*/
	@Override
	public PageInfo commentPage(Integer pn,Integer detailId) throws Exception {
	
		 //引入分页查询，使用PageHelper分页功能  
	    //在查询之前传入当前页，然后多少记录  
	    PageHelper.startPage(pn,5);  
	    //startPage后紧跟的这个查询就是分页查询  
	    CommentExample example = new CommentExample();
	    //List<Comment> emps = commentMapper.selectByExample(example);
	    List<CommentResult> emps = commentMapper.queryCommUser(detailId);
	    //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以  
	    PageInfo pageInfo = new PageInfo<>(emps,5);  
	    //pageINfo封装了分页的详细信息，也可以指定连续显示的页数  
	    
		return pageInfo;

	}

	@Override
	public Boolean addComment(Comment comment) throws Exception {
		if (comment.getUserId()!=null&&comment.getDetailId()!=null) {
			comment.setAddtime(new Date());
			comment.setUptime(new Date());
			int insert = commentMapper.insert(comment);
			if (insert>0) {
				return true;
			}
			return false;
		}

		return false;
	}

	@Override
	public List<CommentResult> commentList(Integer detailId) throws Exception {
		 CommentExample example = new CommentExample();
		 List<CommentResult> list = commentMapper.queryCommUser(detailId);
		return list;
	}

	@Override
	public PageInfo userCommentPage(Integer pn, Integer userId) throws Exception {

		 //引入分页查询，使用PageHelper分页功能  
	    //在查询之前传入当前页，然后多少记录  
	    PageHelper.startPage(pn,5);  
	    //startPage后紧跟的这个查询就是分页查询  
	
	    //List<Comment> emps = commentMapper.selectByExample(example);
	    List<CommentResult> emps = commentMapper.queryCommUserNoDetail(userId);
	    //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以  
	    PageInfo pageInfo = new PageInfo<>(emps,5);  
	    //pageINfo封装了分页的详细信息，也可以指定连续显示的页数  
	    
		return pageInfo;

	}

	@Override
	public Boolean addCol(Comment comment) throws Exception {
		if (comment.getUserId()!=null&&comment.getDetailId()!=null) {
			System.out.println(comment.getUserId()+"::::"+comment.getDetailId());
			Newscol newscol = new Newscol();
			newscol.setUserId(comment.getUserId());
			newscol.setDetailId(comment.getDetailId());
			newscol.setAddtime(new Date());		
			int insert = newscolMapper.insert(newscol);
			if (insert>0) {
				return true;
			}
			return false;
		}

		return false;
	}
	

}
