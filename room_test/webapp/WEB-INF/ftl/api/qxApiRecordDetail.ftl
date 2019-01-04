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
					<h4><i class="fa fa-bars"></i>接口调用信息</h4>
				</div>
				<div class="box-body big">
					<form class="new_user_form" id="optForm" method="post"/>
                        <input type="hidden" id="opt" name="opt" value="save" />
                        <div class="form-group">
                            <label>接口名称：</label>
                            <span><#if apiDo?exists>${apiDo.apiName?if_exists}</#if></span>
                        </div>
                        <div class="form-group">
                            <label>请求url：</label>
                            <span><#if apiDo?exists>${apiDo.apiUrl?if_exists}</#if></span>
                        </div>
                        <div class="form-group">
                            <label>请求参数：</label>
                            <span>${recordDo.reqParam?if_exists}</span>
                        </div>
                        <div class="form-group">
                            <label>请求方式：</label>
                            <span>${recordDo.reqType?if_exists}</span>
                        </div>
                        <div class="form-group">
                            <label>请求时间：</label>
                            <span>${recordDo.createTime?if_exists?datetime}</span>
                        </div>
                        <div class="form-group">
                            <label>请求返回code：</label>
                            <span>${recordDo.resCode?if_exists}</span>
                        </div>
                        <div class="form-group">
                            <label>请求返回msg：</label>
                            <span>${recordDo.resMsg?if_exists}</span>
                        </div>
                    </form>
					  
				</div>
			</div>
    <!-- end main container -->
<script language="javascript">

</script>
</body>
</html>