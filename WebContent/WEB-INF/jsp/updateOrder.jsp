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
<title>修改订单信息</title>
<link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
<script src="<%=basePath%>layui/layui.js"></script>
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 20px;">
		<legend>修改订单信息</legend>
	</fieldset>
	<form class="layui-form" action="<%=basePath%>order/update">
		<div class="layui-form-item">
			<label class="layui-form-label">订单编号：</label>
			<div class="layui-input-inline">
				<input name="order_id" required lay-verify="required"
					value="${orderInf.order_id}" class="layui-input">
			</div>
			<label class="layui-form-label">客户名称：</label>
			<div class="layui-input-inline">
				<input name="order_studname" required lay-verify="required"
					value="${orderInf.order_studname}" class="layui-input">
			</div>
			<label class="layui-form-label">经办人:</label>
			<div class="layui-input-inline">
				<input readonly="readonly" type="text"
					value="${orderInf.order_username}" autocomplete="off"
					class="layui-input">
			</div>
			<div class="layui-form-mid layui-word-aux">不可修改</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">订单类型：</label>
			<div class="layui-input-block">
				<select name="order_type" lay-verify="required">
					<option value="${orderInf.order_type}"></option>
					<option value="包年">包年</option>
					<option value="包月">包月</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">订单价格：</label>
			<div class="layui-input-inline">
				<input name="order_price" required lay-verify="required"
					value="${orderInf.order_price}" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-inline">
				<input readonly="readonly" style="display: none;" name="id" required
					lay-verify="required" value="${orderInf.id}" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>

	<script>
		//Demo
		layui.use('form', function() {
			var form = layui.form;

			//监听提交
			form.on('submit(formDemo)', function(data) {
				layer.msg(JSON.stringify(data.field));
				alert("订单更新成功");
				return true;
			});
		});
	</script>
</body>
</html>