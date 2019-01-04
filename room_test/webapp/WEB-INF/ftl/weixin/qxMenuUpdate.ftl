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
</head>
<body>
	<!-- main container -->
    		<div class="box border primary">
				<div class="box-title">
					<h4><i class="fa fa-bars"></i>修改菜单</h4>
				</div>
				<div class="box-body big">
					<form class="new_user_form" id="optForm" method="post"/>
								<input type="hidden" id="menuId" name="menuId" value="${menuDo.id?if_exists}" />
                        		<div class="form-group">
                                    <label>父级菜单：</label>
                                    <select class="form-control" style='width:180px;height:29px;padding:4px;font-size:12px;border: 1px solid #dddddd;' id="parentId" name="parentId">
	                                  <option value="-1">请选择父级菜单</option>
	                                  <#if list?exists&&(list?size>0)>
	                                  <#list list as menu>
	                                  <option value='${menu.id?if_exists}' <#if menuDo.parentId?exists&&menuDo.parentId?string==menu.id?string>selected</#if>>${menu.name?if_exists}</option>
	                                  </#list>
	                                  </#if>
	                                </select>
                                </div>
                            	<div class="form-group">
                                    <label>菜单名称：</label>
                                    <input class="form-control" type="text" name="name" id="name" placeholder="${menuDo.name?if_exists}" value="${menuDo.name?if_exists}" />
                                </div>
                            	<div class="form-group">
                                    <label>显示排序：</label>
                                    <input class="form-control" type="text" name="orderIndex" id="orderIndex" placeholder="显示排序" onkeyup="value=value.replace(/[^\d]/g, '')" value="${menuDo.orderIndex?if_exists}" />
                                </div>
                                <div class="form-group">
                                    <label>菜单类型：</label>
                                    <input class="" type="radio" name="type" id="" value="click" onclick="mtypeClick(this);" style="" <#if menuDo.type?exists&&menuDo.type=='click'>checked</#if> /> 点击推事件
                                    <input class="" type="radio" name="type" id="" value="view" onclick="mtypeClick(this);" style="margin-left:20px;" <#if menuDo.type?exists&&menuDo.type=='view'>checked</#if> /> 跳转URL
                                </div>
                                <div class="form-group" id="keyword_div" style="display:<#if menuDo.type?exists&&menuDo.type=='click'>block<#else>none</#if>;">
                                    <label>关联关键词：</label>
                                	<input class="form-control" type="text" name="keyword" id="keyword" placeholder="关联关键词" <#if menuDo.type?exists&&menuDo.type=='click'>value="${menuDo.keyword?if_exists}"</#if> />
                                </div>
                                <div class="form-group" id="url_div" style="display:<#if menuDo.type?exists&&menuDo.type=='view'>block<#else>none</#if>;">
                                    <label>跳转URL：</label>
                                	<input class="form-control" type="text" name="url" id="url" placeholder="跳转URL" <#if menuDo.type?exists&&menuDo.type=='view'>value="${menuDo.keyword?if_exists}"</#if> />
                                </div>
                                
		                        <div class="span11 field-box actions mt20">
		                            <input type="button" class="btn btn-primary" style="margin-right:20px;" value="保   存" onclick="save();" />
		                            <span></span>
		                            <input type="reset" value="取   消" class="btn btn-default" onclick="parent.$.fancybox.close();">
		                        </div>
                    </form>
					  
				</div>
			</div>
    <!-- end main container -->
<script language="javascript">

function save() {
	var menuId = $("#menuId").val();
	var parentId = $("#parentId").val();
	var name = $.trim($("#name").val());
	if(!name) {
		parent.showTipMessage("请输入菜单名称", 1500, 2);
		return false;
	}
	if(name.length > 0) {
		name = name.substring(0, 8);
	}
	var orderIndex = $("#orderIndex").val();
	if(!(parseInt(orderIndex) > 0)) {
		parent.showTipMessage("请输入显示排序", 1500, 2);
		return false;
	}
	var type = $("input[name='type']:checked").val();
	if(!type) {
		parent.showTipMessage("请选择菜单类型", 1500, 2);
		return false;
	}
	var key = "";
	if(type == "click") {
		key = $.trim($("#keyword").val());
		if(!key) {
			parent.showTipMessage("请输入关联关键词", 1500, 2);
			return false;
		}
	}else {
		key = $.trim($("#url").val());
		if(!key) {
			parent.showTipMessage("请输入跳转URL", 1500, 2);
			return false;
		}
	}
	$.ajax({
		type:"POST",
		url:"../web/menuList.htm?m=update",
		async:false,
		data:{"opt":"save","menuId":menuId,"parentId":parentId,"name":name,"orderIndex":orderIndex,"type":type,"key":key},
		success:function(data){
			var json = eval('('+data+')');
			if(json.code == "0") {
				parent.showTipMessage("操作成功", 600, 1);
				setTimeout(reload, 600);
			}else {
				parent.showTipMessage(json.msg, 2500, 3);
			}
		}
	});
}

function reload() {
	parent.location.reload();
}

function mtypeClick(obj) {
	if(obj.value == "click") {
		document.getElementById("keyword_div").style.display = "block";
		document.getElementById("url_div").style.display = "none";
	}else if(obj.value == "view") {
		document.getElementById("keyword_div").style.display = "none";
		document.getElementById("url_div").style.display = "block";
	}
}

</script>
</body>
</html>