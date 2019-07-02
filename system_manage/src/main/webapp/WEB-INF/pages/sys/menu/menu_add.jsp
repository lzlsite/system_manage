<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>菜单新增页面</title>
<%@ include file="../../public/public.jsp" %>
</head>
<body class="gray-bg">
     <div class="wrapper wrapper-content animated">
        <div class="ibox float-e-margins">
            <div class="ibox-title whj-see-ibox">
                <h5>基本信息</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <form id="menuform">
            <div class="ibox-content">
                <div class="row">
                    <div class="form-horizontal">
                        <div class="form-group draggable">
                            <label class="col-sm-2 control-label required">菜单名称：</label>
                             <div class="col-sm-4">
									<input id="menuname" type="text" class="form-control" placeholder="请输入菜单名称" name="menuname">
							</div>
                            <label id="address" class="col-sm-2 control-label required">类型：</label>
                            <div class="col-sm-4">
                                <select class="form-control" id="type" name="type">
										<option value="">--请选择--</option>
										<option value="menu">菜单</option>
										<option value="button">按钮</option>
								</select>
                            </div>               
                        </div>
                        <div class="form-group draggable">
                        	 <label class="col-sm-2 control-label required">菜单等级：</label>
                             <div class="col-sm-4">
									<select name="leav" class="form-control" id="leav">
										<option value="0">--请选择--</option>
										<option value="1">一级菜单</option>
										<option value="2">二级菜单</option>
									</select>
							</div>       
							<label class="col-sm-2 control-label">上级菜单：</label>
                            <div class="col-sm-4">
								<select class="form-control" id="pid" name="pid">
										<option value="0">--请选择--</option>
								</select>
							</div>
                        </div>	
                        <div class="form-group draggable">
							<label class="col-sm-2 control-label required">可用状态：</label>
                            <div class="col-sm-4">
								<select class="form-control" id="status" name="status">
										<option value="0">可用</option>
										<option value="1">不可用</option>
								</select>
							</div>
							<label class="col-sm-2 control-label">权限标识：</label>
                            <div class="col-sm-4">
								<input id="icon" type="text" class="form-control" placeholder="请输入权限标识" name="permission">
							</div>
                        </div>
                        <div class="form-group draggable">
							<label class="col-sm-2 control-label">图标：</label>
                            <div class="col-sm-4">
								<input id="icon" type="text" class="form-control" placeholder="请输入图标符号" name="icon">
							</div>
                             <label id="address" class="col-sm-2 control-label">url地址：</label>
                            <div class="col-sm-4">
                                <input id="url" name="url" required type="text" class="form-control" placeholder="请输入跳转地址" >
                            </div>
                        </div>	
                    </div>
                </div>
            </div>
            </form>
        </div>
    </div>
 <script type="text/javascript">
 var flag=true;
    //新增菜单
    function onAdd(){
    	var msg="";
    	//校验表单
    	var menuname=$("#menuname").val();	
    	if((menuname==null||menuname=='')&&flag==true){
    		flag=false;
    		layer.alert("菜单名称不能为空", {icon: 5});
    		msg="菜单名称不能为空";
    	}
    	
    	var params=$("#menuform").serializeArray();//序列化表单
    	if(flag){
	    	//通过ajax来实现新增
	    	$.ajax({
	    		url:"${uri}/sysMenu/doMenuAdd",
	    		type:"post",
	    		data:params,
	    		dataType:"json",
	    		async:false,
	    		success:function(r){
	    			msg=r;
	    		}
	    	});
    	}else{
    		msg+=" 新增失败";
    	}
	    	return msg;
    } 
    //校验菜单名称是否已经存在
    $("#menuname").on('blur',function(){
    	var menuname=$(this).val();
    	if(menuname!=null&&menuname!=""){
    		$.ajax({
    			url:"${uri}/menu/isExsits",
        		type:"get",
        		data:"menuname="+menuname,
        		dataType:"json",
        		async:false,
        		success:function(r){
        			if(r==true){
        				flag=false;
        				layer.alert('对不起,该菜单名已存在', {icon: 5});
        			}else{
        				flag=true;
        			}
        		}
    		});
    	}
    });
    //根据选择的菜单类型对父菜和url进行相应的操作
    $("#leav").on('change',function(){
    	$("#pid").html("<option value=''>-请选择-</option>");
    	$("#url").val("");
    	$("#address").removeClass("required");
    	$("#pid").parent().prev().removeClass("required");
    	$("#pid").prop("disabled",false);
		$("#url").prop("disabled",false);
    	var val=$(this).val();
		if(val==1){
			$("#pid").prop("disabled",true);
			$("#url").prop("disabled",true);
		}else if(val>=2){
			$("#address").addClass("required");
			$("#pid").parent().prev().addClass("required");
			var param={"leav":1};
    		getParentMen(param);
			
		}
    });
    //选择菜单类型
    $("#type").on('change',function(){
    	var type=$(this).val();
    	if(type=="button"){
    		$("#leav").prop("disabled",true);
    		var param={"leav":2};
    		getParentMen(param);
    	}else{
    		$("#leav").prop("disabled",false);
    		var options="<option value=''>--请选择--</option>";
    		$("#pid").html(options);
    	}
    })
    //查询父菜单
    function getParentMen(param){
    	$.ajax({
			url:"${uri}/sysMenu/getParentMenu",
			type:"get",
			data:param,
			dataType:"json",
			success:function(menus){
				var options="<option value='0'>--请选择--</option>";
				for(var m in menus){
					var menu=menus[m];
					options+="<option value='"+menu.menuid+"'>"+menu.menuname+"</option>";
				}
				$("#pid").html(options);
			}
		});
    }
    </script>
</body>
</html>