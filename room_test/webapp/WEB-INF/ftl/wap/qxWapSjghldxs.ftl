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

<script>

function queryData() {
	$("#hyzjDiv").html("");
	document.getElementById("error_msg").innerHTML = "";
	var tel = $.trim($("#tel").val());
	if(!tel || !numFilter(tel) || tel.length < 5) {
		document.getElementById("error_msg").innerHTML = "请输入正确的电话号码";
		return false;
	}
	$("#zxd-form-submit").removeAttr("onclick");
	$("#zxd-form-submit").val("查询中...");
	$.ajax({
		type:"POST",
		url:"../wap.htm?m=sjghldxs",
		async:true,
		data:{"opt":"q","tel":tel},
		success:function(data){
			var json = eval('('+data+')');
			if(json.code == "0") {
				var obj = eval('('+json.msg+')');
				var html = "<li class='clear'><div class='text'>";
				html += "<div class='tit clear'><span class='title'><a class='c222'>"+obj.phone+"</a></span></div>";
				html += "<div class='tit clear'><span class='title'><a class='c222'>"+obj.province+" "+obj.city;
				if(checkExist(obj.sp)) {
					html += " "+obj.sp+"</a></span></div>";
				}else {
					html += "</a></span></div>";
				}
				if(checkExist(obj.hyname)) {
					html += "<div class='tit clear'><span class='title'><a class='c222'>"+obj.hyname+"</a></span></div>";
				}
				if(checkExist(obj.rpt_type) || checkExist(obj.rpt_comment)) {
					html += "<div class='t_bd'>"+obj.rpt_type+" "+obj.rpt_comment+"</div>";
				}
				if(checkExist(obj.countDesc)) {
					html += "<div class='t_bd'>"+obj.countDesc+"</div>";
				}
				html += "</div></li>";
				$("#hyzjDiv").append(html);
			}else {
				$("#hyzjDiv").append(json.msg);
			}
			$("#zxd-form-submit").attr("onclick", "queryData()");
			$("#zxd-form-submit").val("查  询");
		}
	});
}

function checkExist(str) {
	if(str != undefined && str != "" && str != null) {
		return true;
	}else {
		return false;
	}
}

function numFilter(str) {
	var filter = /^[0-9]*$/;
	return filter.test(str);
}

</script>
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
			      <div><input type="tel" id="tel" name="tel" placeholder="请输入电话号码" onfocus="javascript:document.getElementById('error_msg').innerHTML='';"></div>
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
</body>
</html>