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
	<link rel="stylesheet" type="text/css" href="../new_mb/js/datatables/media/assets/css/datatables.min.css">
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
				'height' : 520,
				'autoScale' : false,
				'transitionIn' : 'none',
				'transitionOut' : 'none',
				'type' : 'iframe' 
			}); 
		});
  	</script>
</head>
<body>
<#assign sign="li_130000"/>
<#assign sign2="li_130020"/>
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
                	<form id="optForm" method="post" action="../web/apiRecord.htm?m=list">
                	<input type="hidden" id="pageNo" name="pageNo" value="1" />
                		<table width="100%" border="0" cellspacing="0" cellpadding="5">
                		<tbody>
                			<tr>
                				<td style="text-align:right;white-space:nowrap;">接口名称：</td>
                				<td>
	                                <select class="span5" style='width:150px;height:29px;padding:4px;font-size:12px;border: 1px solid #dddddd;' id="apiId" name="apiId">
	                                  <option value="">请选择接口名称</option>
	                                  <#list apiList as api>
	                                  <option value="${api.id}" <#if apiId?exists&&apiId==api.id?string>selected</#if>>${api.apiName?if_exists}</option>
	                                  </#list>
	                                </select>
                				</td>
                				<td style="text-align:right;white-space:nowrap;">请求方式：</td>
                				<td>
	                                <select class="span5" style='width:150px;height:29px;padding:4px;font-size:12px;border: 1px solid #dddddd;' id="reqType" name="reqType">
	                                  <option value="">请选择请求方式</option>
	                                  <option value="post" <#if reqType?exists&&reqType=='post'>selected</#if>>post</option>
	                                  <option value="get" <#if reqType?exists&&reqType=='get'>selected</#if>>get</option>
	                                </select>
                				</td>
								<td>
                					<a class="btn btn-primary" href="javascript:;" onclick="$('#optForm').submit()">搜&nbsp;&nbsp;索</a>
                				</td>
                			</tr>
                		</tbody>
                		</table>
                	</form>
                </div>

                <!-- Users table -->
                <div class="">
                    <table class="table table-paper table-striped">
                        <thead>
                            <tr>
                                <th class="span2" style="">
									接口名称
                                </th>
                                <th class="span2" style="">
                                    <span class="line"></span>请求url
                                </th>
                                <th class="span2" style="">
                                    <span class="line"></span>请求参数
                                </th>
                                <th class="span2" style="">
                                    <span class="line"></span>请求方式
                                </th>
                                <th class="span2" style="">
                                    <span class="line"></span>请求返回code
                                </th>
                                <th class="span2" style="">
                                    <span class="line"></span>请求时间
                                </th>
                                <th class="span2" style="">
                                    <span class="line"></span>操&nbsp;&nbsp;作
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                        <#if pageInfo?exists&&(pageInfo.data?size>0)>
                        <#list pageInfo.data as bean>
                        <tr <#if bean_index==0>class="first"</#if>>
                            <td style="vertical-align:middle;">
                            	<#if bean.api?exists>
                            	${bean.api.apiName?if_exists}
                            	</#if>
                            </td>
                            <td style="vertical-align:middle;">
								<#if bean.api?exists>
                            	${bean.api.apiUrl?if_exists}
                            	</#if>
                            </td>
                            <td style="vertical-align:middle;">
                            	${bean.reqParam?if_exists}
                            </td>
                            <td style="vertical-align:middle;">
								${bean.reqType?if_exists}
                            </td>
                            <td style="vertical-align:middle;">
								${bean.resCode?if_exists}
                            </td>
                            <td style="vertical-align:middle;">
								${bean.createTime?if_exists?datetime}
                            </td>
                            <td style="vertical-align:middle;">
								<a href="../web/apiRecord.htm?m=detail&recordId=${bean.id?if_exists}" class="show-fancy">查看</a>
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