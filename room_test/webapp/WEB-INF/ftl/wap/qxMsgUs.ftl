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

function testMobile(mobile) {
	var mobileFilter = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
	return mobileFilter.test(mobile);
}

function testEmail(email) {
	var pattern = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	return pattern.test(email);
}


function chooseNav(divid) {
	$("#"+divid).show();
	if(divid == 'add_msg') {
		$("#my_msg").hide();
		$(".b_list").hide();
		$("#add_msg_li").css("background-color", "#777");
		$("#my_msg_li").css("background-color", "#999");
	}else {
		$("#add_msg").hide();
		$(".b_list").show();
		$("#my_msg_li").css("background-color", "#777");
		$("#add_msg_li").css("background-color", "#999");
	}
}

function saveData(o) {
	var username = $.trim($("#username").val());
	if(!username || username.length > 50) {
		document.getElementById("error_msg").innerHTML = "请输入您的姓名";
		return false;
	}
	var mobile = $.trim($("#mobile").val());
	if(!testMobile(mobile)) {
		document.getElementById("error_msg").innerHTML = "请输入手机号码";
		return false;
	}
	var email = $.trim($("#email").val());
	if(!email || !testEmail(email)) {
		document.getElementById("error_msg").innerHTML = "请输入手机号码";
		return false;
	}
	var content = $.trim($("#content").val());
	if(!content) {
		document.getElementById("error_msg").innerHTML = "请输入留言内容";
		return false;
	}
	$(o).removeAttr("onclick");
	$(o).val("提交中...");
	$.ajax({
		type:"POST",
		url:"../wap.htm?m=msgus",
		data:{"opt":"msg","content":content,"username":username,"mobile":mobile,"email":email},
		async:false,
		success:function(data){
			var json = eval('('+data+')');
			if(json.code == "0") {
				alert(json.msg);
				$("#username").val("");
				$("#mobile").val("");
				$("#email").val("");
				$("#content").val("");
			}else {
				alert(json.msg);
			}
			$(o).attr("onclick", "saveData(this)");
			$(o).val("提  交");
		}
	});
}

function queryData(o) {
	$("#hyzjDiv").html("");
	var mymobile = $.trim($("#mymobile").val());
	if(!testMobile(mymobile)) {
		document.getElementById("error_msg_my").innerHTML = "请输入手机号码";
		return false;
	}
	$(o).removeAttr("onclick");
	$(o).val("查询中...");
	$.ajax({
		type:"POST",
		url:"../wap.htm?m=msgus",
		data:{"opt":"mymsg","mobile":mymobile},
		async:true,
		success:function(data){
			var json = eval('('+data+')');
			if(json.code == "0") {
				var arr = eval('('+json.list+')');
				for(var i=0;i<arr.length;i++) {
					var obj = arr[i];
					var html = "<li class='clear'><div class='text'><div class='tit clear'><span class='title'><a class='c222'>"+obj.content+"</a></span></div>";
					if(checkExist(obj.reslist)) {
						var resarr = eval('('+obj.reslist+')');
						for(var j=0;j<resarr.length;j++) {
							var res = resarr[j];
							html += "<div class='t_bd'>["+res.createDate+"] 回复："+res.content+"</div>";
						}
					}
					html += "<div class='t_ft'><div class='more'>["+obj.createDate+"]</div><div class='date'>"+obj.username+"</div></div></div></li>";
					
					if(i == (arr.length - 1)) {
						html += "<br>";
					}
					$("#hyzjDiv").append(html);
				}
			}else {
				$("#hyzjDiv").append(json.msg);
			}
			$(o).attr("onclick", "queryData(this)");
			$(o).val("查  询");
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

</script>
<style>
.nav-msg{
	width:100%;
	height:40px;
	background-color:#999;
	margin-top:15px;
}
.nav-msg div{
	width:50%;
	height:40px;
	float:left;
	text-align: center;
	font-size: 16px;
	font-weight: bolder;
    color: white;
    padding-top: 10px;
}
</style>
</head>
	<body>
	   <header data-am-widget="header" class="am-header am-header-default j-header am-no-layout">
	      <a href="../wap.htm?m=aboutus" style="float:left;"><img src="../wap/img/pre.png" style="width:35px;"></a>
    	  <a href="javascript:window.location.reload();" style="float:right;"><img src="../wap/img/Refresh.png" style="width:35px;"></a>
	      <h1 class="am-header-title">
	      	<a href="javascript:;" class="" style="font-size:14px;">${title?if_exists}</a>
	      </h1>
	   </header>
       <section class="xyl">
       	  <div class="nav-msg" style="">
       	  	<div id="add_msg_li" style="background-color:#777;" onclick="chooseNav('add_msg');">添加留言</div>
       	  	<div id="my_msg_li" style="" onclick="chooseNav('my_msg');">我的留言</div>
       	  </div>
		  <div id="add_msg">
		    <form class="zxd-form">
			      <div><input type="tel" id="username" name="username" placeholder="您的姓名" onfocus="javascript:document.getElementById('error_msg').innerHTML='';"></div>
			      <div><input type="tel" id="mobile" name="mobile" placeholder="手机号码" onfocus="javascript:document.getElementById('error_msg').innerHTML='';"></div>
			      <div><input type="tel" id="email" name="email" placeholder="联系邮箱" onfocus="javascript:document.getElementById('error_msg').innerHTML='';"></div>
			      <div><textarea type="tel" style="width:100%;height:100px;padding-left:10px;" id="content" name="content" placeholder="留言内容" onfocus="javascript:document.getElementById('error_msg').innerHTML='';"></textarea></div>
			      <span style="color:red;" id="error_msg"></span>
			      <input id="zxd-form-submit" class="ptag-set" type="button" onclick="saveData(this);" value="提  交">
		    </form>
		  </div>
		  <div id="my_msg" style="display:none;">
		    <form class="zxd-form">
			      <div><input type="tel" id="mymobile" name="mymobile" placeholder="手机号码" onfocus="javascript:document.getElementById('error_msg_my').innerHTML='';"></div>
			      <span style="color:red;" id="error_msg_my"></span>
			      <input id="zxd-form-submit" class="ptag-set" type="button" onclick="queryData(this);" value="查  询">
		    </form>
		  </div>
		</section>
		<div class="b_list" style="display:none;">
			<ul id="hyzjDiv">
				
			</ul>
		</div>
<!-- footer wrapper starts -->
  <#include "../common/wapfooter.ftl">
<!-- footer wrapper ends -->
</body>
</html>