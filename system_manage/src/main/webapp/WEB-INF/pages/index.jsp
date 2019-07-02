<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>管理系统</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/x-admin.css" media="all">
	</head>
	<body>
		<div class="layui-layout layui-layout-admin">
			<div class="layui-header header header-demo">
				<div class="layui-main">
					<div class="admin-logo-box">
						<a class="logo" href="http://www.baidu.net" title="logo">管理系统</a>
						<div class="larry-side-menu">
							<i class="fa fa-th-large" aria-hidden="true"></i>
						</div>
					</div>
					<ul class="layui-nav layui-layout-left layui-ygyd-menu" style="position:absolute; left:250px;">
						<li class="layui-nav-item">
							<a href="mailto:2564218927@qq.com">联系我们</a>
						</li>
					</ul>

					<ul class="layui-nav" lay-filter="">
						<li class="layui-nav-item" id="timetable">
						</li>
						<li class="layui-nav-item">
							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
						</li>
						<li class="layui-nav-item"><img src="${pageContext.request.contextPath}/statics/images/huangjin.jpg" class="layui-circle" style="border: 1px solid #A9B7B7; width:45px; height:35px;"></li>
						<li class="layui-nav-item">
							<a href="javascript:;">${sessionScope.user.username}</a>
							<dl class="layui-nav-child">
								<dd>
									<a href="${pageContext.request.contextPath}/loginOut">个人资料</a>
								</dd>
								<dd>
									<a href="javascript:void(0);" id="loginout">退出</a>
								</dd>
							</dl>
						</li>
						<li class="layui-nav-item x-index" style="margin-left:10px;">
							<img style="width:45px;height:40px;border-radius:50%;maigin-left:10px;" src="${pageContext.request.contextPath}/statics/images/timg.jpg">
						</li>
					</ul>
				</div>
			</div>
			<div class="layui-side layui-bg-black x-side" style="left:-200px;">
				<div class="layui-side-scroll">
					<ul class="layui-nav layui-nav-tree site-demo-nav" lay-filter="side">
						<c:forEach items="${menus}" var="menu">
							<c:if test="${menu.menuList !=null}">
								<c:set var="size" value="${fn:length(menu.menuList)}"></c:set>
								<c:if test="${size>0}">
									<li class="layui-nav-item">
											<a class="javascript:;" href="javascript:;"> <i class="layui-icon" style="top: 3px;">${menu.icon}</i><cite>${menu.menuname}</cite></a>
										<c:forEach items="${menu.menuList}" var="m">
											<dl class="layui-nav-child">
												<dd class="">
													<dd class="">
														<a href="javascript:;" _href="${pageContext.request.contextPath}/${m.url}"> <cite>${m.menuname}</cite> </a>
													</dd>
												</dd>
											</dl>
										</c:forEach>
									</li>
								</c:if>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="layui-tab layui-tab-card site-demo-title x-main" lay-filter="x-tab" lay-allowclose="true" style="left: 0px;border-left: solid 2px #2299ee;">
				<ul class="layui-tab-title">
					<li class="layui-this"> 我的桌面 <i class="layui-icon layui-unselect layui-tab-close">ဆ</i> </li>
				</ul>
				<div class="layui-tab-content site-demo site-demo-body">
					<div class="layui-tab-item layui-show">
						<iframe frameborder="0" src="" class="x-iframe"></iframe>
					</div>
				</div>
			</div>
			<div class="site-mobile-shade"> </div>
		</div>
		<script src="${pageContext.request.contextPath}/statics/loginjs/jquery.js"></script>
		<script src="${pageContext.request.contextPath}/statics/lib/layui/layui.js" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/statics/js/x-admin.js">
		</script>
		<script type="text/javascript">
			function get_time() {
				var date = new Date();
				var year = "",
					month = "",
					day = "",
					week = "",
					hour = "",
					minute = "",
					second = "";
				year = date.getYear();
				month = add_zero(date.getMonth() + 1);
				day = add_zero(date.getDate());
				week = date.getDay();
				switch(date.getDay()) {
					case 0:
						val = "星期天";
						break
					case 1:
						val = "星期一";
						break
					case 2:
						val = "星期二";
						break
					case 3:
						val = "星期三";
						break
					case 4:
						val = "星期四";
						break
					case 5:
						val = "星期五";
						break
					case 6:
						val = "星期六";
						break
				}
				hour = add_zero(date.getHours());
				minute = add_zero(date.getMinutes());
				second = add_zero(date.getSeconds());
				timetable.innerText = "现在时间:" + hour + ":" + minute + ":"+ second + val;
			}

			function add_zero(temp) {
				if(temp < 10) return "0" + temp;
				else return temp;
			}
			setInterval("get_time()", 1000);
			$("#loginout").on('click',function(){
				var flag=confirm("您确定要退出本次登录吗?");
				if(flag){
					location.href="${pageContext.request.contextPath}/admin/loginout";
				}
			});		
		</script>
	</body>
</html>