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
					<h4><i class="fa fa-bars"></i>微信公众号接入</h4>
				</div>
				<div class="box-body big">
					<form class="new_user_form" id="optForm" method="post"/>
                        <input type="hidden" id="paraId" name="paraId" value="${paraId?if_exists}" />
                        <div class="form-group">
                            <label>微信名称：</label>
                            <input class="form-control" type="text" name="sellerName" id="sellerName" placeholder="微信名称" value="${paraDo.weixinName?if_exists}" />
                        </div>
                        <div class="form-group">
                            <label>微 信 号：</label>
                            <input class="form-control" type="text" name="sellerNick" id="sellerNick" placeholder="微信号" value="${paraDo.weixinNo?if_exists}" />
                        </div>
                        <div class="form-group">
                            <label>账号类型：</label>
                            <input class="" type="radio" name="serviceType" id="" value="订阅号" <#if paraDo.serviceType?exists&&paraDo.serviceType=='订阅号'>checked</#if> /><span class="ml5 mr10" >订阅号</span>
                            <input class="" type="radio" name="serviceType" id="" value="服务号" <#if paraDo.serviceType?exists&&paraDo.serviceType=='服务号'>checked</#if> /><span class="ml5 mr10" >服务号</span>
                        </div>
                        <div class="form-group">
                            <label>原始ID：</label>
                            <input class="form-control" type="text" name="sellerId" id="sellerId" placeholder="原始ID" onkeyup="changeID();" value="${paraDo.sourceId?if_exists}" />
                        </div>
                        <div class="form-group">
                            <label>URL：</label>
                            <span id="span_auth">${wechatUrl?if_exists}</span><span id="span_url">${paraDo.sourceId?if_exists}</span>
                        </div>
                        <div class="form-group">
                            <label>Token：</label>
                            <span id="span_token">${paraDo.sourceId?if_exists}</span>
                        </div>
                        <div class="form-group">
                            <label>
                            </label>
                            <span style="color:#b94a48;">若是初次成为开发者，请进入公众号后台填写URL、Token获取AppId、AppSecret</span>
                        </div>
                        <div class="form-group">
                            <label>AppID：</label>
                            <input class="form-control" type="text" name="appid" id="appid" placeholder="开发者凭据AppID" value="${paraDo.appid?if_exists}" />
                        </div>
                        <div class="form-group">
                            <label>AppSecret：</label>
                            <input class="form-control" type="text" name="appsecret" id="appsecret" placeholder="开发者凭据AppSecret" value="${paraDo.appsecret?if_exists}" />
                        </div>
                                
                        <div class="span11 field-box actions mt20">
                            <input type="button" class="btn btn-primary" style="margin-right:20px;" value="保   存" onclick="save();" />
                            <span></span>
                            <input type="reset" value="取   消" class="btn btn-default" onclick="parent.$.fancybox.close();">
                        </div>
                    </form>
					  
				</div>
			</div>
    <!-- end main container -->
<script language="javascript">

function changeID() {
	var sellerId = $.trim($("#sellerId").val());
	if(sellerId == "") {
		sellerId = "原始ID";
	}
	document.getElementById("span_url").innerHTML = sellerId;
	document.getElementById("span_token").innerHTML = sellerId;
}

function save() {
	var paraId = $.trim($("#paraId").val());
	var sellerName = $.trim($("#sellerName").val());
	var sellerNick = $.trim($("#sellerNick").val());
	var serviceType = $("input[name='serviceType']:checked").val();
	var sellerId = $.trim($("#sellerId").val());
	var appid = $.trim($("#appid").val());
	var appsecret = $.trim($("#appsecret").val());

	if(!sellerName) {
		showTipMessage("请输入微信名称", 1500, 2);
		return false;
	}
	if(!sellerNick) {
		showTipMessage("请输入微信号", 1500, 2);
		return false;
	}
	if(!serviceType) {
		showTipMessage("请选择账号类型", 1500, 2);
		return false;
	}
	if(!sellerId) {
		showTipMessage("请输入原始ID", 1500, 2);
		return false;
	}
	if(!appid) {
		showTipMessage("请输入appid", 1500, 2);
		return false;
	}
	if(!appsecret) {
		showTipMessage("请输入appsecret", 1500, 2);
		return false;
	}
	$.ajax({
		type:"POST",
		url:"../web/weixinInfo.htm?m=update",
		async:false,
		data:{"opt":"save","paraId":paraId,"sellerName":sellerName,"sellerNick":sellerNick,"serviceType":serviceType,"sellerId":sellerId,"appid":appid,"appsecret":appsecret},
		success:function(data){
			if(data == "ok") {
				parent.showTipMessage("操作成功", 600, 1);
				setTimeout(reload, 600);
			}else if(data == "error") {
				parent.showTipMessage("操作失败", 2500, 3);
			}else {
				parent.showTipMessage("操作失败，只能添加一个公众号", 2500, 3);
			}
		}
	});
}

function reload() {
	parent.location.reload();
}

</script>
</body>
</html>