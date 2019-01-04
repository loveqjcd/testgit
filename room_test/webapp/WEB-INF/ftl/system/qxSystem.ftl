<!DOCTYPE html>
<html>
<head>
	<title>${sysTitle}</title>
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
    <link rel="stylesheet" type="text/css" href="../new_mb/css/cloud-admin.css" >
	<link rel="stylesheet" type="text/css"  href="../new_mb/css/themes/default.css" id="skin-switcher" >
	<link rel="stylesheet" type="text/css"  href="../new_mb/css/responsive.css" >
	<!-- STYLESHEETS --><!--[if lt IE 9]><script src="../new_mb/js/flot/excanvas.min.js"></script><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
	<link href="../new_mb/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<!-- FONTS -->
	<!-- JAVASCRIPTS -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- JQUERY -->
	<!--<script src="../new_mb/js/jquery/jquery-2.0.3.min.js"></script>-->
	<script src="../js/jquery-1.7.2.min.js"></script>
	<!-- JQUERY UI-->
	<script src="../new_mb/js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
	<!-- BOOTSTRAP -->
	<script src="../new_mb/bootstrap-dist/js/bootstrap.min.js"></script>
	<!-- TABLE CLOTH -->
	<link rel="stylesheet" type="text/css" href="../new_mb/js/tablecloth/css/tablecloth.min.css" />
	<!-- COOKIE -->
	<script type="text/javascript" src="../new_mb/js/jQuery-Cookie/jquery.cookie.min.js"></script>
	<!-- CUSTOM SCRIPT -->
	<script src="../new_mb/js/script.js"></script>
	
	<script>
		jQuery(document).ready(function() {		
			App.setPage("qxHome");  //Set current page
			App.init(); //Initialise plugins and elements
		});
	</script>
	<!-- /JAVASCRIPTS -->
</head>
<body>
<#assign sign="li_180000"/>
<#assign sign2="li_180010"/>
    <!-- navbar --><#include "../common/navbar.ftl"> <!-- end navbar -->
	<!-- sidebar --><#include "../common/sidebar.ftl"><!-- end sidebar -->
    
	<!-- main container -->
    <div id="main-content">
		<div class="container">
				<div class="row">
    				<div id="content" class="col-sm-12" style="min-height:200px !important">
        
        <div class="col-md-6" style="margin-top:20px">
			<div class="box border primary">
				<div class="box-title">
					<h4><i class="fa fa-bars"></i>账号信息</h4>
				</div>
				<div class="box-body big">
					<form class="new_user_form inline-input" id="optForm" method="post" action="../web/system.htm?m=updateUser" />
                        <div class="form-group">
							<label for="exampleInputEmail1">用 户 名：</label>
							<input readonly type="text" class="form-control" name="username" id="username" placeholder="用户名" value="${user.username?if_exists}">
					  	</div>
                        
                        <div class="form-group">
                            <label for="exampleInputEmail1">手机号码：</label>
                            <input readonly class="form-control" type="text" name="mobile" id="mobile" placeholder="手机号码" value="${user.mobile?if_exists}" />
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">联系电话：</label>
                            <input readonly class="form-control" type="text" name="tel" id="tel" placeholder="联系电话" value="${user.tel?if_exists}" />
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">电子邮箱：</label>
                            <input readonly class="form-control" type="text" name="email" id="email" placeholder="电子邮箱" value="${user.email?if_exists}"/>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">修改密码：</label>
                            <input type="hidden" value="no" id="isChangePassword" name="isChangePassword" />
                            <input class="" disabled type="radio" name="pw" id="" value="yes" onclick="chooseThis(this);" style="margin-right:10px;" />是
                            <input class="" disabled type="radio" name="pw" id="" value="no" onclick="chooseThis(this);" checked style="margin-left:30px;margin-right:10px;" />否
                        </div>
                        <div id="passArea" style="display:none;">
                        <div class="form-group">
                            <label for="exampleInputEmail1">输入密码：</label>
                            <input class="form-control" type="password" name="password1" id="password1" placeholder="输入密码" />
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">确认密码：</label>
                            <input class="form-control"type="password" name="password2" id="password2" placeholder="确认密码" />
                        </div>
                        </div>
                        <div class="span11 field-box actions">
                            <input type="button" class="btn btn-primary" style="margin-right:20px;" value="修   改" onclick="updateForm();" id="updateButton" />
                            <input type="button" class="btn btn-primary" style="margin-right:20px;display:none;" value="保   存" onclick="saveUpdate();" id="saveButton" />
                        </div>
                    </form>
					  
				</div>
			</div>
			
		</div>
        
    </div></div></div></div>
    <!-- end main container -->
<script language="javascript">
<#if updateUser?exists && updateUser=="true">
	<#if isChangePassword?exists && isChangePassword=="yes">
	showTipMessage("修改密码成功,将于3秒内自动退出，请重新登录!", 3000, 1);
	setTimeout(logout3s, 3000);
	<#else>
	showTipMessage("修改成功", 1500, 1);
	</#if>
<#elseif updateUser?exists && updateUser=="false">
	showTipMessage("操作失败了-_-!", 1500, 3);
</#if>

function logout3s() {
	window.location.href = "../../userLogin.htm?m=logout";
}

function updateForm() {
	var form = document.getElementById("optForm");
	var inputs = form.getElementsByTagName("input");
	for(var i=0;i<inputs.length;i++) {
		if(i > 0) {
			inputs[i].removeAttribute("readonly");
		}
		inputs[i].removeAttribute("disabled");
	}
	$(form).removeClass("inline-input");
	$("#updateButton").hide();
	$("#saveButton").show();
}

function saveUpdate() {
	var username = $.trim($("#username").val());
	var email = $.trim($("#email").val());
	var mobile = $.trim($("#mobile").val());
	if(username == "") {
		showTipMessage("请输入用户昵称", 1500, 2);
		return false;
	}
	if(email == "") {
		showTipMessage("请输入用户邮箱", 1500, 2);
		return false;
	}
	var emailFilter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if(!emailFilter.test(email)) {
		showTipMessage("邮箱格式不正确,请重新输入", 1500, 2);
		return false;
	}
	if(mobile == "") {
		showTipMessage("请输入用户手机", 1500, 2);
		return false;
	}
	var mobileFilter = /^0?1[3|4|5|8][0-9]\d{8}$/;
	if(!mobileFilter.test(mobile)) {
		showTipMessage("手机号格式不正确,请重新输入", 1500, 2);
		return false;
	}
	
	var isChangePassword = $("#isChangePassword").val();
	if(isChangePassword == "yes") {
		var password1 = $.trim($("#password1").val());
		var password2 = $.trim($("#password2").val());
		if(password1 == "") {
			showTipMessage("请输入新密码", 1500, 2);
			return false;
		}
		if(password2 == "") {
			showTipMessage("请再次输入密码", 1500, 2);
			return false;
		}
		if(password1 != password2) {
			showTipMessage("两次密码输入不一致", 1500, 2);
			return false;
		}
		$("#password1").val(password1);
		$("#password2").val(password2)
	}
	$("#username").val(username);
	$("#email").val(email);
	$("#mobile").val(mobile);
	$("#tel").val($.trim($("#tel").val()));
	
	$("#optForm").submit();
}

function chooseThis(obj) {
	if(obj.value == "yes") {
		$("#passArea").show();
	}
	if(obj.value == "no") {
		$("#passArea").hide();
	}
	$("#isChangePassword").val(obj.value);
}

</script>
</body>
</html>