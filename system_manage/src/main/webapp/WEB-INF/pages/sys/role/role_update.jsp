<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>角色修改页面</title>
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
                        	<input type="hidden" name="roleid" value="${role.roleid}"/>
                            <label class="col-sm-2 control-label">角色名称:</label>
                             <div class="col-sm-4">
									<input id="rolename" value="${role.rolename}" type="text" readonly class="form-control" placeholder="请输入角色名称" name="rolename">
							</div>
                        </div>
                        <div class="form-group draggable">
                            <label class="col-sm-2 control-label">备注:</label>
                             <div class="col-sm-4">
									<input id="remark" value="${role.remark}" type="text" class="form-control" placeholder="请输入备注" name="remark">
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
    function onUpdate(){
    	var msg="";
    	var params=$("#roleform").serializeArray();//序列化表单
    	if(flag){
	    	//通过ajax来实现新增
	    	$.ajax({
	    		url:"${uri}/role/doRoleUpdate",
	    		type:"post",
	    		data:params,
	    		dataType:"json",
	    		async:false,
	    		success:function(r){
	    			msg=r;
	    		}
	    	});
    	}else{
    		msg+="修改失败";
    	}
	    	return msg;
    } 
    </script>
</body>
</html>