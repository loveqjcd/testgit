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
<#assign sign="li_180000"/>
<#assign sign2="li_180060"/>
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
                	<form id="optForm" method="post" action="../web/msgList.htm?m=list">
                	<input type="hidden" id="pageNo" name="pageNo" value="1" />
                		<table width="100%" border="0" cellspacing="0" cellpadding="5">
                		<tbody>
                			<tr>
                				<td style="text-align:right;white-space:nowrap;">消息类型：</td>
                				<td>
	                                <select class="span5" style='width:150px;height:29px;padding:4px;font-size:12px;border: 1px solid #dddddd;' id="type" name="type">
	                                  <option value="">请选择消息类型</option>
	                                  <option value="0" <#if type?exists&&type=='0'>selected</#if>>系统通知</option>
	                                  <option value="1" <#if type?exists&&type=='1'>selected</#if>>用户留言</option>
	                                </select>
                				</td>
                				<td style="text-align:right;white-space:nowrap;">消息内容：</td>
                				<td>
                					<input type="text" class="form-control" style="width:136px;" placeholder="消息内容" name="content" value="${content?if_exists}" />
                				</td>
                				<td style="text-align:right;white-space:nowrap;">手机号码：</td>
                				<td>
                					<input type="text" class="form-control" style="width:136px;" placeholder="手机号码" id="mobile" name="mobile" value="${mobile?if_exists}" />
                				</td>
								<td>
                					<a class="btn btn-primary" href="javascript:;" onclick="$('#optForm').submit()">搜&nbsp;&nbsp;索</a>
                				</td>
                				<#if user?exists&&(user.type==1)>
                				<td>
                					<a href="../web/msgList.htm?m=create&fun=sys" class="show-fancy btn btn-warning pull-right"><span>+</span>发布通知</a>
                				</td>
                				</#if>
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
									消息类型
                                </th>
                                <th class="span3" style="">
                                    <span class="line"></span>消息内容
                                </th>
                                <th class="span2" style="">
                                    <span class="line"></span>消息相关
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
                            	<#if bean.type?exists&&bean.type==0><b>系统通知</b>
                            	<#elseif bean.type?exists&&bean.type==1><span>用户留言</span>
                            	</#if>
                            </td>
                            <td style="vertical-align:middle;word-break:break-all;max-width:400px;">
								<b>${bean.content?if_exists}</b><#if bean.type==1&&bean.status==1><span> [${bean.gmtCreate?if_exists?datetime}]</span></#if>
								<#if bean.type==1&&bean.status==1&&bean.list?exists&&(bean.list?size>0)>
								<#list bean.list as obj>
								<br><span style="color:gray;margin-left:20px;">回复：${obj.content?if_exists} [${obj.gmtCreate?if_exists?datetime}]</span>
								</#list>
								</#if>
                            </td>
                            <td style="vertical-align:middle;">
                            	<#if bean.type?exists&&bean.type==0>
                            	<#if bean.status==0>显示排序：${bean.orderIndex?if_exists}
                            	<#elseif bean.status==1><span style="color:gray">不显示</span>
                            	</#if>
                            	<#elseif bean.type?exists&&bean.type==1>
                            	${bean.username?if_exists}<br>${bean.mobile?if_exists}<br>${bean.email?if_exists}
                            	</#if>
                            </td>
                            <td style="vertical-align:middle;">
                            	<#if bean.type?exists&&bean.type==0>
                            	<a href="../web/msgList.htm?m=update&msgId=${bean.id?if_exists}" class="show-fancy">修改</a>
                            	<#elseif bean.type?exists&&bean.type==1>
                            	<a href="../web/msgList.htm?m=create&resId=${bean.id?if_exists}&fun=res" class="show-fancy">回复</a>
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