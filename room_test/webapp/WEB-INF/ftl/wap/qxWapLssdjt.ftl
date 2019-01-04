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
	initDate();
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

function changeMonth() {
	var month = $("#month").val();
	var html = "<option value=''>选择日期</option>";
	if(!month) {
		$("#day").html(html);
	}else {
		var arr = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
		var index = parseInt(month)-1;
		var days = arr[index];
		for(var i=1;i<=days;i++) {
			html += "<option value='"+i+"'>&nbsp;"+i+"</option>";
		}
		$("#day").html(html);
	}
	document.getElementById("error_msg").innerHTML = "";
}

function initDate() {
	var today = new Date();
	$("#month").val(today.getMonth()+1);
	changeMonth();
	$("#day").val(today.getDate());
}

function queryData() {
	$("#hyzjDiv").html("");
	document.getElementById("error_msg").innerHTML = "";
	var month = $("#month").val();
	var day = $("#day").val();
	var code = $("#code").val();
	if(!month || !day) {
		document.getElementById("error_msg").innerHTML = "请选择查询日期";
		return false;
	}
	if(!code) {
		document.getElementById("error_msg").innerHTML = "请输入验证答案";
		return false;
	}
	$("#zxd-form-submit").removeAttr("onclick");
	$("#zxd-form-submit").val("查询中...");
	$.ajax({
		type:"POST",
		url:"../wap.htm?m=lssdjt",
		async:true,
		data:{"opt":"q","code":code,"month":month,"day":day},
		success:function(data){
			var json = eval('('+data+')');
			if(json.code == "0") {
				var arr = eval('('+json.msg+')');
				var index = 0;
				for(var i=0;i<arr.length;i++) {
					index ++;
					var obj = arr[i];
					var html = "<li class='clear'><div class='text'><div class='tit clear'><span class='title'><a class='c222'>"+index+"、"+obj.title+"</a></span></div>";
					html += "<div class='t_bd'>"+obj.des+"</div><div class='t_ft'><div class='more'>"+obj.year+"-"+obj.month+"-"+obj.day+"</div><div class='date'>"+obj.lunar+"</div></div></div></li>";
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
			      <div class="jiting clearfix">
			        <label>
				          <select name="month" id="month" onchange="changeMonth()" class="q-param">
				          	<option value="">选择月份</option>
				          	<option value="1">&nbsp;1</option>
				          	<option value="2">&nbsp;2</option>
				          	<option value="3">&nbsp;3</option>
				          	<option value="4">&nbsp;4</option>
				          	<option value="5">&nbsp;5</option>
				          	<option value="6">&nbsp;6</option>
				          	<option value="7">&nbsp;7</option>
				          	<option value="8">&nbsp;8</option>
				          	<option value="9">&nbsp;9</option>
				          	<option value="10">&nbsp;10</option>
				          	<option value="11">&nbsp;11</option>
				          	<option value="12">&nbsp;12</option>
				          </select>
			        </label>
			        <label>
				          <select name="day" id="day" class="q-param" onchange="javascript:document.getElementById('error_msg').innerHTML='';">
				          	<option value="">选择日期</option>
				          </select>
			        </label>
			      </div>
			      <a href="javascript:;" onclick="getCode();" style="float:left;">换一题</a><span style="color:#888;margin-left:20px;" id="question"></span>
			      <div><input type="tel" id="code" name="code" placeholder="请输入验证答案" class="q-param" onfocus="javascript:document.getElementById('error_msg').innerHTML='';"></div>
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