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
<title>添加客户</title>
<link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
<script src="<%=basePath%>layui/layui.js"></script>
<script src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 20px;">
		<legend>添加新客户</legend>
	</fieldset>
	<form class="layui-form" action="<%=basePath%>customer/saveAddCustomer">
		<div class="layui-form-item">
			<label class="layui-form-label">客户名称：</label>
			<div class="layui-input-inline">
				<input name="stud_name" required lay-verify="required"
					 class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">学号：</label>
			<div class="layui-input-inline">
				<input name="stud_number" required lay-verify="required"
					 class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">专业：</label>
			<div class="layui-input-inline">
				<input name="stud_professional" required lay-verify="required"
					 class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">客户类型：</label>
			<div class="layui-input-block">
				<select name="stud_level" lay-verify="required">
					<option></option>
					<option value="包年客户">包年客户</option>
					<option value="包月客户">包月客户</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">手机：</label>
			<div class="layui-input-inline">
				<input name="stud_phone" required lay-verify="required"
					class="layui-input">
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">地址：</label>
			<div class="layui-input-block">
				<textarea name="stud_address" required lay-verify="required"
					placeholder="请输入内容" class="layui-textarea"></textarea>
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
				if(data.true)
					alert(新增客户成功);
				return true;
			});
		});
	</script>
</body>
</html>