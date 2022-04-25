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
<title>客户管理</title>
<link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
<script src="<%=basePath%>layui/layui.js"></script>
<script src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 20px;">
		<legend>查询条件</legend>
	</fieldset>

	<form action="<%=basePath%>customer/list" class="layui-form" method="post" id="searchFrm">
		<div class="layui-form-item">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">学号:</label>
					<div class="layui-input-inline">
						<input type="text" name="stud_number" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">客户姓名:</label>
					<div class="layui-input-inline">
						<input type="text" name="studName" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">专业:</label>
					<div class="layui-input-inline">
						<input type="text" name="stud_professional" autocomplete="off"
							class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label" style="width: 90px;">客户创建时间:</label>
					<div class="layui-input-inline" style="padding: 5px">
						<input type="text" class="layui-input" id="month"
							readonly="readonly" placeholder="yyyy-mm"
							style="height: 30px; border-radius: 10px" name="stud_createtime">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">客户类型:</label>
					<div class="layui-input-inline">
						<input type="radio" name="stud_level" value="包年客户" title="包年客户">
						<input type="radio" name="stud_level" value="包月客户" title="包月客户">
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
							<th>学号</th>
							<th>客户姓名</th>
							<th>专业</th>
							<th>客户类型</th>
							<th>电话</th>
							<th>地址</th>
							<th>创建时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.rows}" var="row">
							<tr>
								<td>${row.stud_id}</td>
								<td>${row.stud_number}</td>
								<td>${row.stud_name}</td>
								<td>${row.stud_professional}</td>
								<td>${row.stud_level}</td>
								<td>${row.stud_phone}</td>
								<td>${row.stud_address}</td>
								<td>${row.stud_createtime}</td>
								<td>
									<div class="layui-inline">
										<button class="layui-btn"
											onclick="window.location.href='updateCustomer?id=${row.stud_id}'">修改</button>
									</div>
									<div class="layui-inline">
										<button class="layui-btn"
											onclick="deleteCustomer(${row.stud_id})">删除</button>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="layui-laypage">
					<mo:page
						url="${pageContext.request.contextPath }/customer/list.action" />
				</div>
				<!-- /.panel-body  -->
				<div class="layui-input-inline" style="position: absolute;right: 53px">
					<button onclick="window.location.href='addCustomer'"
						class="layui-bg-red layui-btn layui-btn-warm  layui-icon layui-icon-addition">新建客户</button>
				</div>
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<script type="text/javascript">
	function deleteCustomer(id) {
		if(confirm("确实要删除该客户吗?")) {
			$.post("<%=basePath%>customer/delete.action",
					{"id":id},
					function(data){
				alert("客户删除更新成功！");
				window.location.reload();
			});
		}
	}
	
    layui.use(['jquery', 'layer', 'form', 'table', 'laydate'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var laydate = layui.laydate;

        laydate.render({
            elem: '#month',
            type: 'month',
            value:new Date()
        });

        $("#doSearch").click(function () {
            getData();
        });

        function getData() {
            var year = $("#month").val();

            if (year===""){
                year=new Date().getFullYear();
            }
        }
    });

</script>
</body>
</html>