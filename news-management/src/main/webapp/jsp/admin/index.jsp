<%@ page import="com.wukong.tool.Constant" %>
<%@ page import="com.wukong.pojo.User" %>
<%@ page import="com.wukong.service.news.NewsService" %>
<%@ page import="com.wukong.service.news.NewsServiceImpl" %>
<%@ page import="com.wukong.pojo.News" %>
<%@ page import="java.util.List" %>
<%@ page import="com.wukong.service.user.UserService" %>
<%@ page import="com.wukong.service.user.UserServiceImpl" %>
<%@ page import="com.wukong.pojo.Category" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台首页</title>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css"/>
</head>

<body>
<!--页面顶部-->
<%@include file="common/header.jsp"%>

<!--主体-->
<div id="content" class="main-content clearfix">
    <%--左侧边栏内容--%>
    <%@include file="common/left.jsp"%>

    <div class="main-content-right">
        <!--即时新闻-->
        <div class="main-text-box">
            <div class="main-text-box-tbg">
                <div class="main-text-box-bbg">
                    <form name="searchForm" id="searchForm" action="<%=request.getContextPath() %>/jsp/admin/index.jsp"
                          method="post">
                        <div>
                            新闻分类：
                            <label>
                                <select name="categoryId" id="categoryId">
                                    <option value="0">请选择</option>
                                </select>
                            </label>
                            新闻标题<label for="title"><input type="text" name="title" id="title" value=''/></label>
                            <button type="submit" class="page-btn">GO</button>
                            <button type="button" onclick="addNews();" class="page-btn">增加</button>
                            <input type="hidden" name="currentPageNo" value="1"/>
                            <input type="hidden" name="pageSize" value="10"/>
                            <input type="hidden" name="totalPageCount" value="2"/>
                        </div>
                    </form>
                    <table cellpadding="1" cellspacing="1" class="admin-list">
                        <thead>
                        <tr class="admin-list-head">
                            <th>新闻标题</th>
                            <th>作者</th>
                            <th>时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            // 访问index.jsp 文件，获得新闻列表
                            NewsService newsService = new NewsServiceImpl();
                            List<News> newsListPages = newsService.getNewsListPages(1, Constant.PAGE_SIZE);
                            UserService userService = new UserServiceImpl();
                            for (News news :
                                    newsListPages) {
                                // 循环遍历 tr 标签
                        %>
                                    <tr>
                                        <td><a href='<%=request.getContextPath() %>/jsp/admin/index.jsp?id=2'><%=news.getTitle() %>
                                        </a></td>
                                        <%-- 将创建人id 转换成 创建人姓名--%>
                                        <td><%=userService.getUserById(news.getCreateBy()).getUsername() %>
                                        </td>
                                        <td><%=news.getCreateDate() %>
                                        </td>
                                        <td><a href='<%=request.getContextPath() %>/jsp/admin/index.jsp?id=2'>修改</a>
                                            <a href="javascript:if(confirm('确认是否删除此新闻？')) location='adminNewsDel.jsp?id=2'">删除</a>
                                        </td>
                                    </tr>

                        <%    }

                        %>



                        </tbody>
                    </table>
                    <div class="page-bar">
                        <ul class="page-num-ul clearfix">
                            <li>共7条记录&nbsp;&nbsp; 1/2页</li>
                            <a href="javascript:page_nav(document.forms[0],2);">下一页</a>
                            <a href="javascript:page_nav(document.forms[0],2);">最后一页</a>&nbsp;&nbsp;
                        </ul>
                        <span class="page-go-form"><label>跳转至</label>
	     <label for="inputPage"><input type="text" name="inputPage" id="inputPage" class="page-key"/>页</label>
	     <button type="button" class="page-btn"
                 onClick='jump_to(document.forms[0],document.getElementById("inputPage").value)'>GO</button>
		</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>
<script src="<%=request.getContextPath()%>/js/admin/index.js"></script>
</body>
</html>