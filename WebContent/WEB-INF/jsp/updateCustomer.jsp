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
<title>修改客户信息</title>
<link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
<script src="<%=basePath%>layui/layui.js"></script>
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 20px;">
		<legend>修改客户信息</legend>
	</fieldset>
	<form class="layui-form" action="<%=basePath%>customer/update">
		<div class="layui-form-item">
			<label class="layui-form-label">客户名称：</label>
			<div class="layui-input-inline">
				<input name="stud_name" required lay-verify="required"
					value="${studentInf.stud_name}" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">学号：</label>
			<div class="layui-input-inline">
				<input name="stud_number" required lay-verify="required"
					value="${studentInf.stud_number}" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">专业：</label>
			<div class="layui-input-inline">
				<input name="stud_professional" required lay-verify="required"
					value="${studentInf.stud_professional}" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">客户类型：</label>
			<div class="layui-input-block">
				<select name="stud_level" lay-verify="required">
					<option value="${studentInf.stud_level}"></option>
					<option value="包年客户">包年客户</option>
					<option value="包月客户">包月客户</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">手机：</label>
			<div class="layui-input-inline">
				<input name="stud_phone" required lay-verify="required"
					value="${studentInf.stud_phone}" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">地址：</label>
			<div class="layui-input-block">
				<textarea name="stud_address"
					placeholder="请输入内容" class="layui-textarea"></textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-inline">
				<input readonly="readonly" style="display: none;" name="stud_id"
					required lay-verify="required" value="${studentInf.stud_id}"
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

			//监听提交
			form.on('submit(formDemo)', function(data) {
				layer.msg(JSON.stringify(data.field));
				alert("客户更新成功");
				return true;
			});
		});
	</script>
</body>
</html>