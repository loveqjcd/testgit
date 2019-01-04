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
  	<script type="text/javascript" src="../js/fancybox1.3.4/jquery.mousewheel-.3.4.pack.js"></script>
  	<script type="text/javascript" src="../js/fancybox1.3.4/jquery.fancybox-1.3.4.pack.js"></script>
  	<link type="text/css" href="../js/fancybox1.3.4/jquery.fancybox-1.3.4.css" rel="stylesheet" media="screen" />
  	<script language="javascript">
	jQuery(document).ready(function() { 
		$(".upload-fancy").fancybox({
			'width' : 700,
			'height' : 436,
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
<#assign sign2="li_180040"/>
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
                	<form id="optForm" method="post" action="../web/imageList.htm?m=list">
                	<input type="hidden" id="pageNo" name="pageNo" value="1" />
                		<table width="100%" border="0" cellspacing="0" cellpadding="5">
                		<tbody>
                			<tr>
                				<td style="text-align:right;white-space:nowrap;">图片类型：</td>
                				<td>
	                                <select class="span5" style='width:150px;height:29px;padding:4px;font-size:12px;border: 1px solid #dddddd;' id="fileSuffix" name="fileSuffix">
	                                  <option value="">请选择图片类型</option>
	                                  <option value="jpg" <#if fileSuffix?exists&&fileSuffix=='jpg'>selected</#if>>JPG</option>
									  <option value="png" <#if fileSuffix?exists&&fileSuffix=='png'>selected</#if>>PNG</option>
									  <option value="gif" <#if fileSuffix?exists&&fileSuffix=='gif'>selected</#if>>GIF</option>
	                                </select>
                				</td>
                				<td style="vertical-align:middle;white-space:nowrap;">
                					<a class="btn btn-primary" href="javascript:;" onclick="$('#optForm').submit()">搜&nbsp;&nbsp;索</a>
                				</td>
                				<td>
                					<a href="../common/uploadPicture.htm?m=commonUpload&type=local&imgId=iconUrl_show&maxSize=1024" class="btn btn-warning pull-right upload-fancy"><span>+</span>上传图片</a>
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
									图 片
                                </th>
                                <th class="span2">
                                    <span class="line"></span>图片属性
                                </th>
                                <th class="span2">
                                    <span class="line"></span>上传日期
                                </th>
                                <th class="span2">
                                    <span class="line"></span>特殊图片
                                </th>
                                <th class="span2 align-right">
                                    <span class="line"></span>操&nbsp;&nbsp;作
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                        <#if pageInfo?exists&&(pageInfo.data?size>0)>
                        <#list pageInfo.data as file>
                        <tr <#if file_index==0>class="first"</#if>>
                            <td>
								<a title="查看原图" style="cursor:pointer;" target="_blank" href="${file.filePath?if_exists}">
                            	<img style="max-height:80px;margin-top:5px;margin-left:5px;margin-bottom:5px;" src="${file.filePath?if_exists}">
								</a>
                            </td>
                            <td style="vertical-align: middle;">
								类型：${file.fileSuffix?if_exists}<br>
								大小：${file.fileSizeKb?if_exists}&nbsp;KB<br>
								尺寸：${file.fileDesc?if_exists}
                            </td>
                            <td style="vertical-align: middle;">
								${file.uploadTime?if_exists?datetime}
                            </td>
                            <td style="vertical-align: middle;">
                            	<#if file.fileMemo?exists&&file.fileMemo=='wap'>
                            	<span style="color:red;">wap广告</span><br>
								排序：${file.merchantId?if_exists}
                            	</#if>
                            </td>
                            <td class="align-right" style="vertical-align: middle;">
                            	<#if user.type==1>
                            	<a href="javascript:;" onclick="deleteData('${file.id?if_exists}');">删除</a><br>
                            	<a href="../web/imageList.htm?m=setWap&fileId=${file.id?if_exists}" class="upload-fancy">广告设置</a>
                            	</#if>
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
				<div id="dt_example" class="pagination pull-right pagination-lg"></div>
                <!-- 分页 -->
                <!-- end users table -->
            </div>
        </div>
        
        
    </div></div></div></div>
    <!-- end main container -->

<script language="javascript">

function deleteData(fileId) {
	if(confirm("是否确认删除？")) {
		$.ajax({
			type:"POST",
			url:"../web/imageList.htm?m=deleteData",
			async:false,
			data:{"fileId":fileId},
			success:function(data) {
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
	$("#optForm").submit();
}

</script>
</body>
</html>