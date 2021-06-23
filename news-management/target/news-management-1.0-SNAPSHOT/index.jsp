<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.wukong.pojo.User" %>
<%
    System.out.println("输出标记");
    String path = request.getContextPath();
    System.out.println("my ContextPath is " + path);
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    System.out.println(" my basePath is " + basePath);
%>
<!DOCTYPE html>
<html>
<head>
  <%--  <base href="<%=basePath%>">--%>

    <title>仿新浪新闻首页</title>
    <meta name="keywords" content="新浪新闻,新浪网,新闻中心" >
    <meta name="description" content="新浪新闻，人人都在用的综合资讯App，聚集时政、
    民生、财经、科技、娱乐、体育、游戏等全领域热点内容，帮助用户一榜览尽全网热点。">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css">

</head>
<body>
<!--页面顶部-->
<div id="header">
    <div class="main-top">
        <div class="logo"><a href=""><span>新浪新闻平台</span></a></div>
        <span>
                    <%
                        if (session != null) {
                            User loginUser = (User) session.getAttribute("loginUser");
                            if (loginUser != null) {
                                String username = loginUser.getUsername();
                                out.print("欢迎您，"+username);
                            }else  {
                                out.print("请登录");
                            }
                        }
                    %>
            </span>
        <div class="login-box">
            <form action="<%=request.getContextPath()%>/LoginServlet" method="post">
                <label for="usernameId">用户名<input  id="usernameId" type="text" name="uname" value="" placeholder="请输入用户名" /></label>
                <label for="passwordId">密码<input id="passwordId" type="text" name="upassword"  placeholder="请输入密码"/></label>
                <button type="submit"> 登陆</button>
            </form>


        </div>

        <div class="nav">
            <ul class="clearfix">
                <li><a href="#">首页</a></li>
                <li><a href="#">新浪博客</a></li>
                <li><a href="#">新浪微博</a></li>
                <li><a href="#">用户注册</a></li>
                <li><a href="<%= request.getContextPath() %>/LogoutServlet">用户退出</a></li>
            </ul>
        </div>
    </div>
    <!--banner-->
    <div class="main-banner">
        <img alt="加载失败" src="<%=request.getContextPath() %>/images/banner.png" />
    </div>
    <!--搜索横框-->
    <div class="search-box">
        <div class="sl">
            <div class="sr clearfix">

                <span class="left-search clearfix">
                    <label for="searchId">站内搜索<input id="searchId" type="text" name="keyword" value="关键词" /></label><button class="go-btn"></button>
                </span>
                <span class="right-link">
                    <label for="selectId">快速链接<select id="selectId"><option>-----专题选择-----</option></select></label><button class="go-btn"></button>
                </span>

            </div>
        </div>
    </div>
