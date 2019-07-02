<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>后台登录</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/logincss/style.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/layui/css/layui.css"/>
<style>
body {
	height: 100%; /* background: #16a085; */
	background: #000;
	overflow: hidden;
}

canvas {
	z-index: -1;
	position: absolute;
}
</style>
<script src="${pageContext.request.contextPath}/statics/js/jquery-3.2.1.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/statics/layui/lay/modules/layer.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/statics/loginjs/verificationNumbers.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/statics/loginjs/Particleground.js" type="text/javascript"></script>
<script>
	$(document).ready(function() {
		//粒子背景特效
		$('body').particleground({
			dotColor : '#6ab0d2',
			lineColor : '#517caf'
		/*dotColor : '#5cbdaa',
		lineColor : '#5cbdaa' */
		});
		//验证码
		createCode();
		//测试提交，对接程序删除即可
		/* $(".submit_btn").click(function() {
			//if(validate()){
			location.href = "${pageContext.request.contextPath}/index";
			//}
		}); */
		var result="${result}";
		if(result!=""){
			layer.open({
				  title: '友情提示'
				  ,content: result
			});  
		}
	});
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath}/doLogin" method="post">
	<dl class="admin_login">
		<dt>
			<strong>管理系统</strong> <em>Management System</em>
		</dt>
		<dd class="user_icon">
			<input type="text" placeholder="账号" value="lzl" name="loginName" class="login_txtbx" />
		</dd>
		<dd class="pwd_icon">
			<input type="password" placeholder="密码" value="lzl" name="password" class="login_txtbx" />
		</dd>
		<dd class="val_icon">
			<div class="checkcode">
				<input type="text" id="J_codetext" placeholder="验证码" maxlength="4"
					class="login_txtbx">
				<canvas class="J_codeimg" id="myCanvas" onclick="createCode()">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
			</div>
			<input type="button" value="验证码核验" class="ver_btn"
				onClick="validate();">
		</dd>
		<dd>
			<input type="submit" value="立即登陆" class="submit_btn" />
		</dd>
		<dd>
			<!-- <p>© 2018-2030 李智伦工作室版权所有</p>
			<p>联系电话:180xxxx1195 微信同步</p> -->
		</dd>
	</dl>
	</form>
</body>
</html>
