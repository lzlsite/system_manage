<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户新增页面</title>
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
            <form id="userform">
            <div class="ibox-content">
                <div class="row">
                    <div class="form-horizontal">
                        <div class="form-group draggable">
                            <label class="col-sm-2 control-label required">真实姓名:</label>
                             <div class="col-sm-4">
									<input id="username" type="text" class="form-control" placeholder="请输入用户真实姓名" name="username">
							</div>
                            <label class="col-sm-2 control-label required">登录名:</label>
                             <div class="col-sm-4">
									<input id="loginname" type="text" class="form-control" placeholder="请输入登录名" name="loginname">
							</div>                          
                        </div>
                        <div class="form-group draggable">
							<label class="col-sm-2 control-label">性别:</label>
                            <div class="col-sm-4">
								<select class="form-control" id="sex">
									<option value="">-请选择-</option>
									<option value="男">男</option>
									<option value="女">女</option>
								</select>
							</div>
                             <label class="col-sm-2 control-label required">联系电话:</label>
                            <div class="col-sm-4">
                                <input id="tell" name="tell" required type="text" class="form-control" placeholder="请输入联系电话" pattern="^(0|86|17951)?1[0-9]{10}" oninvalid="setCustomValidity('请输入11位手机号');">
                            </div>
                        </div>	
 						<div class="form-group draggable">
                            <label class="col-sm-2 control-label">年龄:</label>
                            <div class="col-sm-4">
                               <input required id="age" name="age" type="number" class="form-control" placeholder="请输入年龄">
                            </div>
                            <label class="col-sm-2 control-label">出生日期:</label>
                            <div class="col-sm-4">
                                <input  id="birthday" name="birthday" class="laydate-icon form-control layer-date">
                            </div>
                        </div>	
                        <div class="form-group draggable">
                            <label class="col-sm-2 control-label">邮箱:</label>
                            <div class="col-sm-4">
									<input  id="email" name="email" type="email" class="form-control" placeholder="请输入邮箱名">
							</div>
                            <label class="col-sm-2 control-label">住址:</label>
                            <div class="col-sm-4">
									<input required id="address" name="address" type="text" class="form-control" placeholder="请输入居住地址">
							</div>
                        </div>
                        <div class="form-group draggable">
                            <label class="col-sm-2 control-label required">用户角色:</label>
                             <div class="col-sm-4">
								<select class="form-control" required name="roles[0].roleid" id="roles">
								<option value="">-请选择角色-</option>
								</select>
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
     laydate({
        elem: '#birthday', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
        event: 'focus' //响应事件。如果没有传入event，则按照默认的click
    }); 
    $(function(){
    	getRole();//初始化页面时加载角色列表
    })
    //加载用户角色
    function getRole(){
    	$.post("${uri}/role/allroles",function(result){
    		for(var k in result){
				var role=result[k];
				$("#roles").append("<option value="+role.roleid+">"+role.rolename+"</option>");
			}
    	})
    }
    //新增用户
    function onAdd(){
    	var msg="";
    	//校验表单
    	var username=$("#username").val();	
    	var loginname=$("#loginname").val();
    	var tell=$("#tell").val(); 	
    	var role=$("#roles").val();
    	if((username==null||username=='')&&flag==true){
    		flag=false;
    		layer.alert("真实姓名不能为空", {icon: 5});
    		msg="真实姓名不能为空";
    	}
    	if((loginname==null||loginname=='')&&flag==true){
    		flag=false;
    		layer.alert("登录名不能为空", {icon: 5});
    		msg="登录名不能为空";
    	}
    	if((tell==null||tell=='')&&flag==true){
    		flag=false;
    		layer.alert("联系电话不能为空", {icon: 5});
    		msg="联系电话不能为空";
    	}
    	if((role==null||role=='')&&flag==true){
    		flag=false;
    		layer.alert("请选择用户所属角色", {icon: 5});
    		msg="请选择用户所属角色";
    	}
    	
    	var params=$("#userform").serializeArray();//序列化表单
    	if(flag){
	    	//通过ajax来实现新增
	    	$.ajax({
	    		url:"${uri}/user/doadd",
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
    //校验登录名是否已经存在
    $("#loginname").on('blur',function(){
    	var loginname=$(this).val();
    	if(loginname!=null&&loginname!=""){
    		$.ajax({
    			url:"${uri}/user/isExsits",
        		type:"get",
        		data:"loginname="+loginname,
        		dataType:"json",
        		async:false,
        		success:function(r){
        			if(r==true){
        				flag=false;
        				layer.alert('对不起,该用户登录名已存在', {icon: 5});
        			}else{
        				flag=true;
        			}
        		}
    		});
    	}
    });
    //校验手机号是否已存在
    $("#tell").on('blur',function(){
    	var tell=$(this).val();
    	if(tell!=null&&tell!=""){
    		$.ajax({
    			url:"${uri}/user/isExsits",
        		type:"get",
        		data:"tell="+tell,
        		dataType:"json",
        		async:false,
        		success:function(r){
        			if(r==true){
        				flag=false;
        				layer.alert('对不起,该联系电话已存在', {icon: 5});
        			}else{
        				flag=true;
        			}
        		}
    		});
    	}
    });
    //校验邮箱是否已存在
    $("#email").on('blur',function(){
    	var email=$(this).val();
    	if(email!=null&&email!=""){
    	  if(email.lastIndexOf(".")==-1||email.lastIndexOf("@")==-1){
			layer.alert('邮箱地址必须包含@和.', {icon: 5});
				return;
			} 
    		$.ajax({
    			url:"${uri}/user/isExsits",
        		type:"get",
        		data:"email="+email,
        		dataType:"json",
        		async:false,
        		success:function(r){
        			if(r==true){
        				flag=false;
        				layer.alert('对不起,该邮箱已存在', {icon: 5});
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