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
    
  	<script type="text/javascript" src="../js/fancybox1.3.4/jquery.mousewheel-3.0.4.pack.js"></script>
  	<script type="text/javascript" src="../js/fancybox1.3.4/jquery.fancybox-1.3.4.pack.js"></script>
  	<link type="text/css" href="../js/fancybox1.3.4/jquery.fancybox-1.3.4.css" rel="stylesheet" media="screen" />
    <script language="javascript">
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
  	<style>
	.board {
	  background: url("../image/bg_repno.gif") no-repeat scroll 0 0 transparent;
	  padding-left: 55px;
	}
	</style>
</head>
<body>
<#assign sign="li_120000"/>
<#assign sign2="li_120020"/>
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
                					<a href="../web/menuList.htm?m=create" class="btn btn-warning show-fancy"><span>+</span>新增菜单</a>
                					<#if opt?exists&&opt=='opt'>
                					<a id="c_menu" href="javascript:;" onclick="createMenu();" class="btn btn-warning">生成自定义菜单</a>
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
									显示排序
                                </th>
                                <th class="span2">
                                    <span class="line"></span>菜单级别
                                </th>
                                <th class="span2">
                                    <span class="line"></span>菜单名称
                                </th>
                                <th class="span2">
                                    <span class="line"></span>菜单类型
                                </th>
                                <th class="span3">
                                    <span class="line"></span>关键词 / 外链URL
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
								${bean.orderIndex?if_exists}
                            </td>
                            <#if bean.level?exists&&bean.level==1>
                            <td style="vertical-align:middle;">
								主菜单
                            </td>
                            <td style="vertical-align:middle;">
								<b>${bean.name?if_exists}</b>
                            </td>
                            <td style="vertical-align:middle;">
								${bean.type?if_exists}
                            </td>
                            <td style="vertical-align:middle;">
								${bean.keyword?if_exists}
                            </td>
                            <#elseif bean.level?exists&&bean.level==2>
                            <td style="vertical-align:middle;">
								子菜单
                            </td>
                            <td style="vertical-align:middle;">
                            	<div class="board"><span>${bean.name?if_exists}</span></div>
                            </td>
                            <td style="vertical-align:middle;">
								<#if bean.type?exists&&bean.type=='click'>点击推事件
								<#elseif bean.type?exists&&bean.type=='view'>跳转URL
								</#if>
                            </td>
                            <td style="vertical-align:middle;">
                            	<span style="word-break:break-all;">
								${bean.keyword?if_exists}
								</span>
                            </td>
                            </#if>
                            <td class="align-right" style="vertical-align:middle;">
                            	<#if user.type==1>
                            	<a href="../web/menuList.htm?m=update&menuId=${bean.id?if_exists}" class="show-fancy">修改</a><br>
                            	<a href="javascript:;" onclick="deleteData('${bean.id?if_exists}');">删除</a>
                            	</#if>
                            </td>
                        </tr>
						</#list>
                        <#else>
                        <tr class="first">
                        	<td style="text-align:center;" colspan="6">暂无相关信息记录</td>
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

function deleteData(menuId) {
	if(confirm("是否确定此操作？")) {
		$.ajax({
			type:"POST",
			url:"../web/menuList.htm?m=delete",
			async:false,
			data:{"menuId":menuId},
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

function createMenu() {
	if(confirm("自定义主菜单最多生成三个，每个主菜单下最多五个子菜单，请确认？")) {
		$("#c_menu").removeAttr("onclick");
		$.ajax({
			type:"POST",
			url:"../web/menuList.htm?m=createMenu",
			async:false,
			success:function(data){
				var json = eval('('+data+')');
				if(json.code == "0") {
					showTipMessage("操作成功", 600, 1);
					setTimeout(reload, 600);
				}else {
					showTipMessage(json.msg, 2500, 3);
				}
			}
		});
	}
}

</script>
</body>
</html>