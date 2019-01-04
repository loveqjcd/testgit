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
  	<style>
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
<#assign sign="li_130000"/>
<#assign sign2="li_130040"/>
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
                	<form id="optForm" method="post" action="../web/subjectList.htm?m=list">
                	<input type="hidden" id="pageNo" name="pageNo" value="1" />
                		<table width="100%" border="0" cellspacing="0" cellpadding="5">
                		<tbody>
                			<tr>
                				<td style="text-align:right;white-space:nowrap;">科目类型：</td>
                				<td>
                					<select class="span5" style='width:150px;height:29px;padding:4px;font-size:12px;border: 1px solid #dddddd;' id="subject" name="subject">
	                                  <option value="">请选择科目类型</option>
	                                  <option value="1" <#if subject?exists&&subject=='1'>selected</#if>>科目一</option>
	                                  <option value="4" <#if subject?exists&&subject=='4'>selected</#if>>科目四</option>
	                                </select>
                				</td>
                				<td style="text-align:right;white-space:nowrap;">驾照类型：</td>
                				<td>
                					<select class="span5" style='width:150px;height:29px;padding:4px;font-size:12px;border: 1px solid #dddddd;' id="model" name="model">
	                                  <option value="">请选择驾照类型</option>
	                                  <option value="a1" <#if model?exists&&model=='a1'>selected</#if>>a1</option>
	                                  <option value="a2" <#if model?exists&&model=='a2'>selected</#if>>a2</option>
	                                  <option value="b1" <#if model?exists&&model=='b1'>selected</#if>>b1</option>
	                                  <option value="b2" <#if model?exists&&model=='b2'>selected</#if>>b2</option>
	                                  <option value="c1" <#if model?exists&&model=='c1'>selected</#if>>c1</option>
	                                  <option value="c2" <#if model?exists&&model=='c2'>selected</#if>>c2</option>
	                                </select>
                				</td>
								<td>
                					<a class="btn btn-primary" href="javascript:;" onclick="$('#optForm').submit()">搜&nbsp;&nbsp;索</a>
                				</td>
                				<#if user?exists&&(user.type==1)>
                				<td>
                					<a href="javascript:;" class="btn btn-warning pull-right" onclick="synSubject();" id="syn_btn">更新题库</a>
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
                        <thead style="white-space:nowrap;">
                            <tr>
                                <th class="span2" style="text-align:center;">
									问&nbsp;&nbsp;题
                                </th>
                                <th class="span2" style="text-align:center;">
                                    <span class="line"></span>A
                                </th>
                                <th class="span2" style="text-align:center;">
                                    <span class="line"></span>B
                                </th>
                                <th class="span2" style="text-align:center;">
                                    <span class="line"></span>C
                                </th>
                                <th class="span2" style="text-align:center;">
                                    <span class="line"></span>D
                                </th>
                                <th class="span2" style="text-align:center;">
                                    <span class="line"></span>科目类型
                                </th>
                                <th class="span2" style="text-align:center;">
                                    <span class="line"></span>驾照类型
                                </th>
                                <th class="span3" style="text-align:center;">
                                    <span class="line"></span>描述信息
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                        <#if pageInfo?exists&&(pageInfo.data?size>0)>
                        <#list pageInfo.data as bean>
                        <tr <#if bean_index==0>class="first"</#if>>
                            <td style="vertical-align:middle;max-width:300px;">
                            	<#if bean.url?exists&&bean.url!=''>
                            	<img style="max-height:50px;" src="${bean.url?if_exists}"><br>
                            	</#if>
                            	<span style="font-weight:bolder;">
                            	${bean.question?if_exists}
                            	</span>
                            </td>
                            <td style="vertical-align:middle;max-width:200px;">
								<#if bean.item1Flag?exists&&bean.item1Flag=='T'>
								<div class="func-y"></div>
								<#else>
								<div class="func-n"></div>
								</#if>
								${bean.item1?if_exists}
                            </td>
                            <td style="vertical-align:middle;max-width:200px;">
								<#if bean.item2Flag?exists&&bean.item2Flag=='T'>
								<div class="func-y"></div>
								<#else>
								<div class="func-n"></div>
								</#if>
								${bean.item2?if_exists}
                            </td>
                            <td style="vertical-align:middle;max-width:200px;">
								<#if bean.item3?exists&&bean.item3!=''>
								<#if bean.item3Flag?exists&&bean.item3Flag=='T'>
								<div class="func-y"></div>
								<#else>
								<div class="func-n"></div>
								</#if>
								${bean.item3?if_exists}
								<#else><span style="color:gray;">--</span>
								</#if>
                            </td>
                            <td style="vertical-align:middle;max-width:200px;">
								<#if bean.item4?exists&&bean.item4!=''>
								<#if bean.item4Flag?exists&&bean.item4Flag=='T'>
								<div class="func-y"></div>
								<#else>
								<div class="func-n"></div>
								</#if>
								${bean.item4?if_exists}
								<#else><span style="color:gray;">--</span>
								</#if>
                            </td>
                            <td style="vertical-align:middle;text-align:center;">
								<#if bean.subject?exists&&bean.subject==1>科目一
								<#elseif bean.subject?exists&&bean.subject==4>科目四
								</#if>								
                            </td>
                            <td style="vertical-align:middle;text-align:center;">
								<#if bean.model?exists&&bean.model!=''>
								${bean.model?if_exists}
								<#else><span style="color:gray;">--</span>
								</#if>
                            </td>
                            <td style="vertical-align:middle;word-break:break-all;max-width:500px;">
                            	${bean.explains?if_exists}
                            </td>
                        </tr>
						</#list>
                        <#else>
                        <tr class="first">
                        	<td style="text-align:center;" colspan="8">暂无相关信息记录</td>
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

function synSubject() {
	if(confirm("此操作会耗时很久很久，是否确认？")) {
		document.getElementById("syn_btn").innerHTML = "更新题库中...";
		$("#syn_btn").removeAttr("onclick");
		$.ajax({
			type:"POST",
			url:"../web/subjectList.htm?m=synSubject",
			async:true,
			success:function(data){
				var json = eval('('+data+')');
				if(json.code == "0") {
					showTipMessage(json.msg, 1000, 1);
				}else {
					showTipMessage(json.msg, 2500, 3);
				}
				$("#syn_btn").attr("onclick", "synSubject()");
				document.getElementById("syn_btn").innerHTML = "更新题库";
			}
		});
	}
}

</script>
</body>
</html>