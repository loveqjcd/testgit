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
	var cardno = $.trim($("#cardno").val());
	if(!cardno || !numFilter(cardno) || (cardno.length != 15 && cardno.length != 18)) {
		document.getElementById("error_msg").innerHTML = "请输入正确的身份证号码";
		return false;
	}
	$("#zxd-form-submit").removeAttr("onclick");
	$("#zxd-form-submit").val("查询中...");
	$.ajax({
		type:"POST",
		url:"../wap.htm?m=sfzcx",
		async:true,
		data:{"opt":"q","cardno":cardno},
		success:function(data){
			var json = eval('('+data+')');
			if(json.code == "0") {
				var obj1 = eval('('+json.card+')');
				var obj2 = eval('('+json.leak+')');
				var html = "<li class='clear'><div class='text'>";
				html += "<div class='tit clear'><span class='title'><a class='c222'>"+obj1.area+"</a></span></div>";
				html += "<div class='tit clear'><span class='title'><a class='c222'>"+obj1.sex+"</a></span></div>";
				html += "<div class='tit clear'><span class='title'><a class='c222'>"+obj1.birthday+"</a></span></div>";
				html += "<div class='tit clear'><span class='title'><a class='c222'>安全说明："+obj2.tips+"</a></span></div>";
				html += "</div></li>";
				$("#hyzjDiv").append(html);
			}else {
				$("#hyzjDiv").append(json.msg1+"<br>"+json.msg2);
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
			      <div><input type="tel" id="cardno" name="cardno" placeholder="请输入身份证号码" onfocus="javascript:document.getElementById('error_msg').innerHTML='';"></div>
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