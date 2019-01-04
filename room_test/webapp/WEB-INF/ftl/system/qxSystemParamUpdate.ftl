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
					<h4><i class="fa fa-bars"></i>全局参数设置</h4>
				</div>
				<div class="box-body big">
					<form class="new_user_form" id="optForm" method="post"/>
                        <input type="hidden" id="opt" name="opt" value="save" />
                        <input type="hidden" id="sid" name="sid" value="${sid?if_exists}" />
                        <div class="form-group">
                            <label>活动结束延迟时间：</label>
                            <input class="form-control" type="text" name="lotTime" id="lotTime" placeholder="活动结束延迟时间" onkeyup="value=value.replace(/[^\d]/g, '')" value="${systemParamDo.lotTime?if_exists}" />
                            <span>活动结束延迟时间参数即是红包活动领取完或是红包活动到结束时间时，活动相应延迟时间（单位：分钟）</span>
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

function save() {
	var sid = $("#sid").val();
	var lotTime = $.trim($("#lotTime").val());
	$.ajax({
		type:"POST",
		url:"../web/systemParam.htm?m=update",
		async:false,
		data:{"opt":"save","sid":sid,"lotTime":lotTime},
		success:function(data){
			var json = eval('('+data+')');
			if(json.code == "0") {
				parent.showTipMessage("操作成功", 600, 1);
				setTimeout(reload, 600);
			}else {
				parent.showTipMessage(json.msg, 2500, 3);
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