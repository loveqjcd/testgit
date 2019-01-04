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
<#assign sign="li_130000"/>
<#assign sign2="li_130012"/>
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
					<h4><i class="fa fa-bars"></i>接口测试</h4>
				</div>
				<div class="box-body big">
					<div class="form-group">
						<label for="exampleInputEmail1">接口名称：</label>
						<select class="span5" style='width:150px;height:29px;padding:4px;font-size:12px;border: 1px solid #dddddd;' id="apiId" name="apiId" onchange="changeApi()">
	                    <option value="">请选择接口名称</option>
	                    <#list apiList as api>
	                    <option value="${api.id?if_exists}">${api.apiName?if_exists}</option>
	                    </#list>
	                    </select>
					</div>
					<#list apiList as api>
					<div id="api_div_${api.id?if_exists}" class="api-div" style="display:none;">
					<form class="" id="optForm_${api.id?if_exists}" />
                        <div class="form-group">
							<label for="exampleInputEmail1">请求地址：</label>
							<input readonly type="text" class="form-control" name="apiUrl_${api.id?if_exists}" id="apiUrl_${api.id?if_exists}" placeholder="请求地址" value="${api.apiUrl?if_exists}">
					  	</div>
					  	<div class="form-group">
							<label for="exampleInputEmail1">请求方式：</label>
							<select class="span5" style='width:150px;height:29px;padding:4px;font-size:12px;border: 1px solid #dddddd;' id="reqType_${api.id?if_exists}" name="reqType_${api.id?if_exists}">
		                    <option value="">请选择请求方式</option>
		                    <#if api.methodGet?exists&&api.methodGet==0>
		                    <option value="get">get</option>
		                    </#if>
		                    <#if api.methodPost?exists&&api.methodPost==0>
		                    <option value="post">post</option>
		                    </#if>
		                    </select>
					  	</div>
					  	<div class="form-group">
							<label for="exampleInputEmail1">请求参数：</label>
					  	</div>
					  	<#if api.params?exists&&(api.params?size>0)>
					  	<#list api.params as param>
					  	<div class="form-group">
							<label for="exampleInputEmail1">${param?if_exists}：</label>
							<input type="text" class="form-control" name="${param?if_exists}_${api.id?if_exists}" id="${param?if_exists}_${api.id?if_exists}" value="">
					  	</div>
					  	</#list>
					  	</#if>
                        <div class="span11 field-box actions">
                            <input type="button" class="btn btn-primary" style="margin-right:20px;" value="发送请求" onclick="apiTest('${api.id?if_exists}');" />
                        </div>
                    </form>
					</div>
					</#list>
				</div>
			</div>
		 </div>
		 <div class="col-md-6" style="margin-top:20px">
			<div class="box border primary">
				<div class="box-title">
					<h4><i class="fa fa-bars"></i>请求信息</h4>
				</div>
				<div class="box-body big">
					<div class="form-group">
						<label for="exampleInputEmail1">请求详情：</label>
						<span id="req_msg"></span>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">返回内容：</label>
						<span id="res_msg"></span>
					</div>
				</div>
			</div>
		 </div>
		
    </div></div></div></div>
    <!-- end main container -->
<script language="javascript">

function changeApi() {
	var apiId = $("#apiId").val();
	$(".api-div").hide();
	if(apiId != null && apiId != "") {
		$("#api_div_"+apiId).show();
	}
}

function apiTest(apiId) {
	var reqType = $("#reqType_"+apiId).val();
	if(!reqType) {
		showTipMessage("请选择请求方式", 1500, 2);
		return false;
	}
	$.ajax({
		type:"POST",
		url:"../web/apiTest.htm?m=apiTest&apiId="+apiId+"&reqType="+reqType,
		data:$('#optForm_'+apiId).serialize(),
		async:false,
		success:function(data){
			var json = eval('('+data+')');
			if(json.code == '0') {
				document.getElementById("req_msg").innerHTML = json.req_msg;
				document.getElementById("res_msg").innerHTML = json.res_msg;
				showTipMessage(json.msg, 600, 1);
			}else {
				showTipMessage(json.msg, 2500, 3);
			}
		}
	});
}

</script>
</body>
</html>