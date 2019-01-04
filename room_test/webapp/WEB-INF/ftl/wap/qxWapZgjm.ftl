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
$(document).ready(function(){
	getCode();
});

function getCode() {
	document.getElementById("question").innerHTML = "";
	$.ajax({
		type:"POST",
		url:"../wap.htm?m=getCode",
		async:false,
		success:function(data){
			var json = eval('('+data+')');
			if(json.code == "0") {
				document.getElementById("question").innerHTML = json.msg;
			}else {
			}
		}
	});
}

function queryData() {
	$("#hyzjDiv").html("");
	document.getElementById("error_msg").innerHTML = "";
	var q = $.trim($("#keyword").val());
	if(!q || numFilter(q) || q.length < 2) {
		document.getElementById("error_msg").innerHTML = "请输入关键字，且不少于两个字符";
		return false;
	}
	var code = $("#code").val();
	if(!code) {
		document.getElementById("error_msg").innerHTML = "请输入验证答案";
		return false;
	}
	$("#zxd-form-submit").removeAttr("onclick");
	$("#zxd-form-submit").val("查询中...");
	$.ajax({
		type:"POST",
		url:"../wap.htm?m=zgjm",
		async:true,
		data:{"opt":"q","code":code,"q":q},
		success:function(data){
			var json = eval('('+data+')');
			if(json.code == "0") {
				var arr = eval('('+json.msg+')');
				var index = 0;
				for(var i=0;i<arr.length;i++) {
					index ++;
					var obj = arr[i];
					var html = "<li class='clear'><div class='text'><div class='tit clear'><span class='title'><a class='c222'>"+index+"、"+obj.title+"</a></span></div>";
					var arrlist = obj.list;
					var index2 = 0;
					for(var j=0;j<arrlist.length;j++) {
						index2 ++;
						html += "<div class='t_bd'>（"+index2+"）"+arrlist[j]+"</div>";
					}
					html += "</div></li>";
					if(i == (arr.length - 1)) {
						html += "<br>";
					}
					$("#hyzjDiv").append(html);
				}
			}else {
				$("#hyzjDiv").append(json.msg);
			}
			$("#zxd-form-submit").attr("onclick", "queryData()");
			$("#zxd-form-submit").val("查  询");
		}
	});
	getCode();
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
			      <div><input type="tel" id="keyword" name="keyword" placeholder="请输入梦境关键字，例如吃屎" onfocus="javascript:document.getElementById('error_msg').innerHTML='';"></div>
			      <a href="javascript:;" onclick="getCode();" style="float:left;">换一题</a><span style="color:#888;margin-left:20px;" id="question"></span>
			      <div><input type="tel" id="code" name="code" placeholder="请输入验证答案" onfocus="javascript:document.getElementById('error_msg').innerHTML='';"></div>
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