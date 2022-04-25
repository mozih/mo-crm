<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mo" uri="http://mo.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>系统用户管理</title>
<link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
<script src="<%=basePath%>layui/layui.js"></script>
<script src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 20px;">
		<legend>查询条件</legend>
	</fieldset>

	<form action="<%=basePath%>user/list" class="layui-form" method="post" id="searchFrm">
		<div class="layui-form-item">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">用户名:</label>
					<div class="layui-input-inline">
						<input type="text" name="user_name" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">电话:</label>
					<div class="layui-input-inline">
						<input type="text" name="user_phone" autocomplete="off"
							class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">权限类型:</label>
					<div class="layui-input-inline">
						<input type="radio" name="user_aut" value="超级管理员" title="超级管理员">
						<input type="radio" name="user_aut" value="普通用户" title="普通用户">
					</div>
				</div>
				<div class="layui-inline"
					style="text-align: center; padding-left: 30px;">
					<div class="layui-input-inline">
						<button type="submit"
							class="layui-btn layui-btn-normal  layui-icon layui-icon-search"
							id="doSearch">查询</button>
						<button type="reset"
							class="layui-btn layui-btn-warm  layui-icon layui-icon-refresh">重置</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 搜索条件结束 -->
	<!-- 数据表格开始 -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<fieldset class="layui-elem-field layui-field-title"
					style="margin-top: 20px;">
					<legend>客户信息列表</legend>
				</fieldset>
				<!-- /.panel-heading -->
				<table class="layui-table">
					<colgroup>
						<col width="150">
						<col width="200">
						<col>
					</colgroup>
					<thead>
						<tr>
							<th>#</th>
							<th>用户名</th>
							<th>电话</th>
							<th>权限</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.rows}" var="row">
							<tr>
								<td>${row.user_id}</td>
								<td>${row.user_name}</td>
								<td>${row.user_phone}</td>
								<td>${row.user_aut}</td>
								<td>${row.user_state}</td>
								<td>
									<c:if test="${userInf.user_aut eq '超级管理员'}">
										<div class="layui-inline">
											<button class="layui-btn"
												onclick="window.location.href='updateUser?id=${row.user_id}'">修改</button>
										</div>
										<div class="layui-inline">
											<button class="layui-btn"
												onclick="deleteUser(${row.user_id})">删除</button>
										</div>
										<c:if test="${row.user_state == 1}">
											<button class="layui-btn layui-btn-danger"
												onclick="window.location.href='updateUserState?id=${row.user_id}'">禁用</button>
										</c:if>
										<c:if test="${row.user_state == 0}">
											<button class="layui-btn"
												onclick="window.location.href='updateUserState?id=${row.user_id}'">启用</button>
										</c:if>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="layui-laypage">
					<mo:page
						url="${pageContext.request.contextPath }/user/list.action" />
				</div>
				<!-- /.panel-body  -->
				<c:if test="${userInf.user_aut eq '超级管理员'}">
				<div class="layui-input-inline" style="position: absolute;right: 220px">
					<button onclick="window.location.href='addUser'"
						class="layui-bg-red layui-btn layui-btn-warm  layui-icon layui-icon-addition">新建客户</button>
				</div>
				</c:if>
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<script type="text/javascript">
	function deleteUser(id) {
		if(confirm("确实要删除该用户吗?")) {
			$.post("<%=basePath%>user/delete.action",
					{"id":id},
					function(data){
				alert("用户删除更新成功！");
				window.location.reload();
			});
		}
	}

</script>
</body>
</html>