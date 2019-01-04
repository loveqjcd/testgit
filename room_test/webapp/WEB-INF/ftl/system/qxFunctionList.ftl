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
	<style>
	.board {
	  background: url("../image/bg_repno.gif") no-repeat scroll 0 0 transparent;
	  padding-left: 55px;
	}
	.func-y {
		background: url("../new_mb/img/func-y.png") no-repeat scroll 0 0 transparent;
		width:20px;
		height:20px;
		background-size:contain;
		margin-left: 20px;
	}
	.func-n {
		background: url("../new_mb/img/func-n.png") no-repeat scroll 0 0 transparent;
		width:20px;
		height:20px;
		background-size:contain;
		margin-left: 20px;
	}
	</style>
</head>
<body>
<#assign sign="li_190000"/>
<#assign sign2="li_190040"/>
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
                	<form id="optForm" method="post">
                	<input type="hidden" id="pageNo" name="pageNo" value="1" />
                	</form>
                </div>

                <!-- Users table -->
                <div class="mt20">
                    <table class="table table-paper table-striped">
                        <thead>
                            <tr>
                            	<th class="span1">
									#
                                </th>
                                <th class="span2">
									<span class="line"></span>功能菜单
                                </th>
                                <th class="span2">
                                    <span class="line"></span>菜单级别
                                </th>
                                <th class="span2">
                                    <span class="line"></span>超级管理员
                                </th>
                                <th class="span2">
                                    <span class="line"></span>普通管理员
                                </th>
                                <th class="span2">
                                    <span class="line"></span>代理商账号
                                </th>
                                <th class="span2">
                                    <span class="line"></span>商家账号
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                        <#if infoList?exists&&(infoList?size>0)>
                        <#list infoList as bean>
                        <tr <#if bean_index==0>class="first"</#if>>
                            <td>
                            	${bean_index + 1}
                            </td>
                            <td>
								<div <#if bean.functionLevel?exists&&bean.functionLevel==2>class="board"</#if>><span>${bean.functionName?if_exists}</span></div>
                            </td>
                            <td>
								<#if bean.functionLevel?exists&&bean.functionLevel==1>一级菜单
								<#elseif bean.functionLevel?exists&&bean.functionLevel==2><div class="board"><span>二级菜单</span></div>
								</#if>
                            </td>
                            <td>
                            	<div class="func-y"></div>
                            </td>
                    		<td>
                            	<#if bean.isType2?exists&&bean.isType2=="Y"><div class="func-y"></div>
                            	<#else><div class="func-n"></div>
                            	</#if>
                            </td>
                            <td>
								<#if bean.isType3?exists&&bean.isType3=="Y"><div class="func-y"></div>
                            	<#else><div class="func-n"></div>
                            	</#if>
                            </td>
                            <td>
								<#if bean.isType4?exists&&bean.isType4=="Y"><div class="func-y"></div>
                            	<#else><div class="func-n"></div>
                            	</#if>
                            </td>
                        </tr>
						</#list>
                        <#else>
                        <tr class="first">
                        	<td style="text-align:center;" colspan="7">暂无相关信息记录</td>
                        </tr>
                        </#if>
                        </tbody>
                    </table>
               </div>
                <!-- end users table -->
            </div>
        </div>
        
        
    </div></div></div></div>
    <!-- end main container -->

<script language="javascript">

</script>
</body>
</html>