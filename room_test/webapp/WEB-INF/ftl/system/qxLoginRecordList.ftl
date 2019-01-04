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
   	<script language="javascript">
		$(document).ready(function(){
	  	<#if pageInfo?exists&&(pageInfo.dataTotal>0)>
			zgpagination(${pageInfo?if_exists.dataTotal?default(0)},${pageInfo?if_exists.currentlyPageNo?default(0)},${pageInfo?if_exists.pageTotal?default(0)});
		</#if>
		});
  	</script>
</head>
<body>
<#assign sign="li_180000"/>
<#assign sign2="li_180030"/>
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
                	<form id="optForm" method="post" action="../qxian/qxLoginRecord.htm?m=list">
                	<input type="hidden" id="pageNo" name="pageNo" value="1" />
                		<table width="100%" border="0" cellspacing="0" cellpadding="5">
                		<tbody>
                			<tr>
                				<td style="text-align:right;white-space:nowrap;">用 户 名：</td>
                				<td><input type="text" class="form-control" style="width:136px;" placeholder="用 户 名" id="username" name="username" value="${username?if_exists}" /></td>
                				<td>
                					<a class="btn btn-primary" href="javascript:;" onclick="$('#optForm').submit()">搜&nbsp;&nbsp;索</a>
                				</td>
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
                                <th class="span2">
									登录用户
                                </th>
                                <th class="span2">
                                    <span class="line"></span>登录IP
                                </th>
                                <th class="span2">
                                    <span class="line"></span>登录时间
                                </th>
                                <th class="span2">
                                    <span class="line"></span>登录地点
                                </th>
                                <th class="span2">
                                    <span class="line"></span>网络运营商
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                        <#if pageInfo?exists&&(pageInfo.data?size>0)>
                        <#list pageInfo.data as bean>
                        <tr <#if bean_index==0>class="first"</#if>>
                            <td>
								${bean.username?if_exists}
                            </td>
                            <td>
                            	${bean.ip?if_exists}
                            </td>
                            <td>
                            	${bean.loginTime?if_exists?datetime}
                            </td>
                            <td>
                            	${bean.address?if_exists}
                            </td>
                    		<td>
                            	${bean.isp?if_exists}
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

</script>
</body>
</html>