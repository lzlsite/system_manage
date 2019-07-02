<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>菜单列表</title>
<%@ include file="../../public/public.jsp" %>
<style type="text/css">
	.select2{
		width:100px;
	}
</style>
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
										<span class="fl labeltext">菜单名称：</span>
										<div class="fl">
											<input type="search" class="form-control" id="menuname" placeholder="请输入菜单名称">
										</div>
										<div class="clear"></div>
									</li>
									<li>
										<span class="fl labeltext">菜单等级：</span>
										<div class="fl">
											<input type="number" class="form-control" id="leav" placeholder="请输入菜单等级">
										</div>
										<div class="clear"></div>
									</li>
									<li>
										<span class="fl labeltext">可用状态：</span>
										<div class="fl">
											<select id="status" class="select2">
												<option value="-1">--请选择--</option>
												<option value="0">可用</option>
												<option value="1">不可用</option>
											</select>
										</div>
										<div class="clear"></div>
									</li>
									<li>
										<span class="fl labeltext">菜单类型：</span>
										<div class="fl">
											<select id="type" class="select2">
												<option value="">--请选择--</option>
												<option value="menu">菜单</option>
												<option value="button">按钮</option>
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
                                    <table id="menutable" data-mobile-responsive="true"></table>
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
tableId="#menutable";
$(function() {
	$("#menutable").bootstrapTable({
		url : '${uri}/sysMenu/doMenuList',
		queryParamsType : '',
		method : 'get',
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
		//contentType : "application/x-www-form-urlencoded",//发送到服务器的数据编码类型
		showColumns : true, // 是否显示所有的列
		showRefresh : true, // 是否显示刷新按钮
		minimumCountColumns : 2, // 最少允许的列数
		clickToSelect : true, // 是否启用点击选中行
		uniqueId : "menuid", // 每一行的唯一标识，一般为主键列
		showToggle : true, // 是否显示详细视图和列表视图的切换按钮
		cardView : false, // 是否显示详细视图
		detailView : false, // 是否显示父子表
		queryParams : load, // 传递参数（*）
		columns : [ {
			radio : true
		}, {
			title : '序号',
			align:'center',
			width:50,
			formatter:function(value,row,index){  
		          var pageNumber = $(tableId).bootstrapTable('getOptions').pageNumber;  
		          var pageSize = $(tableId).bootstrapTable('getOptions').pageSize;  
		          return (pageNumber-1) * pageSize+index+1;  
		      }  
		}, {
			field : 'menuid',// 和实体类的属性对应
			visible:false
		}, {
			field : 'menuname',// 和实体类的属性对应
			title : '菜单名称',
			align:'center'
		}, {
			field : 'url',// 和实体类的属性对应
			title : '跳转地址',
			align:'center'
		}, {
			field : 'pid',// 和实体类的属性对应
			title : '上级菜单',
			align:'center',
			formatter:fomartPid
		}, {
			field : 'type',// 和实体类的属性对应
			title : '类型',
			align:'center',
			formatter:function(val){
				if(val!=undefined){
					if(val=="menu"){
						return "菜单";
					}else if(val=="button"){
						return "按钮";
					}
				}
			}
		}, {
			field : 'leav',// 和实体类的属性对应
			title : '菜单等级',
			align:'center',
			formatter:function(val){
				if(isNotBlank(val)){
					return val;
				}
			}
		}, {
			field : 'permission',// 和实体类的属性对应
			title : '权限标识',
			align:'center'
		}, {
			field : 'status',// 和实体类的属性对应
			title : '状态',
			align:'center',
			formatter:function(val){
				var flag=isNotBlank(val);
				if(flag){
					return val==0?"可用":"不可用";
				}
			}
		}]
	});
	loadParentMenu();
	$("#status,#type").select2();
});
var parentMenus;
//获取查询条件
function load(params) {
	// 将json对象转为json字符串
	// var paramStr=JSON.stringify(params);
	var temp = { // 这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
		pageSize : params.pageSize, // 页面大小
		pageNum : params.pageNumber,// 页码
		menuname:$("#menuname").val(),//菜单名称
		leav:$("#leav").val(),//菜单等级
		type:$("#type").val(),//菜单类型
		status:$("#status").val()//菜单等级
	};
	return temp;
}
//获取所有一级菜单
function loadParentMenu(){
	$.ajax({
		url:"${uri}/sysMenu/getAllMenus",
		type:"get",
		dataType:"json",
		success:function(menus){
			parentMenus=menus;
		}
	});
}
//格式化父菜单在页面上展示菜单的名称
function fomartPid(value){
	for(var m in parentMenus){
		var menu=parentMenus[m];
		if(menu.menuid==value){
			return menu.menuname;
		}
	}
}
//点击搜索按钮进行查询
function query() {
	$('#menutable').bootstrapTable('refresh', load);
}
//新增
$("#add").on('click',function(){
 var win=layer.open({
		title: '添加菜单',
		 maxmin: true,
//		area: 'auto',
		area: ['980px', '450px'],
		type: 2,
		content: '${uri}/sysMenu/toMenuAdd',
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
// layer.full(win);
});
//修改
$("#update").on('click',function(){
		var rows=getData();
		if(!rows){//如果没有选中 则结束
			return;
		}
		layer.open({
			title: '修改菜单',
			area: ['980px', '390px'],
			type: 2,
			content: '${uri}/menu/toMenuUpdate?menuid='+rows.menuid,
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
	layer.confirm('你确定要删除《 '+rows.menuname+' 》吗？',
			{btn: ['确定', '取消'] },//可以无限个按钮
		 function(index, layero){
				 $.ajax({
					url:"${uri}/menu/doMenuDelete",
					data:"menuid="+rows.menuid,
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