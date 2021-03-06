<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>新闻详情页</title>
<link rel="stylesheet" href="/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/static/css/main.css">
<!-- <link rel="stylesheet" href="../static/base/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="../static/base/css/bootstrap-movie.css">
<link rel="stylesheet" href="../static/base/css/animate.css">
<link rel="stylesheet" type="text/css" href="../static/jwplayer/skins/stormtrooper.css">
<script type="text/javascript" src="../static/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="../static/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="../static/ueditor/lang/zh-cn/zh-cn.js"></script>
<script src="../static/base/js/jquery.singlePageNav.min.js"></script>
<script src="../static/base/js/wow.min.js"></script>
<script src="../static/lazyload/jquery.lazyload.min.js"></script>
<script src="//cdn.bootcss.com/holder/2.9.4/holder.min.js"></script>
<script src="../static/jwplayer/jwplayer.js"></script>

<script type="text/javascript" src="/js/jquery/jquery-2.1.3.js"></script>
<script type="text/javascript" src="/js/bootstrap-3.3.2-dist/js/bootstrap.js"></script>
<script type="text/javascript" src="/js/jquery.bootstrap.min.js"></script>
<script type="text/javascript" src="/js/plugins/jquery.form.js"></script>
<script type="text/javascript">
$(function(){

	$("#addCommForm").ajaxForm({success:function(data){
		if(data.success){
			$.messager.alert(data.msg);
			location.reload();
		/* 	$.messager.alert(data.msg,function(data){
				if(data){
					window.location.href="/details";
				}else{
					window.location.href="/details";
				}
			});	 */
		}else{
			$.messager.alert(data.msg);
			//$.messager.popup(data.msg);
		}
	}});
	/*  $("#btn-coldetail").click(function(){
		$("#addCommForm").ajaxForm({success:function(data){
			if(data.success){
				$.messager.alert(data.msg);
				location.reload();
			}else{
				$.messager.alert(data.msg);
			}
		}});
		});  */
		
});  
function login() {
    $.ajax({
    //几个参数需要注意一下
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: "/addcol" ,//url
        data: $('#addCommForm').serialize(),
        success: function (data) {
        	$.messager.alert(data.msg);
			location.reload();
        },
        error : function() {
        	$.messager.alert(data.msg);
        }
    });
}
</script>
<script>
var ue = UE.getEditor('input_content',{
    toolbars: [
        ['fullscreen', 'emotion', 'preview', 'link']
    ],
    initialFrameWidth:"100%",
    initialFrameHeight:"100",
});
</script>
</head>
<body>
	<nav class="navbar navbar-default">
	  <div class="container">
	    <div class="navbar-header">
	    	<div class="col-xs-2">
		      	<a href="/index" class="navbar-brand"></a>
		    </div>
	    	<div class="col-xs-8 visible-xs">
	    		<div class="col-xs-7">
			    </div>
	    		<div class="col-xs-5">
				  	<ul class="nav navbar-nav navbar-right"> 
			          <li><a href="/login"><span class="glyphicon glyphicon-user"></span> 注册</a></li> 
			        </ul>
			        
			    </div>
			</div>
			<div class="col-xs-2">
			  	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
	      				data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			        <span class="sr-only">更多</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
			</div>
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	    	<div class="row">
	    	  <c:forEach items="${cateList}"  end="5" var="cate">
			  <div class="col-xs-3 col-sm-1 col-md-1">
			  	<ul class="nav navbar-nav">
			  		<li id="tes"><a href="/index?categoryId=${cate.id}">${cate.category}</a></li>
			  	</ul>
			  </div>
			  </c:forEach>
	    <div class="col-xs-3 col-sm-1 col-md-1 hidden-xs">
			  	<ul class="nav navbar-nav">
			  		<li id="tes" class="dropdown">
		                <a href="#" class="dropdown-toggle" data-toggle="dropdown"> 更多
		                    <b class="caret"></b>
		                </a>
		                <ul class="dropdown-menu"  >  <!-- style="overflow:scroll" -->
		                <c:forEach items="${cateList}" begin="6" var="cate">
		                	<li id="tea"><a href="/index?categoryId=${cate.id}">${cate.category}</a></li>
		                    <li class="divider"></li>
		                </c:forEach>
		                    <!-- <li id="tea"><a href="#">娱乐</a></li>
		                    <li class="divider"></li>
		                    <li id="tea"><a href="#">房价</a></li> -->
		                </ul>
		            </li>
			  	</ul>
			  </div>
			  <div class="col-sm-1 hidden-xs ">
			  	<ul class="nav navbar-nav navbar-right "> 
		          <li id="tes">
		          	<a class="curlink" href="signup"><span class="glyphicon glyphicon-plus"></span>&nbsp;注册</a>
		          </li> 
		        </ul>
			  </div>
			  
			  <c:if test="${empty user }">
			  <div class="col-sm-1 hidden-xs ">
			  	<ul class="nav navbar-nav navbar-right "> 
		           <li id="tes"><a href="/login"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li> 
		        </ul>
			  </div>
			  </c:if>
			  
			  <c:if test="${not empty user }">
			  <div class="col-sm-1 hidden-xs ">
			  	<ul class="nav navbar-nav navbar-right "> 
		           <li id="tes">
                    <a class="curlink" href="/logout"><span class="glyphicon glyphicon-log-out"></span>&nbsp;退出</a>
                   </li>
		        </ul>
			  </div>
			  </c:if>
			  <div class="col-sm-1 hidden-xs ">
			  	<ul class="nav navbar-nav navbar-right "> 
		           <li id="tes"><a class="curlink" href="user"><span class="glyphicon glyphicon-user"></span>&nbsp;我的</a></li> 
		        </ul>
			  </div>
			</div>
	    </div>
	  </div>
	</nav>
	
	<div class="container">
		<div class="col-md-8">
			<!-- <h1 class="news-title">24小时内2名中国学生在英国失联%20使馆、警方已介入</h1>
			
			<div class="news-status">25K阅读·35分钟前发布
				<div class="label label-default">教育</div>
				<div class="label label-default">情感</div>
			</div> -->
			<h1 class="news-title">${detail.title }</h1>
			
			<div class="news-status">25K阅读·35分钟前发布
				<div class="label label-default">教育</div>
				<div class="label label-default">情感</div>
			</div>
			<div class="news-content">
				<!-- <blockquote>
					<p>
						[摘要]一人确认为伦敦国王学院女博士闫思宏，另一人疑似帝国理工学院材料系本科学生荣露琦。
						两名同学目前仍在失联中，其中身份确定的闫思宏失踪事件警方校方及大使馆均已介入，荣露琦同学的情况正在紧急核查中。
					</p>
				</blockquote>
				<div>
					2月26日，中国驻英国伦敦大使馆发布，伦敦国王学院闫姓36岁中国女博士失联，家属正求助使馆和当地警方寻人。
				与此同时，24小时内还有另一名中国留学生处于失联状态，疑似帝国理工学院（IC）本科材料系学生荣某。
				看到这一消息，相信不少网友会联想到前一段时间闹得沸沸扬扬的“江歌案”和“章莹颖案”。
				</div>
				<div>
					留学人员安全一直是一个令人担心的话题。你或你身边的人在留学过程中感受到安全吗？在那里留学是一种怎样的体验，
					能有安全感吗？我们先来看看企鹅问答上的留学生们怎么说？
				</div>
				<img alt="" src="/static/image/2-1.jpg">
				<div>
					像我们凯斯西储大学，教学楼的门上，都会贴上，禁止携带武器的标志。当时刚去，看到这个标志被吓了一跳。
				</div> -->
				${detail.content }
			</div>
		</div>
		<!-- <div class="col-md-4">
			<div class="side-bar-card">
				<div class="card-title">相关推荐</div>
				<div class="card-body">
					<div class="list">
						<div class="item clearfix">
							<div class="col-xs-5 no-padding-h"><img src="/static/image/2-2.jpg"></div>
							<div class="col-xs-7">
								<div class="title">李克强：反腐败斗争压倒性态势已经形成并巩固发展</div>
								<div class="desc">15K阅读  1K评论</div>
							</div>
						</div>
						<div class="item clearfix">
							<div class="col-xs-5 no-padding-h"><img src="/static/image/2-2.jpg"></div>
							<div class="col-xs-7">
								<div class="title">李克强：五年来重点城市重污染天数减少一半</div>
								<div class="desc">15K阅读  1K评论</div>
							</div>
						</div>
						<div class="item clearfix">
							<div class="col-xs-5 no-padding-h"><img src="/static/image/2-2.jpg"></div>
							<div class="col-xs-7">
								<div class="title">李克强：反腐败斗争压倒性态势已经形成并巩固发展</div>
								<div class="desc">15K阅读  1K评论</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="side-bar-card">
				<div class="card-title">24小时热闻</div>
				<div class="card-body">
					<div class="list">
						<div class="item">
							<a class="title">李克强：反腐败斗争压倒性态势已经形成并巩固发展</a>
							<div class="desc">15K阅读  1K评论</div>
						</div>
						<div class="item">
							<div class="title">李克强：五年来重点城市重污染天数减少一半</div>
							<div class="desc">15K阅读  1K评论</div>
						</div>
						<div class="item">
							<div class="title">2018年GDP增长预期目标为6.5%左右</div>
							<div class="desc">15K阅读  1K评论</div>
						</div>
						<div class="item">
							<div class="title">好消息！移动网络流量资费年内至少降低30%</div>
							<div class="desc">15K阅读  1K评论</div>
						</div>
						<div class="item">
							<div class="title">个人所得税起征点将提高</div>
							<div class="desc">15K阅读  1K评论</div>
						</div>
					</div>
				</div>
			</div>
		</div> -->
		<div class="col-md-12" style="margin-top:6px;">
            <div class="panel panel-danger">
                <div class="panel-heading">
                    <h3 class="panel-title"><span class="glyphicon glyphicon-comment"></span>&nbsp;评论</h3>
                </div>
                <div class="panel-body">
                <c:if test="${empty user }">
                    <div class="alert alert-danger alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert">
                            <span aria-hidden="true">×</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <strong>请先<a href="/login" target="_blank" class="text-info">登录</a>，才可参与评论！</strong>
                    </div>
                </c:if>
                    <ol class="breadcrumb" style="margin-top:6px;">
                        <li>全部评论(${fn:length(commentList)})</li>
                    </ol>
                <c:if test="${not empty user }">
                    <form id="addCommForm" method="post" action="/addcomment" role="form" style="margin-bottom:6px;">
                    <input type="hidden" id="userId" name="userId" value="${user.id }"/>
                    <input type="hidden" id="detailId" name="detailId" value="${detail.id }"/>
                        <div class="form-group">
                            <div>
                                <label for="input_content">内容</label>
                                <textarea id="input_content" name="content"></textarea>
                                
                            </div>
                            <div class="col-xs-12" id="error_content"></div>
                        </div>
                        <input type="submit" class="btn btn-success" id="btn-sub" value="提交评论"></a>
                        <!-- <a class="btn btn-success" id="btn-sub"><span class="glyphicon glyphicon-edit"></span>&nbsp;提交评论</a> -->
                        <!-- <button class="btn btn-lg btn-primary btn-block" >提交评论</button> -->
                        &nbsp;
                        <input type="button" class="btn btn-danger" id="btn-coldetail" value="收藏文章" onclick="login()"></a>
                        <!-- <a class="btn btn-danger" id="btn-col"><span class="glyphicon glyphicon-heart"></span>&nbsp;收藏文章</a> -->
                    </form>
                </c:if>  
                    <ul class="commentList">
                    <!-- 循环遍历 -->
                    <c:forEach items="${pageInfo.list}"   var="comm">
                        <li class="item cl">
                            <a href="/user" >
                                <c:if test="${comm.headimage==null}">
                                <i class="avatar size-L radius">
                                    <img alt="50x50" width="50" height="50" src="holder.js/50x50" class="img-circle" style="border:1px solid #abcdef;">
                                </i>
                                </c:if>
                                <c:if test="${comm.headimage!=null}">
                                  
                                    <img  alt="50x50" width="50" height="50" src="${comm.headimage }" class="img-circle" style="border:1px solid #abcdef;width:50;height:50;float:left;">
                                    
                                </c:if>
                            </a>
                            
                            <div class="comment-main">
                                <header class="comment-header">
                                    <div class="comment-meta">
                                    	<c:if test="${comm.userName!=null}">
                                        <a class="comment-author" href="user.html">${comm.userName }</a>
                                        </c:if>
                                        <c:if test="${comm.userName==null}">
                                        <a class="comment-author" href="user.html">该用户尚未填写用户名</a>
                                        </c:if>
                                        评论于
                                        <time title="${comm.addtime }" datetime="${comm.addtime }">${comm.addtime }</time>
                                    </div>
                                </header>
                                <div class="comment-body">
                                <!-- （python使用 |safe过滤是html标签显示） -->
                                    <p>${comm.content}</p>
                                </div>                               
                            </div>
                            
                        </li>
                        </c:forEach>
                        <!-- #循环遍历 -->
                    </ul>
                    <div class="col-md-12 text-center">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li>
                                    <a href="/details?itemId=${detail.id}&pn=1" aria-label="First">
                                        <span aria-hidden="true">首页</span>
                                    </a>
                                </li>
                                
                                <c:if test="${pageInfo.hasPreviousPage}">
                                <li >
                                    <a href="/details?itemId=${detail.id}&pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                        <span aria-hidden="true">上一页</span>
                                    </a>
                                </li>
                                </c:if> 
                                <c:if test="${!pageInfo.hasPreviousPage}">
                                <li >
                                    <a href="#" aria-label="Previous">
                                        <span aria-hidden="true">上一页</span>
                                    </a>
                                </li>
                                </c:if> 
                                
                                
                                <!--循环遍历连续显示的页面，若是当前页就高亮显示，并且没有链接-->  
			                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">  
			                        <c:if test="${page_num == pageInfo.pageNum}">  
			                            <li class="active"><a href="#">${page_num}</a></li>  
			                        </c:if>  
			                        <c:if test="${page_num != pageInfo.pageNum}">  
			                            <li><a href="/details?itemId=${detail.id}&pn=${page_num}">${page_num}</a></li>  
			                        </c:if>  
			                    </c:forEach>
			                    <c:if test="${pageInfo.hasNextPage}">
                                <li>
                                    <a href="/details?itemId=${detail.id}&pn=${pageInfo.pageNum+1}" aria-label="Next">
                                        <span aria-hidden="true">下一页</span>
                                    </a>
                                </li>
			                    </c:if> 
			                    <c:if test="${!pageInfo.hasNextPage}">
			                                <li>
			                                    <a href="#" aria-label="Next">
			                                        <span aria-hidden="true">下一页</span>
			                                    </a>
			                                </li>
			                    </c:if>  
                                <li>
                                    <a href="/details?itemId=${detail.id}&pn=${pageInfo.pages}" aria-label="Last">
                                        <span aria-hidden="true">尾页</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>

                </div>
            </div>
        </div>
	</div>

	<!-- 页脚 -->
	<div class="footer">
		黑科身边事 © 2017 - 2018 黑龙江科技大学版权所有
	</div>

    <script src="/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>