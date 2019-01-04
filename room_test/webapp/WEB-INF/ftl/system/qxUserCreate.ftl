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
</head>
<body>
	<!-- main container -->
    		<div class="box border primary">
				<div class="box-title">
					<h4><i class="fa fa-bars"></i>添加平台管理员</h4>
				</div>
				<div class="box-body big">
					<form class="new_user_form" id="optForm" method="post" />
                        <input type="hidden" id="opt" name="opt" value="create" />
                        <div class="form-group" >
                            <label>用 户 名：</label>
                            <input class="form-control" style="" type="text" name="username" id="username" placeholder="登录用户名" value="" />
                        </div>
                        <div class="form-group">
                            <label>手机号码：</label>
                            <input class="form-control" style="" type="text" name="mobile" id="mobile" placeholder="手机号码" value="" />
                        </div>
                        <div class="form-group">
                            <label>登录密码：</label>
                            <input class="form-control" style=""  type="text" name="password" id="password" placeholder="登录密码" value="" />
                        </div>
                        <div class="form-group">
                            <label>选择管理员角色：</label>
                            <#if roleList?exists&&(roleList?size>0)>
                            <#list roleList as role>
                            <input class="" type="radio" name="roleId" id="" value="${role.id?if_exists}" /><span class="ml5 mr10" >${role.name?if_exists}</span>
                            </#list>
                            <#else><br><span>未设置管理员账号角色</span>
                            </#if>
                        </div>
                        
                        <div class="span11 field-box actions">
                            <input type="button" class="btn btn-primary" style="margin-right:20px;" value="保   存" onclick="save();" />
                            <span></span>
                            <input type="reset" value="取   消" class="btn btn-default" onclick="javascript:history.go(-1);">
                        </div>
                    </form>
					  
				</div>
			</div>
    <!-- end main container -->
<script language="javascript">

function isMobile(mobile) {
	var Expression = /^0?1[2|3|4|5|6|7|8|9][0-9]\d{8}$/;
	var objExp = new RegExp(Expression);
	if(objExp.test(mobile)==true){
		return true;
	}else{
		return false;
	}
}

function save() {
	var username = $.trim($("#username").val());
	var mobile = $.trim($("#mobile").val());
	var password = $.trim($("#password").val());
	var roleId = $("input[name='roleId']:checked").val();
	if(!username) {
		parent.showTipMessage("请输入登录用户名", 1500, 2);
		return false;
	}
	if(!mobile || !isMobile(mobile)) {
		parent.showTipMessage("请输入手机号码", 1500, 2);
		return false;
	}
	if(!password) {
		parent.showTipMessage("请设置登录密码", 1500, 2);
		return false;
	}
	if(!roleId) {
		parent.showTipMessage("请选择管理员账号角色", 1500, 2);
		return false;
	}
	$.ajax({
		url:"../web/userManage.htm?m=createUser",
		async:false,
		data:{"opt":"save","username":username,"mobile":mobile,"password":password,"roleId":roleId},
		success:function(data) {
			var json = eval('('+data+')');
			if(json.code == "0") {
				parent.showTipMessage(json.msg, 600, 1);
				setTimeout(reload, 600);
			}else {
				parent.showTipMessage(json.msg, 2500, 3);
			}
		}
	});
}

function reload() {
	parent.$("#optForm").submit();
}

</script>
</body>
</html>