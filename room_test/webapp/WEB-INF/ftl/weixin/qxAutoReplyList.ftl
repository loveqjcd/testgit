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
	<link href="../css/wx-material.css" rel="stylesheet">
</head>
<body>
<#assign sign="li_120000"/>
<#assign sign2="li_120030"/>
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
                		<table width="100%" border="0" cellspacing="0" cellpadding="5">
                		<tbody>
                			<tr>
                				<td style="vertical-align:middle;white-space:nowrap;" rowspan="1">
                					<#if user.type==1>
                					<a href="../web/autoReply.htm?m=create&type=keyword" class="btn btn-warning"><span>+</span>关键词自动回复</a>
                					<#if !subscribe?exists>
                					<a href="../web/autoReply.htm?m=create&type=subscribe" class="btn btn-warning" style="margin-left:30px"><span>+</span>关注自动回复</a>
                					</#if>
                					</#if>
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
                                <th class="span2">
									回复类型
                                </th>
                                <th class="span3">
                                    <span class="line"></span>关键词
                                </th>
                                <th class="span3">
                                    <span class="line"></span>回复内容
                                </th>
                                <th class="span2 align-right">
                                    <span class="line"></span>操&nbsp;&nbsp;作
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                        <#if list?exists&&(list?size>0)>
                        <#list list as bean>
                        <tr <#if bean_index==0>class="first"</#if>>
                            <td style="vertical-align:middle;">
                            	<#if bean.type?exists&&bean.type=='subscribe'>关注自动回复
                            	<#elseif bean.type?exists&&bean.type=='keyword'>关键词自动回复
                            	</#if>
                            </td>
                            <td style="vertical-align:middle;">
								<b>${bean.keyword?if_exists}</b>
                            </td>
                            <td style="vertical-align:middle;">
								<#if bean.contentType?exists&&bean.contentType=='text'>
								${bean.content?if_exists}
                            	<#elseif bean.contentType?exists&&bean.contentType=='news'&&bean.material?exists>
								<div class="appmsg" style="width:225px;">
									<a class="appmsg-readm">
										<span class="fl" style="margin-left:5px;"><#if bean.material.subList?exists>多图文<#else>单图文</#if></span>
										<span class="fr">&gt;</span>
									</a>
									<div class="appmsg_item" style="padding:0px;">
										<h4 class="appmsg_title" style="margin-top:0px;margin-left:12px;max-height:40px;line-height:20px;font-size:12px;font-style:normal;">
										<a target="_blank" title="点击预览" href="../common/preview.htm?m=previewMaterial&companyId=${bean.material.companyId?if_exists}&materialId=${bean.material.id?if_exists}">${bean.material.title?if_exists}</a>
										</h4>
									</div>
									<#if bean.material.subList?exists&&(bean.material.subList?size>0)>
									<#list bean.material.subList as msub>
									<div class="appmsg_item" style="padding:0px;">
										<h4 class="appmsg_title" style="margin-top:0px;margin-left:12px;max-height:40px;line-height:20px;font-size:12px;font-style:normal;">
										<a target="_blank" title="点击预览" href="../common/preview.htm?m=previewMaterial&companyId=${bean.material.companyId?if_exists}&materialId=${msub.id?if_exists}">${msub.title?if_exists}</a>
										</h4>
									</div>
									</#list>
									</#if>
								</div>
								<#else>
								<div class="appmsg" style="width:225px;">
									<a class="appmsg-readm">
										<span class="fl" style="margin-left:5px;"><#if bean.material.subList?exists>多图文<#else>单图文</#if></span>
										<span class="fr">&gt;</span>
									</a>
									<div class="appmsg_item" style="padding:0px;">
										<h4 class="appmsg_title" style="margin-top:0px;margin-left:12px;max-height:40px;line-height:20px;font-size:12px;font-style:normal;">
										<a target="_blank" title="点击预览" href="<#if bean.material.url?exists>${bean.material.url?if_exists}<#else>javascript:;</#if>">${bean.material.title?if_exists}</a>
										</h4>
									</div>
									<#if bean.material.subList?exists&&(bean.material.subList?size>0)>
									<#list bean.material.subList as msub>
									<div class="appmsg_item" style="padding:0px;">
										<h4 class="appmsg_title" style="margin-top:0px;margin-left:12px;max-height:40px;line-height:20px;font-size:12px;font-style:normal;">
										<a target="_blank" title="点击预览" href="<#if msub.url?exists>${msub.url?if_exists}<#else>javascript:;</#if>">${msub.title?if_exists}</a>
										</h4>
									</div>
									</#list>
									</#if>
								</div>
                            	</#if>
                            </td>
                            <td class="align-right" style="vertical-align:middle;">
                            	<#if user.type==1>
                            	<a href="../web/autoReply.htm?m=update&replyId=${bean.id?if_exists}" class="show-fancy"">修改</a><br>
                            	<a href="javascript:;" onclick="deleteData('${bean.id?if_exists}');">删除</a>
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
				<div id="dt_example" class="pagination pull-right pagination-lg"></div>
                <!-- 分页 -->
                <!-- end users table -->
            </div>
        </div>
        
        
    </div></div></div></div>
    <!-- end main container -->

<script language="javascript">

function deleteData(replyId) {
	if(confirm("是否确定此操作？")) {
		$.ajax({
			type:"POST",
			url:"../web/autoReply.htm?m=delete",
			async:false,
			data:{"replyId":replyId},
			success:function(data){
				if(data == "ok") {
					showTipMessage("操作成功", 600, 1);
					setTimeout(reload, 600);
				}else {
					showTipMessage("操作失败", 2500, 3);
				}
			}
		});
	}
}

function reload() {
	window.location.reload();
}

</script>
</body>
</html>