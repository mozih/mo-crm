<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>校园宽带办理系统</title>
  <link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
  <script src="<%=basePath%>layui/layui.js"></script>
  <script src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
  <div class="layui-logo layui-hide-xs layui-bg-black">校园宽带办理系统V2.0</div>
    <!-- 头部区域（可配合layui 已有的水平导航） -->
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item layui-hide layui-show-md-inline-block">
        <a href="javascript:;">
          <img src="//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" class="layui-nav-img">
          ${USER.user_name }
        </a>
        <dl class="layui-nav-child">
          <dd><a href=""><i class="layui-icon layui-icon-user"></i><cite>&nbsp&nbsp个人资料</cite></a></dd>
          <dd><a href=""><i class="layui-icon layui-icon-set"></i><cite>&nbsp&nbsp修改密码</cite></a></dd>
          <dd><a href="<%=basePath%>exitlogin"><i class="layui-icon layui-icon-logout"></i><cite>&nbsp&nbsp退出登录</cite></a></dd>
        </dl>
      </li>
      <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
        <a href="javascript:;">
          <i class="layui-icon layui-icon-more-vertical"></i>
        </a>
      </li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree" lay-filter="test">
      	<li class="layui-nav-item"><a href="<%=basePath%>index" target="myiframe"><i class="layui-icon layui-icon-home"></i><cite>&nbsp&nbsp系统首页</cite></a></li>
        <li class="layui-nav-item">
          <a href="javascript:;"><i class="layui-icon layui-icon-align-left"></i><cite>&nbsp&nbsp业务管理</cite></a>
          <dl class="layui-nav-child">
            <dd><a href="<%=basePath%>order/list" target="myiframe"><i class="layui-icon layui-icon-form"></i><cite>&nbsp&nbsp订单管理</cite></a></dd>
            <dd><a href="<%=basePath%>order/addOrder" target="myiframe"><i class="layui-icon layui-icon-release"></i><cite>&nbsp&nbsp添加订单</cite></a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a href="<%=basePath%>customer/list" target="myiframe"><i class="layui-icon layui-icon-group"></i><cite>&nbsp客户管理</cite></a></li>
        <li class="layui-nav-item">
          <a href="javascript:;"><i class="layui-icon layui-icon-set"></i><cite>&nbsp&nbsp系统管理</cite></a>
          <dl class="layui-nav-child">
            <dd><a href="<%=basePath%>user/list" target="myiframe"><i class="layui-icon layui-icon-friends"></i><cite>&nbsp&nbsp角色管理</cite></a></dd>
            <dd><a href="javascript:;" target="myiframe"><i class="layui-icon layui-icon-about"></i><cite>&nbsp&nbsp关于</cite></a></dd>
          </dl>
        </li>
      </ul>
    </div>
  </div>
  <div class="layui-body">
	<iframe style="width: 100%;height: 100%" name="myiframe" id="myiframe" src="<%=basePath%>index"></iframe>
  </div>
</div>

<script>
//JS 
layui.use(['element', 'layer', 'util'], function(){
  var element = layui.element
  ,layer = layui.layer
  ,util = layui.util
  ,$ = layui.$;
  //头部事件
  util.event('lay-header-event', {
    //左侧菜单事件
    menuLeft: function(othis){
      layer.msg('展开左侧菜单的操作', {icon: 0});
    }
    ,menuRight: function(){
      layer.open({
        type: 1
        ,content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
        ,area: ['260px', '100%']
        ,offset: 'rt' //右上角
        ,anim: 5
        ,shadeClose: true
      });
    }
  });
  
});
</script>
</body>
</html>