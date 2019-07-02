<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>菜单修改页面</title>
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
                        	<input type="hidden" name="menuid" value="${menu.menuid}"/>
                            <label class="col-sm-2 control-label required">菜单名称:</label>
                             <div class="col-sm-4">
									<input id="menuname" readonly type="text" value="${menu.menuname}" class="form-control" placeholder="请输入菜单名称" name="menuname">
							</div>
                            <label class="col-sm-2 control-label required">菜单类型:</label>
                             <div class="col-sm-4">
									<select class="form-control" id="menutype">
										<option value="0">-请选择-</option>
										<option value="1" <c:if test='${menu.pid ==null }'>selected</c:if>>一级菜单</option>
										<option value="2" <c:if test='${menu.pid !=null }'>selected</c:if>>二级菜单</option>
									</select>
							</div>                          
                        </div>
                        <div class="form-group draggable">
							<label class="col-sm-2 control-label">上级菜单:</label>
                            <div class="col-sm-4">
								<select class="form-control" id="pid" name="pid">
										<option value="">-请选择-</option>
								</select>
							</div>
                             <label id="address" class="col-sm-2 control-label">url地址:</label>
                            <div class="col-sm-4">
                                <input id="url" name="url" value="${menu.url}" required type="text" class="form-control" placeholder="请输入跳转地址" >
                            </div>
                        </div>	
                        <div class="form-group draggable">
							<label class="col-sm-2 control-label">图标:</label>
                            <div class="col-sm-4">
								<input id="icon" value="${menu.icon}" type="text" class="form-control" placeholder="请输入图标符号" name="icon">
							</div>
                        </div>	
                    </div>
                </div>
            </div>
            </form>
        </div>
    </div>
 <script type="text/javascript">
 $(function(){
 		loadParentMenus();
 });
 
 var flag=true;
    //修改菜单
    function onUpdate(){
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
	    	//通过ajax来实现修改
	    	$.ajax({
	    		url:"${uri}/menu/doMenuUpdate",
	    		type:"post",
	    		data:params,
	    		dataType:"json",
	    		async:false,
	    		success:function(r){
	    			msg=r;
	    		}
	    	});
    	}else{
    		msg+=" 修改失败";
    	}
	    	return msg;
    } 
    //校验登录名是否已经存在
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
    $("#menutype").on('change',function(){
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
		}else if(val==2){
			$("#address").addClass("required");
			$("#pid").parent().prev().addClass("required");
			$.ajax({
				url:"${uri}/menu/getParantMenu",
				type:"get",
				dataType:"json",
				success:function(menus){
					var options="<option value=''>-请选择-</option>";
					for(var m in menus){
						var menu=menus[m];
						options+="<option value='"+menu.menuid+"'>"+menu.menuname+"</option>";
					}
					$("#pid").html(options);
				}
			});
		}
    });
    
    //加载父级菜单
    function loadParentMenus(){
 		$.ajax({
				url:"${uri}/menu/getParantMenu",
				type:"get",
				dataType:"json",
				success:function(menus){
					var options="<option value=''>-请选择-</option>";
					for(var m in menus){
						var menu=menus[m];
						if(menu.menuid=='${menu.pid}'){
							options+="<option value='"+menu.menuid+"' selected>"+menu.menuname+"</option>";
						}else{
							options+="<option value='"+menu.menuid+"'>"+menu.menuname+"</option>";
						}
					}
					$("#pid").html(options);
				}
			});
 		var val=$("#menutype").val();
 		if(val==1){
			$("#pid").prop("disabled",true);
			$("#url").prop("disabled",true);
		}else if(val==2){
			$("#address").addClass("required");
			$("#pid").parent().prev().addClass("required");
			$("#pid").prop("disabled",false);
			$("#url").prop("disabled",false);
		}
    };
    </script>
</body>
</html>