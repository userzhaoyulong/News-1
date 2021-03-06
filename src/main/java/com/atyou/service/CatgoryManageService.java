package com.atyou.service;

import java.util.List;

import com.atyou.common.EasyUITreeNode;
import com.atyou.common.TaotaoResult;

public interface CatgoryManageService {
	
	//获取目录列表
	List<EasyUITreeNode> getCatgoryCatList(Integer parentId);
	
	//添加新目录
	TaotaoResult insertCatgory(Integer parentId, String catgory);
	
	//修改目录名称
	TaotaoResult renameCatgory(Integer parentId, String catgory);
	
	//删除某个目录或某个父节点目录
	TaotaoResult deleteCategory(Integer id);
	
}
