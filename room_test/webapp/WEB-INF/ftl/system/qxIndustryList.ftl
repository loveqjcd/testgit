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
				'width' : 500,
				'height' : 300,
				'autoScale' : false,
				'transitionIn' : 'none',
				'transitionOut' : 'none',
				'type' : 'iframe' 
			});
		});
  	</script>
  	<style>
  	.table-paper.table-striped tbody tr:nth-child(even) td, .table-paper.table-striped tbody tr:nth-child(even) th, .table-paper.table-striped tbody tr:nth-child(even):hover td, .table-paper.table-striped tbody tr:nth-child(even):hover th {
    	background-color: #ffffff;
	}
  	</style>
</head>
<body>
<#assign sign="li_180000"/>
<#assign sign2="li_180050"/>
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
                	<form id="optForm" method="post" action="../qxian/qxIndustryList.htm?m=list">
                	<input type="hidden" id="pageNo" name="pageNo" value="1" />
                		<table width="100%" border="0" cellspacing="0" cellpadding="5">
                		<tbody>
                			<tr>
                				<td style="text-align:right;white-space:nowrap;">行业名称：</td>
                				<td><input type="text" class="form-control" style="width:136px;" placeholder="行业名称" id="name" name="name" value="${name?if_exists}" /></td>
                				<td>
                					<a class="btn btn-primary" href="javascript:;" onclick="$('#optForm').submit()">搜&nbsp;&nbsp;索</a>
                				</td>
                				<#if user?exists&&user.type==1>
                				<td style="vertical-align:middle;white-space:nowrap;" rowspan="1">
                					<a href="../qxian/qxIndustryList.htm?m=create" class="btn btn-warning pull-right show-fancy"><span>+</span>新增一级行业</a>
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
                                <th class="span2">
									行业名称
                                </th>
                                <th class="span2">
                                    <span class="line"></span>行业级别
                                </th>
                                <th style="padding-left:20px;" class="span2">
                                    <span class="line"></span>子行业
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
                            <td style="vertical-align:middle;">
								${bean.name?if_exists}
                            </td>
                            <td style="vertical-align:middle;">
								一级行业
                            </td>
                            <td style="vertical-align:middle;">
                            	<table style="width:50%;">
                            		<#if bean.subList?exists&&(bean.subList?size>0)>
                            		<#list bean.subList as indu>
                            		<tr>
                            			<td style="padding-right:20px;line-height:20px;<#if (indu_index>2)>display:none;" class="hide-td${bean.id?if_exists}</#if>">${indu.name?if_exists}</td>
                            			<td style="line-height:20px;<#if (indu_index>2)>display:none;" class="hide-td${bean.id?if_exists}</#if>">
                            				<#if user?exists&&user.type==1>
                            				<a href="../qxian/qxIndustryList.htm?m=update&industryId=${indu.id?if_exists}&parentId=${bean.id?if_exists}" class="show-fancy">修改</a>
                            				</#if>
                            			</td>
                            			<td style="line-height:20px;<#if (indu_index>2)>display:none;" class="hide-td${bean.id?if_exists}</#if>">
                            				<#if user?exists&&user.type==1>
                            				<a href="javascript:;" onclick="deleteIndustry('${indu.id?if_exists}', 2)">删除</a>
                            				</#if>
                            				<#if (bean.subList?size>3)&&indu_index==2>
                            				&nbsp;&nbsp;<a href="javascript:;" onclick="$('.hide-td${bean.id?if_exists}').slideToggle(10);">...更多</a>
                            				</#if>
                            			</td>
                            		</tr>
                            		</#list>
                            		<#else>
                            		<tr>
                            			<td colspan="3">无</td>
                            		</tr>
                            		</#if>
                            	</table>
                            </td>
                            <td style="vertical-align:middle;">
                            	<#if user.type==1>
                                <a href="../qxian/qxIndustryList.htm?m=update&industryId=${bean.id?if_exists}" class="show-fancy">修改</a><br>
                            	<a href="javascript:;" onclick="deleteIndustry('${bean.id?if_exists}', 1);">删除</a><br>
                            	<a href="../qxian/qxIndustryList.htm?m=create&parentId=${bean.id?if_exists}" class="show-fancy">新增子行业</a>
                            	</#if>
                            </td>
                        </tr>
						</#list>
                        <#else>
                        <tr class="first">
                        	<td style="text-align:center;" colspan="4">暂无相关信息记录</td>
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

function deleteIndustry(industryId, type) {
	var msg = "是否确认删除？";
	if(type == 1) {
		msg = "删除一级行业时会删除其下的子行业，是否确认删除？";
	}
	if(confirm(msg)) {
		$.ajax({
			type:"POST",
			url:"../qxian/qxIndustryList.htm?m=delete",
			async:false,
			data:{"industryId":industryId,"type":type},
			success:function(data) {
				var json = eval('('+data+')');
				if(json.code == "0") {
					showTipMessage("删除成功", 600, 1);
					setTimeout(reload, 600);
				}else {
					showTipMessage(json.msg, 2500, 3);
				}
			}
		});
	}
}

function reload() {
	$("#optForm").submit();
}

</script>
</body>
</html>