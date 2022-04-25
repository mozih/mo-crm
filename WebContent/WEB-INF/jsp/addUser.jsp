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
<title>添加用户</title>
<link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
<script src="<%=basePath%>layui/layui.js"></script>
<script src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 20px;">
		<legend>添加系统用户</legend>
	</fieldset>
	<form class="layui-form" action="<%=basePath%>user/saveAddUser">
		<div class="layui-form-item">
			<label class="layui-form-label">用户名：</label>
			<div class="layui-input-inline">
				<input name="user_name" required lay-verify="required" value=""
					class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">密码：</label>
			<div class="layui-input-inline">
				<input name="user_password" required lay-verify="required|pwd" lay-reqTest="密码不能为空"
					class="layui-input">
			</div>
			<label class="layui-form-label" style="width: 140px" >请再输入一次密码：</label>
			<div class="layui-input-inline">
				<input required lay-verify="required|confirmPass"
					class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">权限类型：</label>
			<div class="layui-input-block">
				<select name="user_aut" lay-verify="required">
					<option value=""></option>
					<option value="超级管理员">超级管理员</option>
					<option value="普通用户">普通用户</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">电话：</label>
			<div class="layui-input-inline">
				<input name="user_phone" required lay-verify="required"
					 class="layui-input">
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
			form.verify({
				confirmPass: function(value){
					if($('input[name=user_password]').val() !== value)
						return '两次密码输入不一致!';
				}
			});
			//监听提交
			form.on('submit(formDemo)', function(data) {
				layer.msg(JSON.stringify(data.field));
				if(data.true)
					alert(新增用户成功);
				return true;
			});
		});
		
	</script>
</body>
</html>