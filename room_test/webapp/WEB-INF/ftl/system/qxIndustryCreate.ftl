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
					<#if industry?exists>
                    <h4><i class="fa fa-bars"></i>${industry.name?if_exists} --> 新增子行业</h4>
                    <#else>
                    <h4><i class="fa fa-bars"></i>新增一级行业</h4>
                    </#if>
				</div>
				<div class="box-body big">
					<form class="new_user_form" id="optForm" method="post" />
                        <input type="hidden" id="parentId" name="parentId" value="${parentId?if_exists}" />
                        <div class="form-group">
                            <label>行业名称：</label>
                            <input class="form-control" type="text" name="name" id="name" placeholder="行业名称" value="" />
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
	var name = $.trim($("#name").val());
	if(!name) {
		parent.showTipMessage("请输入行业名称", 1500, 2);
		return false;
	}
	var parentId = $("#parentId").val();
	$.ajax({
		type:"POST",
		url:"../qxian/qxIndustryList.htm?m=create",
		async:false,
		data:{"opt":"save","name":name,"parentId":parentId},
		success:function(data){
			if(data == "ok") {
				parent.showTipMessage("添加成功", 600, 1);
				setTimeout(reload, 600);
			}else {
				parent.showTipMessage("添加失败", 2500, 3);
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