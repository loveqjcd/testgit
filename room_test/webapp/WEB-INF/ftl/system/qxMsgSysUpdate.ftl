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
					<h4><i class="fa fa-bars"></i>编辑系统通知</h4>
				</div>
				<div class="box-body big">
					<form class="new_user_form" id="optForm" method="post"/>
						<input type="hidden" name="msgId" id="msgId" value="${msgId?if_exists}" />
                        <div class="form-group">
                            <label>消息内容：</label>
                            <textarea class="form-control" style="height:200px;" name="content" id="contents" placeholder="消息内容">${msg.content?if_exists}</textarea>
                        </div>
                        <div class="form-group">
                            <label>是否显示通知：</label>
                            <input class="" type="radio" name="status" id="" value="0" <#if msg.status?exists&&msg.status==0>checked</#if> /><span class="ml5 mr10" >显示</span>
                            <input class="" type="radio" name="status" id="" value="1" <#if msg.status?exists&&msg.status==1>checked</#if> /><span class="ml5 mr10" >不显示</span>
                        </div>
                        <div class="form-group">
                            <label>显示排序：</label>
                        	<input class="form-control" type="text" name="orderIndex" id="orderIndex" placeholder="显示排序，数值越大越靠前" onkeyup="value=value.replace(/[^\d]/g, '')" value="${msg.orderIndex?if_exists}" />
                        </div>
                        
                        <div class="span11 field-box actions mt20">
                            <input id="c_menu" type="button" class="btn btn-primary" style="margin-right:20px;" value="保   存" onclick="save();" />
                            <span></span>
                            <input type="reset" value="取   消" class="btn btn-default" onclick="parent.$.fancybox.close();">
                        </div>
                    </form>
					  
				</div>
			</div>
    <!-- end main container -->
<script language="javascript">

function save() {
	var content = $.trim($("#contents").val());
	if(!content) {
		parent.showTipMessage("请输入消息内容", 1500, 2)
		return false;
	}
	var status = $("input[name='status']:checked").val();
	if(!status) {
		parent.showTipMessage("请设置通知显示状态", 1500, 2)
		return false;
	}
	var orderIndex = $("#orderIndex").val();
	if(status == 0 && !(parseInt(orderIndex) > 0)) {
		parent.showTipMessage("请输入显示排序", 1500, 2);
		return false;
	}
	var msgId = $("#msgId").val();
	$.ajax({
		type:"POST",
		url:"../web/msgList.htm?m=update",
		data:{"opt":"sys","content":content,"orderIndex":orderIndex,"status":status,"msgId":msgId},
		async:false,
		success:function(data){
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