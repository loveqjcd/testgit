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
					<h4><i class="fa fa-bars"></i>新增接口</h4>
				</div>
				<div class="box-body big">
					<form class="new_user_form" id="optForm" method="post"/>
                        <input type="hidden" id="opt" name="opt" value="save" />
                        <div class="form-group">
                            <label>接口名称：</label>
                            <input class="form-control" type="text" name="apiName" id="apiName" placeholder="接口名称" />
                        </div>
                        <div class="form-group">
                            <label>标识code：</label>
                            <input class="form-control" type="text" name="apiCode" id="apiCode" placeholder="接口标识code" value="" />
                        </div>
                        <div class="form-group">
                            <label>应用key：</label>
                            <input class="form-control" type="text" name="apiKey" id="apiKey" placeholder="应用key" value="" />
                        </div>
                        <div class="form-group">
                            <label>请求url：</label>
                            <input class="form-control" type="text" name="apiUrl" id="apiUrl" placeholder="请求url" value="" />
                        </div>
                        <div class="form-group">
                            <label>请求参数：</label>
                            <input class="form-control" type="text" name="apiParam" id="apiParam" placeholder="请求参数，格式p1=%p1%&p2=%p2%" value="" />
                        </div>
                        <div class="form-group">
                            <label>请求方式get：</label>
                            <input class="" type="radio" name="methodGet" id="" value="0" checked /><span class="ml5 mr10" >是</span>
                            <input class="" type="radio" name="methodGet" id="" value="1" /><span class="ml5 mr10" >否</span>
                        </div>
                        <div class="form-group">
                            <label>请求方式post：</label>
                            <input class="" type="radio" name="methodPost" id="" value="0" checked /><span class="ml5 mr10" >是</span>
                            <input class="" type="radio" name="methodPost" id="" value="1" /><span class="ml5 mr10" >否</span>
                        </div>
                        <div class="form-group">
                            <label>接口调试状态：</label>
                            <input class="" type="radio" name="status" id="" value="0" checked /><span class="ml5 mr10" >是</span>
                            <input class="" type="radio" name="status" id="" value="1" /><span class="ml5 mr10" >否</span>
                        </div>
                        <div class="form-group">
                            <label>wap显示状态：</label>
                            <input class="" type="radio" name="showStatus" id="" value="0" checked /><span class="ml5 mr10" >是</span>
                            <input class="" type="radio" name="showStatus" id="" value="1" /><span class="ml5 mr10" >否</span>
                        </div>
                        <div class="form-group">
                            <label>显示排序：</label>
                            <input class="form-control" type="text" name="orderIndex" id="orderIndex" placeholder="显示排序" onkeyup="value=value.replace(/[^\d]/g, '')" value="1" />
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
	var apiName = $.trim($("#apiName").val());
	if(!apiName) {
		parent.showTipMessage("请输入接口名称", 1500, 2)
		return false;
	}
	var apiCode = $.trim($("#apiCode").val());
	if(!apiCode) {
		parent.showTipMessage("请输入接口唯一标识code", 1500, 2)
		return false;
	}
	var apiKey = $.trim($("#apiKey").val());
	if(!apiKey) {
		parent.showTipMessage("请输入应用key", 1500, 2)
		return false;
	}
	var apiUrl = $.trim($("#apiUrl").val());
	if(!apiUrl) {
		parent.showTipMessage("请输入请求url", 1500, 2)
		return false;
	}
	var apiParam = $.trim($("#apiParam").val());
	var methodGet = $("input[name='methodGet']:checked").val();
	var methodPost = $("input[name='methodPost']:checked").val();
	if(methodGet == '1' && methodPost == '1') {
		parent.showTipMessage("请至少选择一种请求方式", 1500, 2)
		return false;
	}
	var status = $("input[name='status']:checked").val();
	if(!status) {
		parent.showTipMessage("请设置接口调试状态", 1500, 2)
		return false;
	}
	var showStatus = $("input[name='showStatus']:checked").val();
	if(!showStatus) {
		parent.showTipMessage("请设置wap显示状态", 1500, 2)
		return false;
	}
	var orderIndex = $("#orderIndex").val();
	if(showStatus == 0 && !(parseInt(orderIndex) > 0)) {
		parent.showTipMessage("请输入显示排序", 1500, 2);
		return false;
	}
	$.ajax({
		type:"POST",
		url:"../web/apiList.htm?m=create",
		data:{"opt":"save","apiName":apiName,"apiCode":apiCode,"apiKey":apiKey,"apiUrl":apiUrl,"apiParam":apiParam,"methodGet":methodGet,"methodPost":methodPost,"orderIndex":orderIndex,"status":status,"showStatus":showStatus},
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