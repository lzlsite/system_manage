<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>角色新增页面</title>
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
            <form id="roleform">
            <div class="ibox-content">
                <div class="row">
                    <div class="form-horizontal">
                        <div class="form-group draggable">
                            <label class="col-sm-2 control-label required">角色名称:</label>
                             <div class="col-sm-4">
									<input id="rolename" type="text" class="form-control" placeholder="请输入角色名称" name="rolename">
							</div>
                        </div>
                        <div class="form-group draggable">
                            <label class="col-sm-2 control-label">备注:</label>
                             <div class="col-sm-4">
									<input id="remark" type="text" class="form-control" placeholder="请输入备注" name="remark">
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
    //新增
    function onAdd(){
    	var msg="";
    	//校验表单
    	var username=$("#rolename").val();	
    	if((username==null||username=='')&&flag==true){
    		flag=false;
    		layer.alert("角色名称不能为空", {icon: 5});
    		msg="角色名称不能为空";
    	}
    	var params=$("#roleform").serializeArray();//序列化表单
    	if(flag){
	    	//通过ajax来实现新增
	    	$.ajax({
	    		url:"${uri}/role/doRoleAdd",
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
    //校验角色 名是否已经存在
    $("#rolename").on('blur',function(){
    	var rolename=$(this).val();
    	if(rolename!=null&&rolename!=""){
    		$.ajax({
    			url:"${uri}/role/isExsits",
        		type:"get",
        		data:"rolename="+rolename,
        		dataType:"json",
        		async:false,
        		success:function(r){
        			if(r==true){
        				flag=false;
        				layer.alert('对不起,该角色已存在', {icon: 5});
        			}else{
        				flag=true;
        			}
        		}
    		});
    	}
    });
    </script>
</body>
</html>