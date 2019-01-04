<!DOCTYPE html>
<html class="login-bg">
<head>
	<title>${sysTitle}</title>
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
   
    <!-- this page specific styles -->
    <link rel="stylesheet" href="../css/compiled/signup.css" type="text/css" media="screen" />
    
   
	<link rel="stylesheet" type="text/css" href="../new_mb/css/cloud-admin.css" >
	<link rel="stylesheet" type="text/css"  href="../new_mb/css/responsive.css" >
	<!-- STYLESHEETS --><!--[if lt IE 9]><script src="../new_mb/js/flot/excanvas.min.js"></script><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
	<link href="../new_mb/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<!-- FONTS -->
	<!-- JAVASCRIPTS -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- JQUERY -->
	<script src="../new_mb/js/jquery/jquery-2.0.3.min.js"></script>
	<!-- JQUERY UI-->
	<script src="../new_mb/js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
	<!-- BOOTSTRAP -->
	<script src="../new_mb/bootstrap-dist/js/bootstrap.min.js"></script>
	<!-- COOKIE -->
	<script type="text/javascript" src="../new_mb/js/jQuery-Cookie/jquery.cookie.min.js"></script>
	<!-- CUSTOM SCRIPT -->
	<script src="../new_mb/js/script.js"></script>



    <script type="text/javascript" src="../js/fancybox/jquery.mousewheel-3.0.2.pack.js"></script>
	<script type="text/javascript" src="../js/fancybox/jquery.fancybox-1.3.1.pack.js"></script>
	<link type="text/css" href="../js/fancybox/jquery.fancybox-1.3.1.css" rel="stylesheet" media="screen" />
    
    <style type="text/css">
    .global_tip{ position:fixed;_position:absolute; z-index:2000; width:100%; max-width:1440px; min-width:1000px; text-align:center;}
  	.global_tip .tip_block{padding:3px 15px 5px;*padding:5px 10px;font-size:14px; color:#fff; border-radius:15px;}
  	.global_tip .tip_success{ background-color:#74b749;}
  	.global_tip .tip_warning{ background-color:#ffb400;}
  	.global_tip .tip_error{background-color:#ed6d49;}
  	</style>
  	<script language="javascript">
	jQuery(document).ready(function() { 
		$(".show-warn").fancybox({
			'width' : 700,
			'height' : 450,
			'autoScale' : false,
			'transitionIn' : 'none',
			'transitionOut' : 'none',
			'type' : 'iframe'
		}); 
	});
//	var url = window.location.href;
//	if(url.indexOf("https") < 0) {
//		url = url.replace("http:", "https:");
//		window.location.replace(url); 
//	}
  	</script>
  	<div id="tip_notice" class="global_tip" style="top:10px;display:none;">
		<span class="tip_block">提示信息</span>
  	</div>
</head>
<body class="login">
    <!-- PAGE -->
	<section id="page">
			<!-- HEADER -->
			<header>
				<!-- NAV-BAR -->
				<div class="container">
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<div id="logo">
								<a href="javascript:;"><img src="img/logo.png" height="40" /></a>
							</div>
						</div>
					</div>
				</div>
				<!--/NAV-BAR -->
			</header>
			<!--/HEADER -->
			<!-- LOGIN -->
			<section id="login" class="visible">
				<div class="container">
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<div class="login-box-plain">
								<h2 class="bigintro">用户登录</h2>
								<div class="divide-40"></div>
								<form role="form" id="optForm" method="post" action="../userLogin.htm?operate=login">
								  <div class="form-group">
									<label for="exampleInputEmail1">用户名</label>
									<i class="fa fa-envelope"></i>
									<input type="text" class="form-control" style="height:34px" id="username" name="username" placeholder="请输入用户名" >
								  </div>
								  <div class="form-group"> 
									<label for="exampleInputPassword1">密&nbsp;&nbsp;码</label>
									<i class="fa fa-lock"></i>
									<input type="password" class="form-control" style="height:34px" id="password" name="password" placeholder="请输入密码" >
								  </div>
								  <div class="form-actions">
									
									<button type="submit" onclick="submitForm();" class="btn btn-danger">登&nbsp;&nbsp;录</button>
								  </div>
								</form>					
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--/LOGIN -->
			
			<div class="login-wrapper" style="width:100%">
			<div class="span12 already" style="margin-top:60px;">
	            <p>版权所有  ©${.now?if_exists?substring(0, 4)} 常识小哥</p>
	            <a target="_blank" href="http://www.miitbeian.gov.cn/">沪ICP备88888888号</a>
	        </div>
			</div>
	</section>
	<!--/PAGE -->

<script language="javascript">
<#if errorMessage?exists&&errorMessage!=''>
	showTipMessage("${errorMessage?if_exists}", 2500, 3);
</#if>

document.onkeydown = function(event){
	var e = event || window.event || arguments.callee.caller.arguments[0];
	if(e && e.keyCode == 13) {
		submitForm()
	}
}

function submitForm() {
	var browserFlag = $("#browserFlag").val();
	if(browserFlag == "") {
		browserFlag = "no";
		var isIE = window.navigator.userAgent.indexOf("MSIE");
		if(isIE != -1) {
			var ie5 = window.navigator.userAgent.indexOf("MSIE 5.0");
			var ie6 = window.navigator.userAgent.indexOf("MSIE 6.0");
			var ie7 = window.navigator.userAgent.indexOf("MSIE 7.0");
			if(ie5 != -1 || ie6 != -1 || ie7 != -1) {
				browserFlag = "yes";
			}
		}
	}
	if(browserFlag == "yes") {
		$("#browserFlag").val("yes");
		$("#broswer_notice").click();
	}else {
		$("#optForm").submit();
	}
}

function showTipMessage(text, time, type) {
	var notice = document.getElementById("tip_notice");
	$(notice).slideToggle();	
	var tar = notice.getElementsByTagName("span")[0];
	tar.innerHTML = text;
	if(type == 1) {
		$(tar).addClass("tip_success");
	}else if(type == 2) {
		$(tar).addClass("tip_warning");
	}else if(type == 3) {
		$(tar).addClass("tip_error");
	}else {
		$(tar).addClass("tip_warning");
	}
	setTimeout(hideTipMessage, time);
}

function hideTipMessage() {
	var notice = document.getElementById("tip_notice");
	$(notice).slideToggle();
	var tar = notice.getElementsByTagName("span")[0];
	tar.innerHTML = "";
	$(tar).removeClass("tip_success");
	$(tar).removeClass("tip_warning");
	$(tar).removeClass("tip_error");
}

</script>
</body>
</html>