<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>权限设置页面</title>
<%@ include file="../../public/public.jsp" %>
<style type="text/css">
	dd{
		display:inline-block;
		margin-left:12px;
	}
</style>
</head>
<body class="gray-bg">
     <div class="wrapper wrapper-content animated">
        <div class="ibox float-e-margins">
            <div class="ibox-title whj-see-ibox">
                <h5>权限信息</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <form id="roleform">
            <input type="hidden" name="roleid" value="${role.roleid}"/>
            <div class="ibox-content">
               <c:forEach items="${list}" var="menus">
               				<dl>
               					<dt>
               						<input type="checkbox" class="onemenu" name="menuid" value="${menus.menuid}" <c:if test="${menus.flag==true}">checked</c:if>/>${menus.menuname}
               					</dt>
               					<c:forEach items="${menus.menus}" var="menu">
               						<dd>
               							<input type="checkbox" class="secondMenu" value="${menu.menuid}" name="menuid" <c:if test="${menu.flag==true}">checked</c:if>/>${menu.menuname}
               						</dd>
               					</c:forEach>
               				</dl>
               </c:forEach>
            </div>
            </form>
        </div>
    </div>
 <script type="text/javascript">
 	$(function(){
 		$(".secondMenu").each(function(){
 			if($(this).prop("checked")){
 				$(this).parents("dl").find("dt input[type='checkbox']").prop("checked",true);
 			}
 		});
 		$(".onemenu").each(function(){
 			var len=$(this).parents("dl").find("dd :checked").length;
 			if(len==0){
 				$(this).prop('checked',false);
 			}
 		});
 	});
	 var flag=true;
    //设置权限
    function onUpdateAuthority(){
    	var msg="";
    	var params=$("#roleform").serializeArray();//序列化表单
    	 if(flag){
	    	//通过ajax来实现新增
	    	$.ajax({
	    		url:"${uri}/role/doRoleAuthority",
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