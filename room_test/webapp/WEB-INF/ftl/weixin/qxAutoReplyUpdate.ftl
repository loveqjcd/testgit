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
  	<script>
  	jQuery(document).ready(function() { 
			$(".show-fancy").fancybox({
				'width' : 750,
				'height':520,
				'autoScale' : false,
				'transitionIn' : 'none',
				'transitionOut' : 'none',
				'type' : 'iframe' 
			}); 
		});
	</script>
	<link href="../css/wx-material.css" rel="stylesheet">
</head>
<body>
<#assign sign="li_120000"/>
<#assign sign2="li_120040"/>
    <!-- navbar --><#include "../common/navbar.ftl"> <!-- end navbar -->
	<!-- sidebar --><#include "../common/sidebar.ftl"><!-- end sidebar -->
    
	<!-- main container -->
    <div id="main-content">
		<div class="container">
				<div class="row">
    				<div id="content" class="col-sm-12" style="min-height:200px !important">
        
        <div class="col-md-6" style="margin-top:20px">
			<div class="box border primary">
				<div class="box-title">
					<h4><i class="fa fa-bars"></i>修改<#if type?exists&&type=='keyword'>关键词<#else>关注</#if>自动回复</h4>
				</div>
				<div class="box-body big">
					<form class="new_user_form inline-input" id="optForm" method="post" />
						<input type="hidden" id="opt" name="opt" value="save" />
                        <input type="hidden" id="replyId" name="replyId" value="${replyId?if_exists}" />
                        <input type="hidden" id="type" name="type" value="${type?if_exists}" />
                        <input type="hidden" id="projectIds" name="projectIds" value="<#if replyDo.contentType?exists&&replyDo.contentType=='pro'>${replyDo.content?if_exists}</#if>" />
                        <input type="hidden" id="materialId" name="materialId" value="<#if replyDo.contentType?exists&&replyDo.contentType=='news'>${replyDo.content?if_exists}</#if>" />
                                <div class="form-group" <#if type?exists&&type=='subscribe'>style="display:none;"</#if>>
                                    <label>匹配关键词：</label>
                                    <input type="text" class="form-control" name="keyword" id="keyword" placeholder="匹配关键词" value="${replyDo.keyword?if_exists}" />
                                </div>
                                <div class="form-group">
                                    <label>回复消息类型：</label>
                                    <input class="" type="radio" name="contentType" id="" value="text" style="" onclick="mtypeClick(this);" <#if replyDo.contentType?exists&&replyDo.contentType=='text'>checked</#if> /> 文本消息
                                    <input class="" type="radio" name="contentType" id="" value="news" style="margin-left:20px;" onclick="mtypeClick(this);" <#if replyDo.contentType?exists&&replyDo.contentType=='news'>checked</#if> /> 图文消息
                                </div>
                                <div class="form-group" id="text_div" style="<#if replyDo.contentType?exists&&replyDo.contentType=='text'><#else>display:none;</#if>">
                                    <label>回复内容：</label>
                                	<textarea class="form-control" style="height:100px;" name="weixinContent" id="weixinContent" placeholder="微信文本内容"><#if replyDo.contentType?exists&&replyDo.contentType=='text'>${replyDo.content?if_exists}</#if></textarea>
                                </div>
                                <div class="form-group" id="news_div" style="<#if replyDo.contentType?exists&&replyDo.contentType=='news'><#else>display:none;</#if>">
                                    <label>回复内容：</label>
                                	<div id="weixin_news">
                                	<#if replyDo.contentType?exists&&replyDo.contentType=='news'&&material?exists>
                                		<div class="appmsg" style="width:225px;">
											<a class="appmsg-readm">
												<span class="fl" style="margin-left:5px;"><#if material.subList?exists>多图文<#else>单图文</#if></span>
												<span class="fr">&gt;</span>
											</a>
											<div class="appmsg_item" style="padding:0px;">
												<h4 class="appmsg_title" style="margin-top:0px;margin-left:12px;max-height:40px;line-height:20px;font-size:12px;font-style:normal;">
												<a>${material.title?if_exists}</a>
												</h4>
											</div>
											<#if material.subList?exists&&(material.subList?size>0)>
											<#list material.subList as msub>
											<div class="appmsg_item" style="padding:0px;">
												<h4 class="appmsg_title" style="margin-top:0px;margin-left:12px;max-height:40px;line-height:20px;font-size:12px;font-style:normal;">
												<a>${msub.title?if_exists}</a>
												</h4>
											</div>
											</#list>
											</#if>
										</div>
									</#if>
                                	</div>
                                	<a id="select_news" style="<#if replyDo.contentType?exists&&replyDo.contentType=='news'&&material?exists>margin-left:120px</#if>" class="show-fancy" href="../web/materialList.htm?m=select">选择图文</a>
                                </div>
                                
                                <div class="span11 field-box actions">
                            		<input type="button" class="btn btn-primary" style="margin-right:20px;" value="保   存" onclick="save();" />
                                    <span></span>
                                    <input type="button" class="btn btn-default" value="取   消" onclick="javascript:history.go(-1);">
                                </div>
                    </form>
					  
				</div>
			</div>
			
		</div>
        
    </div></div></div></div>
    <!-- end main container -->
<script language="javascript">
String.prototype.replaceAll = function(s1,s2) { 
    return this.replace(new RegExp(s1,"gm"),s2); 
}

function save() {
	var replyId = $("#replyId").val();
	var type = $.trim($("#type").val());
	if(!type) {
		showTipMessage("发生系统错误", 1500, 2)
		return false;
	}
	var keyword = "";
	if(type == "keyword") {
		keyword = $.trim($("#keyword").val());
		if(!keyword) {
			showTipMessage("请输入匹配关键词", 1500, 2)
			return false;
		}
	}
	var contentType = $("input[name='contentType']:checked").val();
	if(!contentType) {
		showTipMessage("请选择回复消息类型", 1500, 2)
		return false;
	}
	var content = "";
	if(contentType == "text") {
		content = $.trim($("#weixinContent").val());
		content = content.replaceAll(" ", "");
		if(!content) {
			showTipMessage("请输入微信内容", 1500, 2)
			return false;
		}
	}else if(contentType == "news") {
		content = $("#materialId").val();
		if(!content) {
			showTipMessage("请选择图文消息", 1500, 2)
			return false;
		}
	}
	$.ajax({
		type:"POST",
		url:"../web/autoReply.htm?m=update",
		data:{"opt":"save","replyId":replyId,"type":type,"keyword":keyword,"contentType":contentType,"content":content},
		async:false,
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

function reload() {
	window.location.href="../web/autoReply.htm?m=list";
}

function mtypeClick(obj) {
	if(obj.value == "text") {
		document.getElementById("text_div").style.display = "block";
		document.getElementById("news_div").style.display = "none";
	}else if(obj.value == "news") {
		document.getElementById("text_div").style.display = "none";
		document.getElementById("news_div").style.display = "block";
	}
}


</script>
</body>
</html>