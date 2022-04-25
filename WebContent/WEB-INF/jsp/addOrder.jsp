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
<title>添加订单</title>
<link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
<script src="<%=basePath%>layui/layui.js"></script>
<script src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 20px;">
		<legend>添加新订单</legend>
	</fieldset>
	<form class="layui-form" action="<%=basePath%>order/saveAddOrder">
		<div class="layui-form-item">
			<label class="layui-form-label">订单编号：</label>
			<div class="layui-input-inline">
				<input name="order_id" required lay-verify="required" value=""
					class="layui-input">
			</div>
			<label class="layui-form-label">客户名称：</label>
			<div class="layui-input-inline">
				<input name="order_studname" required lay-verify="required" value=""
					class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">订单类型：</label>
			<div class="layui-input-block">
				<select id="order_type" name="order_type" lay-verify="required">
					<option value=""></option>
					<option value="包年">包年</option>
					<option value="包月">包月</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">订单价格：</label>
			<div class="layui-input-inline">
				<input id="order_price" name="order_price" required lay-verify="required"
					 class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">经办人:</label>
			<div class="layui-input-inline">
				<input readonly="readonly" type="text" name="order_username" value="${username}"
					autocomplete="off" class="layui-input">
			</div>
			<div class="layui-form-mid layui-word-aux">默认登录系统用户</div>
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
				if(data.true)
					alert(新增订单成功);
				return true;
			});
		});
	</script>
</body>
</html>