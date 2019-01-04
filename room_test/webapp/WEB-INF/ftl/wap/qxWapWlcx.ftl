<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${title?if_exists}</title>
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width">
<link rel="stylesheet" href="../wap/css/amazeui.min.css" type="text/css">
<link rel="stylesheet" href="../wap/css/style-lssdjt.css" type="text/css">
<script type="text/javascript" src="../wap/js/jquery-2.1.4.min.js"></script>

<style>
<style>
#hyzjDiv img{
	width:100px;
	height:60px;
	padding-right:10px;
}
#hyzjDiv .title{
}
#hyzjDiv .tit{
	vertical-align:middle;
	display:inline-flex;
}

.b_list .t_ft {
    margin-top: 5px;
}

</style>
</head>
	<body>
	   <header data-am-widget="header" class="am-header am-header-default j-header am-no-layout">
	      <a href="../wap.htm?m=list" style="float:left;"><img src="../wap/img/pre.png" style="width:35px;"></a>
    	  <a href="javascript:window.location.reload();" style="float:right;"><img src="../wap/img/Refresh.png" style="width:35px;"></a>
	      <h1 class="am-header-title">
	      	<a href="javascript:;" class="" style="font-size:14px;">${title?if_exists}</a>
	      </h1>
	   </header>
       <section class="xyl">
		  <div id="fabiaoqu">
		    <form class="zxd-form">
		    	  <input type="hidden" id="pageNo" name="pageNo" value="1" /> 
			      <div class="jiting clearfix">
			        <label style="width:100%;">
				          <select name="type" id="type" class="q-param">
				          	<option value="">选择物流名称</option>
				          	<option value="shentong">&nbsp;申通快递</option>
				          	<option value="ems">&nbsp;EMS快递</option>
				          	<option value="shunfeng">&nbsp;顺丰快递</option>
				          	<option value="yuantong">&nbsp;圆通快递</option>
				          	<option value="zhongtong">&nbsp;中通快递</option>
				          	<option value="yunda">&nbsp;韵达快递</option>
				          	<option value="tiantian">&nbsp;天天快递</option>
				          	<option value="huitongkuaidi">&nbsp;汇通快递</option>
				          	<option value="quanfengkuaidi">&nbsp;全峰快递</option>
				          	<option value="debangwuliu">&nbsp;德邦快递</option>
				          	<option value="zhaijisong">&nbsp;宅急送快递</option>
				          </select>
			        </label>
			      </div>
			      <div><input type="tel" id="postid" name="postid" placeholder="请输入快递单号" onfocus="javascript:document.getElementById('error_msg').innerHTML='';"></div>
			      <span style="color:red;" id="error_msg"></span>
			      <input id="zxd-form-submit" class="ptag-set" type="button" onclick="queryData();" value="查  询">
		    </form>
		  </div>
		</section>
		<div class="b_list">
			<ul id="hyzjDiv">
				
			</ul>
		</div>  
<!-- footer wrapper starts -->
  <#include "../common/wapfooter.ftl">
<!-- footer wrapper ends -->
<script type="text/javascript">

function queryData() {
	$("#hyzjDiv").html("");
	document.getElementById("error_msg").innerHTML = "";
	var type = $("#type").val();
	if(!type) {
		document.getElementById("error_msg").innerHTML = "请选择物流名称";
		return false;
	}
	var postid = $.trim($("#postid").val());
	if(!postid || !numFilter(postid) || postid.length <= 6) {
		document.getElementById("error_msg").innerHTML = "请输入物流单号";
		return false;
	}
	$("#zxd-form-submit").removeAttr("onclick");
	$("#zxd-form-submit").val("查询中...");
	$.ajax({
		type:"POST",
		url:"../wap.htm?m=wlcx",
		async:true,
		data:{"opt":"q","type":type,"postid":postid},
		success:function(data){
			var json = eval('('+data+')');
			if(json.code == "0") {
				if(checkExist(json.list)) {
					var objs = eval('('+json.list+')');
					var html = "";
					for(var i=0;i<objs.length;i++) {
						var obj = objs[i];
						html += "<li class='clear'><div class='text'>";
						if(i == 0) {
							html += "<div class='t_bd' style='font-weight:700;'>"+obj.context+"</div>";
						}else {
							html += "<div class='t_bd'>"+obj.context+"</div>";
						}
						html += "<div class='t_ft'>";
						if(i == 0) {
							html += "<div class='more' style='font-weight:700;'>"+obj.time+"</div>";
						}else {
							html += "<div class='more'>"+obj.time+"</div>";
						}
						html += "</div></div></li>";
					}
					html += "<br>";
					$("#hyzjDiv").append(html);
				}else {
					$("#hyzjDiv").append("暂无物流信息");
				}
			}else {
				$("#hyzjDiv").append("暂无物流信息");
			}
			$("#zxd-form-submit").attr("onclick", "queryData()");
			$("#zxd-form-submit").val("查  询");
		}
	});
}

function numFilter(str) {
	var filter = /^[0-9]*$/;
	return filter.test(str);
}

function checkExist(str) {
	if(str != undefined && str != "" && str != null) {
		return true;
	}else {
		return false;
	}
}

</script>
</body>
</html>