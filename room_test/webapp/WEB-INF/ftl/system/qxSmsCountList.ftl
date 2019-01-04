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
  	</script>
</head>
<body>
<#assign sign="li_180000"/>
<#assign sign2="li_180010"/>
    <!-- navbar --><#include "../common/navbar.ftl"> <!-- end navbar -->
	<!-- sidebar --><#include "../common/sidebar.ftl"><!-- end sidebar -->

	<!-- main container -->
	<div id="main-content">
			<div class="container">
					<div class="row">
	    				<div id="content" class="col-sm-12" style="min-height:200px !important">

        <div class="container-fluid">
        	<div id="main-stats" style="float:right">
                <div class="row-fluid stats-row">
                    <div class="stat last">
                        <span class="date">
                        <p><span style="color:#b90808;font-weight:bold;">温馨提示：</span>
                      	当前短信余额数：<span style="color:#b90808;font-weight:bold;"><#if smsAccountDo?exists>${smsAccountDo.remain?if_exists?default(0)}<#else>0</#if></span> ，
                      	累计充值短信数：<span style="color:#b90808;font-weight:bold;"><#if smsAccountDo?exists>${smsAccountDo.totalSms?if_exists?default(0)}<#else>0</#if></span> ，
                      	累计充值短信金额：<span style="color:#b90808;font-weight:bold;"><#if smsAccountDo?exists>${smsAccountDo.totalMoney?if_exists?string("#0.00")}<#else>0.00</#if></span> 元
                      </p></span>
                    </div>
                </div>
            </div>
            
            <div id="pad-wrapper" class="users-list" style="margin-top:10px;">
                <div class="row-fluid">
                	<form id="optForm" method="post" action="../web/smsCount.htm?m=list">
                	<input type="hidden" id="pageNo" name="pageNo" value="1" />
                		<table width="100%" border="0" cellspacing="0" cellpadding="5">
                		<tbody>
                			<tr>
                				<td style="text-align:right;white-space:nowrap;">手机号码：</td>
                				<td>
                					<input type="text" class="form-control" style="width:136px;" placeholder="手机号码" id="mobiles" name="mobiles" value="${mobiles?if_exists}" />
                				</td>
                				<td style="text-align:right;white-space:nowrap;">短信内容：</td>
                				<td>
                					<input type="text" class="form-control" style="width:136px;" placeholder="短信内容" id="smsContent" name="smsContent" value="${smsContent?if_exists}" />
                				</td>
                				<td style="text-align:right;white-space:nowrap;">短信类型：</td>
                				<td>
	                                <select class="span5" style='width:150px;height:29px;padding:4px;font-size:12px;border: 1px solid #dddddd;' id="eventType" name="eventType">
                        				<option value="">请选择短信类型</option>
										<option value="reg" <#if eventType?exists&&eventType=='reg'>selected</#if>>会员信息验证</option>
										<option value="wifi" <#if eventType?exists&&eventType=='wifi'>selected</#if>>红包验证</option>
									</select>
                				</td>
                				<td style="vertical-align:middle;white-space:nowrap;" rowspan="1">
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
                                <th class="span3">
									手机号码
                                </th>
                                <th class="span3">
                                    <span class="line"></span>短信内容
                                </th>
                                <th class="span3">
                                    <span class="line"></span>短信类型
                                </th>
                                <th class="span2">
                                    <span class="line"></span>短信状态
                                </th>
                                <th class="span3">
                                    <span class="line"></span>产生时间
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                        <#if pageInfo?exists&&(pageInfo.data?size>0)>
                        <#list pageInfo.data as bean>
                        <tr <#if bean_index==0>class="first"</#if>>
                            <td>
								${bean.mobiles?if_exists}
                            </td>
                            <td>
								${bean.smsContent?if_exists}
                            </td>
                            <td>
                            	<#if bean.eventType?exists&&bean.eventType=='reg'>会员信息验证
                            	<#elseif bean.eventType?exists&&bean.eventType=='pwd'>密码找回验证
                            	<#elseif bean.eventType?exists&&bean.eventType=='wifi'>红包验证
                            	</#if>
                            </td>
                            <td>
                            	<#if bean.status?exists&&bean.status==0>等待发送
                            	<#elseif bean.status?exists&&bean.status==1>发送成功
                            	<#else>发送失败
                            	</#if>
                            </td>
                            <td>
                            	${bean.createTime?if_exists?datetime}
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