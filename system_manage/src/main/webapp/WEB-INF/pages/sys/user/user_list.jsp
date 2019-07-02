<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户列表</title>
<%@ include file="../../public/public.jsp" %>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>搜索条件</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content whj-padding">
                            <div class="form-group">
                                <ul class="ulist">
									<li>
									<span class="fl labeltext">真实姓名：</span>
										<div class="fl">
											<input type="search" class="form-control" id="username" placeholder="请输入用户真实姓名">
										</div>

										<div class="clear"></div>
									</li>
									<li>
									<span class="fl labeltext">登录名：</span>
										<div class="fl">
											<input type="search" class="form-control" id="loginname" placeholder="请输入登陆名">
										</div>

										<div class="clear"></div>
									</li>
									<li>
									<span class="fl labeltext">联系电话：</span>
										<div class="fl">
											<input type="search" class="form-control" id="tell" placeholder="请输入联系电话">
										</div>

										<div class="clear"></div>
									</li>
									<li>
										<span class="fl labeltext">性别：</span>
											<div class="fl">
												<select id="sex" class="form-control">
													<option value="">-请选择-</option>
													<option value="男">男</option>
													<option value="女">女</option>
												</select> 
											</div>
											<div class="clear"></div>
									</li>
									<li>
										<span class="fl labeltext">所属角色：</span>
											<div class="fl">
												<select id="role"  class="form-control">
													<option value="">-请选择-</option>
												</select> 
											</div>
											<div class="clear"></div>
									</li>
                                    <li>
                                        <button onclick="query()" class="btn btn-primary btnh" id="btnh" type="button">搜索</button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!--ibox-content-->
                    </div>
                </div>
            </div>
            <!--row-->
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content">
                            <div class="example-wrap">
                                <div class="example">
                                    <div class="btn-fl">
                                        <button type="button" class="btn btn-outline  btn-primary" id="add">新建</button>
                                        <button type="button" class="btn btn-outline  btn-warning" id="update">修改</button>
                                        <button type="button" class="btn btn-outline  btn-danger" id="del">删除</button>
                                    </div>
                                    <table id="usertable" data-mobile-responsive="true"></table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--row-->
        </div>
    </form>
<script type="text/javascript">
tableId="#usertable";
$(function() {
	$("#usertable").bootstrapTable({
		url : '${pageContext.request.contextPath}/user/doUserList',
		queryParamsType : '',
		method : 'post',
		striped : true, // 是否显示行间隔色
		cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		pagination : true, // 是否显示分页（*）
		sortable : false, // 是否启用排序
		sortOrder : "asc", // 排序方式
		sidePagination : "server", // 分页方式：client客户端分页，server服务端分页（*）
		pageNumber : 1, // 初始化加载第一页，默认第一页
		pageSize : 5, // 每页的记录行数（*）
		pageList : [ 5, 10, 25, 30 ], // 可供选择的每页的行数（*）
		search : false, // 是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
		strictSearch : true,
		contentType : "application/x-www-form-urlencoded",//发送到服务器的数据编码类型
		showColumns : true, // 是否显示所有的列
		showRefresh : true, // 是否显示刷新按钮
		minimumCountColumns : 2, // 最少允许的列数
		clickToSelect : true, // 是否启用点击选中行
		uniqueId : "userid", // 每一行的唯一标识，一般为主键列
		showToggle : true, // 是否显示详细视图和列表视图的切换按钮
		cardView : false, // 是否显示详细视图
		detailView : false, // 是否显示父子表
		queryParams : load, // 传递参数（*）
		columns : [ {
			radio : true
		}, {
			field : 'userid',// 和实体类的属性对应
			title : '用户编号',
			align:'center'
		}, {
			field : 'username',// 和实体类的属性对应
			title : '真实姓名',
			align:'center'
		}, {
			field : 'loginname',// 和实体类的属性对应
			title : '登录名',
			align:'center'
		}, {
			field : 'age',// 和实体类的属性对应
			title : '年龄',
			align:'center'
		}, {
			field : 'sex',// 和实体类的属性对应
			title : '性别',
			align:'center'
		}, {
			field : 'tell',// 和实体类的属性对应
			title : '电话',
			align:'center'
		}, {
			field : 'address',// 和实体类的属性对应
			title : '住址',
			align:'center'
		}, {
			field : 'email',// 和实体类的属性对应
			title : '邮箱',
			align:'center'
		} , {
			field : 'rolename',// 和实体类的属性对应
			title : '所属角色',
			align:'center'
		} , {
			field : 'birthday',// 和实体类的属性对应
			title : '出生年月',
			align:'center'/* ,
			formatter:dateFomart */
			}
		 ]
	});
	loadRole();
});
//获取查询条件
function load(params) {
	// 将json对象转为json字符串
	// var paramStr=JSON.stringify(params);
	var temp = { // 这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
		pageSize : params.pageSize, // 页面大小
		pageNum : params.pageNumber,// 页码
		username:$("#username").val(),//真实姓名
		loginname:$("#loginname").val(),
		tell:$("#tell").val(),
		sex:$("#sex").val(),
		roleid:$("#role").val()
	};
	return temp;
}
//点击搜索按钮进行查询
function query() {
	$('#usertable').bootstrapTable('refresh', load);
}
//加载部门名称
function loadRole(){
	$.ajax({
		url:"${pageContext.request.contextPath}/role/allroles",
		type:"post",
		dataType:"json",
		success:function(result){
			for(var k in result){
				var role=result[k];
				$("#role").append("<option value="+role.roleid+">"+role.rolename+"</option>");
			}
		}
	})
}
//新增
$("#add").on('click',function(){
	layer.open({
		title: '添加用户',
		area: ['980px', '520px'],
		type: 2,
		content: '${pageContext.request.contextPath}/user/toadd',
		btn:['确定','取消'],
		anim: 2,
		yes:function(index,layero){
			var tem = $(layero).find("iframe")[0].contentWindow.onAdd();
			layer.close(index);
			if(tem!=null&&tem!=""){
				layer.msg(tem);
			}
			query();
		}
	});
});
//修改
$("#update").on('click',function(){
		var rows=getData();
		if(!rows){//如果没有选中 则结束
			return;
		}
		layer.open({
			title: '修改用户',
			area: ['980px', '520px'],
			type: 2,
			content: '${uri}/user/toUpdate?id='+rows.userid,
			btn:['确定','取消'],
			anim: 2,
			offset: '30px',
			yes:function(index,layero){
				var tem = $(layero).find("iframe")[0].contentWindow.onUpdate();
				layer.close(index);
				if(tem!=null&&tem!=""){
					layer.msg(tem);
				}
				query();
			}
		});
});
//删除
$("#del").on('click',function(){
	var rows=getData();
	if(!rows){//如果没有选中 则结束
		return;
	}
	layer.confirm('你确定要删除《 '+rows.username+' 》吗？',
			{btn: ['确定', '取消'] },//可以无限个按钮
		 function(index, layero){
				 $.ajax({
					url:"${uri}/user/doDelete",
					data:"userid="+rows.userid,
					type:"post",
					dataType:"json",
					success:function(result){
						layer.msg(result);
						query();
					},
					error:function(e){
						layer.msg("删除失败");
					}
				}); 
		});
});
</script>
</body>
</html>