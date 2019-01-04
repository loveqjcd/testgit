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
    
  	<script type="text/javascript" src="../new_mb/scrm.pagination.js"></script>
  	<script type="text/javascript" src="../js/fancybox1.3.4/jquery.mousewheel-3.0.4.pack.js"></script>
  	<script type="text/javascript" src="../js/fancybox1.3.4/jquery.fancybox-1.3.4.pack.js"></script>
  	<link type="text/css" href="../js/fancybox1.3.4/jquery.fancybox-1.3.4.css" rel="stylesheet" media="screen" />
   	<script language="javascript">
		$(document).ready(function(){
	  	<#if pageInfo?exists&&(pageInfo.dataTotal>0)>
			zgpagination(${pageInfo?if_exists.dataTotal?default(0)},${pageInfo?if_exists.currentlyPageNo?default(0)},${pageInfo?if_exists.pageTotal?default(0)});
		</#if>
		});
		
		jQuery(document).ready(function() { 
			$(".show-fancy").fancybox({
				'width' : 700,
				'height' : 440,
				'autoScale' : false,
				'transitionIn' : 'none',
				'transitionOut' : 'none',
				'type' : 'iframe' 
			});
		});
  	</script>
  	<style>
  	.userlike_prisoned {
	  position: absolute;
	  left: 165px;
	  width: 40px;
	  height: 40px;
	  background: url(../image/bg_prisoned_aca55ed.png) no-repeat 0 0;
	}
  	</style>
</head>
<body>
<#assign sign="li_180000"/>
<#assign sign2="li_180020"/>
    <!-- navbar --><#include "../common/navbar.ftl"> <!-- end navbar -->
	<!-- sidebar --><#include "../common/sidebar.ftl"><!-- end sidebar -->

	<!-- main container -->
    <div id="main-content">
		<div class="container">
				<div class="row">
    				<div id="content" class="col-sm-12" style="min-height:200px !important">


        <div class="container-fluid">
            <div id="pad-wrapper" class="users-list">
                <div class="row-fluid">
                	<form id="optForm" method="post" action="../web/userManage.htm?m=list">
                	<input type="hidden" id="pageNo" name="pageNo" value="1" />
                		<table width="100%" border="0" cellspacing="0" cellpadding="5">
                		<tbody>
                			<tr>
                				<td style="text-align:right;white-space:nowrap;">用 户 名：</td>
                				<td><input type="text" class="form-control" style="width:136px;" placeholder="用 户 名" id="username" name="username" value="${username?if_exists}" /></td>
                				<td style="text-align:right;white-space:nowrap;">手机号码：</td>
                				<td><input type="text" class="form-control" style="width:136px;" placeholder="手机号码" id="mobile" name="mobile" value="${mobile?if_exists}" /></td>
                				<td>
                					<a class="btn btn-primary" href="javascript:;" onclick="$('#optForm').submit()">搜&nbsp;&nbsp;索</a>
                				</td>
                				<#if user?exists&&user.type==1>
                				<td style="vertical-align:middle;white-space:nowrap;">
                					<a href="../web/userManage.htm?m=createUser" class="btn btn-warning pull-right show-fancy"><span>+</span>添加管理员</a>
                				</td>
                				</#if>
                			</tr>
                		</tbody>
                		</table>
                	</form>
                </div>

                <!-- Users table -->
                <div class="row-fluid table">
                    <table class="table table-paper table-striped">
                        <thead>
                            <tr>
                                <th class="span3">
									账号用户名
                                </th>
                                <th class="span3">
                                    <span class="line"></span>账号类型
                                </th>
                                <th class="span3">
                                    <span class="line"></span>账号创建者
                                </th>
                                <th class="span3">
                                    <span class="line"></span>角色名称
                                </th>
                                <th class="span2">
                                    <span class="line"></span>账号状态
                                </th>
                                <th class="span2 align-right">
                                    <span class="line"></span>操&nbsp;&nbsp;作
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                        <#if pageInfo?exists&&(pageInfo.data?size>0)>
                        <#list pageInfo.data as bean>
                        <tr <#if bean_index==0>class="first"</#if>>
                            <td>
                            	<#if bean.status?exists&&bean.status==2><span class="userlike_prisoned">&nbsp;</span></#if>
								${bean.username?if_exists}
                            </td>
                            <td>
                            	<#if bean.type?exists&&bean.type==1>超级管理员
                            	<#elseif bean.type?exists&&bean.type==2>普通管理员
                            	<#elseif bean.type?exists&&bean.type==3>代理商管理员
                            	<#elseif bean.type?exists&&bean.type==4>商家管理员
                            	</#if>
                            </td>
                            <td>
                            	<#if bean.createUser?exists>
                            	${bean.createUser.username?if_exists}
                            	<#if bean.createUser.type?exists&&bean.createUser.type==1>【超级管理员】
                            	<#elseif bean.createUser.type?exists&&bean.createUser.type==2>【普通管理员】
                            	<#elseif bean.createUser.type?exists&&bean.createUser.type==3>【代理商管理员】
                            	</#if>
                            	</#if>
                            </td>
                            <td>
                            	<#if bean.userRole?exists>${bean.userRole.name?if_exists}<#else>未设置</#if>
                            </td>
                    		<td>
                            	<#if bean.status?exists&&bean.status==0><span style="color:#7ea13d;">使用中
                            	<#elseif bean.status?exists&&bean.status==1><span style="color:#364377;">审核中
                            	<#elseif bean.status?exists&&bean.status==2><span style="color:red;">禁用中</span>
                            	</#if>
                            </td>
                            <td class="align-right">
                            	<#if (user.type==1&&bean.type==2)>
                                <a class="show-fancy" href="../web/userManage.htm?m=updateUser&userId=${bean.id?if_exists}">修改</a><br>
                                </#if>
                                <#if bean.type!=1&&user.type!=4>
                                <a href="javascript:;" onclick="useOrNo('${bean.id?if_exists}');"><#if bean.status==0>禁用<#elseif bean.status==2>启用</#if></a>
                                </#if>
                            </td>
                        </tr>
                        </#list>
                        <#else>
                        <tr class="first">
                        	<td style="text-align:center;" colspan="5">暂无相关信息记录</td>
                        </tr>
                        </#if>
                        </tbody>
                    </table>
                </div>
                <!-- 分页 -->
				<div id="dt_example" class="pagination pull-right"></div>
                <!-- 分页 -->
                <!-- end users table -->
            </div>
        </div>
    </div></div></div></div>
    <!-- end main container -->

<script language="javascript">

function useOrNo(userId) {
	$.ajax({
		type:"POST",
		url:"../web/userManage.htm?m=useOrNo",
		async:false,
		data:{"userId":userId},
		success:function(data){
			var json = eval('('+data+')');
			if(json.code == "0") {
				showTipMessage(json.msg, 600, 1);
				setTimeout(reload, 600);
			}else {
				showTipMessage(json.msg, 2500, 3);
			}
		}
	});
}

function reload() {
	$("#optForm").submit();
}

</script>
</body>
</html>