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
				'height':500,
				'autoScale' : false,
				'transitionIn' : 'none',
				'transitionOut' : 'none',
				'type' : 'iframe' 
			}); 
		});
  	</script>
</head>
<body>
<#assign sign="li_120000"/>
<#assign sign2="li_120010"/>
    <!-- navbar --><#include "../common/navbar.ftl"> <!-- end navbar -->
	<!-- sidebar --><#include "../common/sidebar.ftl"><!-- end sidebar -->

	<!-- main container -->
    <div id="main-content">
		<div class="container">
			<div id="main-stats">
                <div class="row-fluid stats-row">
                    <div class="stat last" style="margin-bottom:20px;">
                        <span class="date" style="left:50px;">
                        <p><span style="color:#b90808;font-weight:bold;">温馨提示：</span>
                      	微信公众号的接入是由管理员登录微信公众平台后台，进入开发者中心填写服务器配置并启用，若是初次成为开发者，请进入公众号后台填写URL、Token获取AppId、AppSecret。<span style="color:#b90808;">此功能仅超级管理员admin有权限设置。</span>
                      	</p>
                      	</span>
                    </div>
                </div>
            </div>
				<div class="row">
    				<div id="content" class="col-sm-12" style="min-height:200px !important">

        <div class="container-fluid">
            <div id="pad-wrapper" class="users-list">
                <div class="row-fluid">
                	<form id="optForm" method="post">
                	</form>
                </div>

                <!-- Users table -->
                <div class="">
                    <table class="table table-paper table-striped">
                        <thead>
                            <tr>
                                <th class="span3" style="text-align:center;">
									微信名称 / 微信号
                                </th>
                                <th class="span2" style="text-align:center;">
									账号类型
                                </th>
                                <th class="span3" style="text-align:center;">
									URL
                                </th>
                                <th class="span2" style="text-align:center;">
									Token
                                </th>
                                <th class="span2" style="text-align:center;">
									AppID
                                </th>
                                <th class="span3" style="text-align:center;">
									AppSecret
                                </th>
                                <th class="span2" style="text-align:center;">
                                    <span class="line"></span>操作
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                        <tr class="first">
                        	<#if weixinList?exists&&(weixinList?size>0)>
                        	<#list weixinList as bean>
                            <td style="text-align:center;word-break:break-all;">
								${bean.weixinName?if_exists} / ${bean.weixinNo?if_exists}
                            </td>
                            <td style="text-align:center;">
								${bean.serviceType?if_exists}
                            </td>
                            <td style="text-align:center;word-break:break-all;">
								${bean.messageUrl?if_exists}
                            </td>
                            <td style="text-align:center;">
								${bean.messageToken?if_exists}
                            </td>
                            <td style="text-align:center;">
								${bean.appid?if_exists}
                            </td>
                            <td style="text-align:center;word-break:break-all;">
								${bean.appsecret?if_exists}
                            </td>
                            <td style="text-align:center;">
                            	<#if user?exists&&user.type==1&&user.username=='admin'>
                            	<a class="show-fancy" href="../web/weixinInfo.htm?m=update&paraId=${bean.id?if_exists}">修改</a>
                            	</#if>
                            </td>
                            </#list>
                            <#else>
                            <td style="text-align:center;" colspan="7">
                            	暂未接入公众号 
                            	<#if user?exists&&user.type==1&&user.username=='admin'>
                            	<a style="margin-left:30px;" class="show-fancy" href="../web/weixinInfo.htm?m=create">立即接入</a>
                            	</#if>
                            </td>
                            </#if>
                        </tr>
                        </tbody>
                    </table>
               </div>
                <!-- 分页 -->
				<div id="dt_example" class="pagination pull-right pagination-lg"></div>
                <!-- 分页 -->
                <!-- end users table -->
            </div>
        </div>
        
        
    </div></div></div></div>
    <!-- end main container -->

<script language="javascript">

</script>
</body>
</html>