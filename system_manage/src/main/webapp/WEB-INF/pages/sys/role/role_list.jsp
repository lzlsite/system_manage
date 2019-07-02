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
											<input type="search" class="form-control" id="rolename" placeholder="请输入角色名称">
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
                                        <button type="button" class="btn btn-outline  btn-success" id="authority">权限设置</button>
                                    </div>
                                    <table id="roletable" data-mobile-responsive="true"></table>
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
tableId="#roletable";
$(function() {
	$("#roletable").bootstrapTable({
		url : '${pageContext.request.contextPath}/role/doRoleList',
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
		pageList : [ 5, 10, 15], // 可供选择的每页的行数（*）
		search : false, // 是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
		strictSearch : true,
		contentType : "application/x-www-form-urlencoded",//发送到服务器的数据编码类型
		showColumns : true, // 是否显示所有的列
		showRefresh : true, // 是否显示刷新按钮
		minimumCountColumns : 2, // 最少允许的列数
		clickToSelect : true, // 是否启用点击选中行
		uniqueId : "roleid", // 每一行的唯一标识，一般为主键列
		showToggle : true, // 是否显示详细视图和列表视图的切换按钮
		cardView : false, // 是否显示详细视图
		detailView : false, // 是否显示父子表
		queryParams : load, // 传递参数（*）
		columns : [ {
			radio : true
		}, {
			field : 'roleid',// 和实体类的属性对应
			title : '角色编号',
			align:'center'
		}, {
			field : 'rolename',// 和实体类的属性对应
			title : '角色名称',
			align:'center'
		}, {
			field : 'remark',// 和实体类的属性对应
			title : '备注',
			align:'center'
		}
		]
	});
});
//获取查询条件
function load(params) {
	var temp = { // 这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
		pageSize : params.pageSize, // 页面大小
		pageNum : params.pageNumber,// 页码
		rolename:$("#rolename").val()
	};
	return temp;
}
//点击搜索按钮进行查询
function query() {
	$('#roletable').bootstrapTable('refresh', load);
}
//新增
$("#add").on('click',function(){
	layer.open({
		title: '添加角色',
		area: ['770px', '340px'],
		type: 2,
		content: '${pageContext.request.contextPath}/role/toRoleAdd',
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
			title: '添加用户',
			area: ['770px', '340px'],
			type: 2,
			content: '${uri}/role/toRoleUpdate?roleid='+rows.roleid,
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
	layer.confirm('你确定要删除《 '+rows.rolename+' 》吗？',
			{btn: ['确定', '取消'] },//可以无限个按钮
		 function(index, layero){
				 $.ajax({
					url:"${uri}/role/doRoleDelete",
					data:"roleid="+rows.roleid,
					type:"post",
					dataType:"json",
					success:function(result){
						layer.msg(result);
					},
					error:function(e){
						layer.msg("删除失败");
					}
				}); 
		});
});
//权限设置
$("#authority").on('click',function(){
	var rows=getData();
	if(!rows){//如果没有选中 则结束
		return;
	}
	layer.open({
		title: '权限设置',
		area: ['1150px', '610px'],
		type: 2,
		content: '${uri}/role/toRoleAuthority?roleid='+rows.roleid,
		btn:['确定','取消'],
		anim: 2,
		offset: '30px',
		yes:function(index,layero){
			var tem = $(layero).find("iframe")[0].contentWindow.onUpdateAuthority();
			layer.close(index);
			if(tem!=null&&tem!=""){
				layer.msg(tem);
			}
			query();
		}
	});
});
</script>
</body>
</html>