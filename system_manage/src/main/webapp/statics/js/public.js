var tableId;//设置全局变量表格的id
function getData(){
	var select=$(tableId).bootstrapTable('getSelections');
	var len=select.length; 
	if(len<1){
		layer.alert('请选择一条记录', {icon: 5});
		return false;
	}
	return select[0];//返回选择中的记录
}
//格式化时间
function dateFomart(value){
	if(value!=null&&value!=''&&value!=undefined){
		value=value.substring(0,10);
		return value;
	}else{
		return "";
	}
}

//校验值是否为空
function isNotBlank(val){
	if((val!=undefined&&val!=null&&val!="null"&&val!="")||val==0){
		return true;
	}
	return false;
}