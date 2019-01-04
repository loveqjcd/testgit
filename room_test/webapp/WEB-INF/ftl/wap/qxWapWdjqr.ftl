<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${title?if_exists}</title>
<!-- meta tags start -->
<meta name="Keywords" content="">
<meta name="Description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="../wap/css/amazeui.min.css" type="text/css">
<link rel="stylesheet" href="../wap/css/style-lssdjt1.css" type="text/css">
<link rel="stylesheet" href="../wap/css/wdjqr-style.css" media="screen" type="text/css" />
<script type="text/javascript" src="../wap/js/jquery-2.1.4.min.js"></script>
</head>
<style type="text/css">
.form-control {
    padding: 3px 0px;
    font-size: 14px;
    line-height: 1.428571429;
    color: #555555;
    background-color: #ffffff;
    border: 1px solid #cccccc;
    border-radius: 3px;
}
</style>
<body>
	<header data-am-widget="header" class="am-header am-header-default j-header am-no-layout">
	      <a href="../wap.htm?m=list" style="float:left;"><img src="../wap/img/pre.png" style="width:35px;"></a>
    	  <a href="javascript:window.location.reload();" style="float:right;"><img src="../wap/img/Refresh.png" style="width:35px;"></a>
	      <h1 class="am-header-title">
	      	<a href="javascript:;" class="" style="font-size:14px;">${title?if_exists}</a>
	      </h1>
	   </header>
<div id="convo" data-from="Sonu Joshi">  
<ul class="chat-thread" id="char_area">
	<li style="display:none;"></li>
	<li>您想聊点什么呢？</li>
</ul>
</div>

<div id="enter_msg" class="credits" style="width:100%;position:fixed;bottom:0px;max-height:40px;padding-top: 10px;">
	<div style="float:left;width:100%; position:absolute;bottom: 1px;">
		<input type="" id="info" name="info" class="form-control" style="padding-left:10px;max-width:90%;min-width:60%" placeholder="说点什么呗。。">
		<input type="button" class="form-control" style="cursor:pointer;width:100px;" value="发&nbsp;送" onclick="sendMsg();" />
	</div>
</div>
<script>
$("#info").keypress(function(){
	if(event.keyCode == 13) {
		sendMsg();
	}
});

function sendMsg() {
	var info = $.trim($("#info").val());
	$("#info").val("");
	var html1 = "<li>"+info+"</li>";;
	$("#char_area").append(html1);
	window.scrollTo(0,document.body.scrollHeight);
	$.ajax({
		type:"POST",
		url:"../wap.htm?m=wdjqr",
		async:true,
		data:{"opt":"q","info":info},
		success:function(data){
			var json = eval('('+data+')');
			var html2;
			if(json.code == "0") {
				var obj = eval('('+json.msg+')');
				html2 = "<li>"+obj.text+"</li>";
			}else {
				html2 = "<li>"+json.msg+"</li>";
			}
			$("#char_area").append(html2);
			window.scrollTo(0,document.body.scrollHeight);
		}
	});
}

function numFilter(str) {
	var filter = /^[0-9]*$/;
	return filter.test(str);
}

</script>
</body>
</html>