</div>
<!--d页面主体-->
<div id="content" class="main-content clearfix">
    <!--主体的的左边部分-->
    <div class="main-content-left">
        <!--新闻专题分类-->
        <div class="class-box">
            <div class="class-box-header">
                <span class="fr"><a href="#">更多...</a></span>
                <h3>新闻专题</h3>
            </div>
            <div class="class-box-content">
                <ul>
                    <li><a href="#">国内</a></li>
                    <li><a href="#">国际</a></li>
                    <li><a href="#">娱乐</a></li>
                    <li><a href="#">军事</a></li>
                    <li><a href="#">财经</a></li>
                    <li><a href="#">天气</a></li>
                    <li class="clear-bottom-line"><a href="#">科技</a></li>
                </ul>
            </div>
        </div>
        <!--最新新闻-->
        <div class="left-box">
            <div class="left-box-tbg">
                <div class="left-box-bbg">
                    <div class="left-box-header"><h3><a href="#">最新新闻</a></h3></div>
                    <div class="left-box-content">
                        <ul>
                            <li><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                            <li><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                            <li><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--最新评论-->
        <div class="left-box">
            <div class="left-box-tbg">
                <div class="left-box-bbg">
                    <div class="left-box-header"><h3>最新评论</h3></div>
                    <div class="left-box-content">
                        <ul>
                            <li><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                            <li><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                            <li><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--页面主体的右部，包括新闻的列表和评论内容 -->
    <div class="main-content-right">
        <!--各专题的新闻列表-->
        <div class="main-text-box">
            <div class="main-text-box-tbg">
                <div class="main-text-box-bbg">

                    <div class="main-text-box-header">
                        <h3>即时新闻</h3>
                    </div>
                    <div class="main-text-box-content">
                        <ul class="news-list-ul clearfix">
                            <li><span>2021-6-20 11:30:30</span><a href="<%=request.getContextPath()%>/pages/newsDetail.jsp">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                            <li><span>2021-6-20 11:30:30</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                            <li><span>2021-6-20 11:30:30</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                            <li><span>2021-6-20 11:30:30</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                            <li class="li-line"><span>2021-6-20 11:30:30</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>

                            <li><span>2021-6-20 11:30:30</span><a href="#">J神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                            <li><span>2021-6-20 11:30:30</span><a href="#">U神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                            <li><span>2021-6-20 11:30:30</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                            <li><span>2021-6-20 11:30:30</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                            <li class="li-line"><span>2021-6-20 11:30:30</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>

                            <li><span>2021-6-20 11:30:30</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                            <li><span>2021-6-20 11:30:30</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                            <li><span>2021-6-20 11:30:30</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                            <li><span>2021-6-20 11:30:30</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                            <li class="li-line"><span>2021-6-20 11:30:30</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>

                            <li><span>2021-6-20 11:30:30</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                            <li><span>2021-6-20 11:30:30</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                            <li><span>2021-6-20 11:30:30</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                            <li><span>2021-6-20 11:30:30</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                            <li class="li-line"><span>2021-6-20 11:30:30</span><a href="#">神舟十二号航天员出征仪式在酒泉卫星发射中心</a></li>
                        </ul>
                    </div>
                    <!--图片新闻-->
                    <div class="news-pic">
                        <dl>
                            <dt><img alt="" src="<%=request.getContextPath() %>/images/new-1.png" /></dt>
                            <dd>爱人民篇章</dd>
                        </dl>
                        <dl>
                            <dt><img  alt="" src="<%=request.getContextPath() %>/images/new-2.png" /></dt>
                            <dd>关注热点</dd>
                        </dl>
                        <dl>
                            <dt><img  alt="" src="<%=request.getContextPath() %>/images/new-3.png" /></dt>
                            <dd>影像战役</dd>
                        </dl>
                        <dl>
                            <dt><img  alt="" src="<%=request.getContextPath() %>/images/new-4.png" /></dt>
                            <dd>新闻新时期</dd>
                        </dl>
                    </div>
                    <div class="page-bar">
                        <ul class="page-num-ul clearfix">
                            <li><a href="#">上一页</a><li>
                            <li><a href="#" class="thisclass">1</a><li>
                            <li><a href="#">2</a><li>
                            <li><a href="#">3</a><li>
                            <li><a href="#">4</a><li>
                            <li><a href="#">5</a><li>
                            <li><a href="#">下一页</a><li>
                        </ul>
                        <span class="page-go-form">
                            <label for="jumpId">跳转至<input id="jumpId" type="text" name="numkey" class="page-key" /></label>页<button type="submit" class="page-btn">GO</button></span>
                    </div>
                </div>
            </div>
        </div>
        <!--合作媒体-->
        <div class="main-text-box">
            <div class="main-text-box-tbg">
                <div class="main-text-box-bbg">
                    <div class="main-text-box-header">
                        <h3>合作媒体</h3>
                    </div>
                    <div class="main-text-box-content">
                        <ul class="link-text-ul clearfix">
                            <li><a href="#">中国政府网</a></li>
                            <li><a href="#">中国政府网</a></li>
                            <li><a href="#">中国政府网</a></li>
                            <li><a href="#">中国政府网</a></li>
                            <li><a href="#">中国政府网</a></li>
                            <li><a href="#">中国政府网</a></li>
                            <li><a href="#">中国政府网</a></li>
                            <li><a href="#">中国政府网</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--页面底部-->
<div id="footer" class="main-footer-box">
    24小时客户服务热线：010-12345678 常见问题解答 新闻热线：010-12345678<br />
    文明办网文明上网举报电话：010-010-12345678 举报邮箱：1390128154@qq.com<br />
    CopyRight&copy;2021-2099 News China gov,All Right Reserved.<br />
    新闻中心版权所有
</div>
</body></html>