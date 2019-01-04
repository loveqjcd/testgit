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
					<h4><i class="fa fa-bars"></i>修改账号角色</h4>
				</div>
				<div class="box-body big">
					<form class="new_user_form" id="optForm" method="post" />
                        <input type="hidden" id="opt" name="opt" value="save" />
                        <input type="hidden" id="roleId" name="roleId" value="${userRoleDo.id?if_exists}" />
                        <input type="hidden" id="type" name="type" value="${userRoleDo.type?if_exists}" />
                        <div class="form-group">
                            <label>角色名称：</label>
                            <input class="form-control" type="text" name="name" id="name" placeholder="角色名称" value="${userRoleDo.name?if_exists}" />
                        </div>
                        <div class="form-group">
                            <label>备注信息：</label>
                            <input class="form-control" type="text" name="memo" id="memo" placeholder="备注信息" value="${userRoleDo.memo?if_exists}" />
                        </div>
                        <div class="form-group">
                            <label>角色类型：</label>
                            <#if user?exists&&user.type==1>
                            <input disabled class="" type="radio" name="type1" id="" value="2" <#if userRoleDo.type?exists&&userRoleDo.type==2>checked</#if> /><span class="ml5 mr20">管理员账号角色</span>
                            </#if>
                            <#if user?exists&&(user.type==1||user.type==2)>
                            <input disabled class="" type="radio" name="type1" id="" value="3" <#if userRoleDo.type?exists&&userRoleDo.type==3>checked</#if> /><span class="ml5 mr20">代理商账号角色</span>
                            </#if>
                            <#if user?exists&&(user.type==1||user.type==2||user.type==3)>
                            <input disabled class="" type="radio" name="type1" id="" value="4" <#if userRoleDo.type?exists&&userRoleDo.type==4>checked</#if> /><span class="ml5 mr20">商家账号角色</span>
                            </#if>
                        </div>
                        <div id="func_tp_2" class="form-group" <#if userRoleDo.type?exists&&userRoleDo.type==2>style="display:block;"<#else>style="display:none;"</#if>>
                            <label>功能权限：</label>
                            <#if info2List?exists&&(info2List?size>0)>
                            <table border="1" cellspacing="0" cellpadding="5" class="table table-bordered">
                            <tbody>
								<#list info2List as info>                                    
                            	<tr>
                            		<td style="width:10%;white-space:nowrap;padding-left:10px;padding-right:10px;">
                            			<input type="checkbox" name="info2" id="info2_${info.id?if_exists}" value="${info.id?if_exists}" onclick="checkInfo2(this);" <#if info.isChecked?exists&&info.isChecked=='y'>checked</#if> /> <b>${info.functionName?if_exists}</b> 
                            		</td>
                            		<td>
                            			<#if info.subFunctions?exists&&(info.subFunctions?size>0)>
                            			<#list info.subFunctions as sub>
                            			<span style="white-space:nowrap;"><input class="subcheck2" type="checkbox" name="info2" id="info2_${info.id?if_exists}_sub_${sub.id?if_exists}" value="${sub.id?if_exists}" style="margin-left:10px;" <#if sub.isChecked?exists&&sub.isChecked=='y'>checked</#if> /> ${sub.functionName?if_exists}</span>
           			           			</#list>
                            			</#if>
                            		</td>
                            	</tr>
                            	</#list>
                            </tbody>
                            </table>
                			</#if>            
                        </div>
                        <div id="func_tp_3" class="form-group" <#if userRoleDo.type?exists&&userRoleDo.type==3>style="display:block;"<#else>style="display:none;"</#if>>
                            <label>功能权限：</label>
                            <#if info3List?exists&&(info3List?size>0)>
                            <table border="1" cellspacing="0" cellpadding="5" class="table table-bordered">
                            <tbody>
								<#list info3List as info>                                    
                            	<tr>
                            		<td style="width:10%;white-space:nowrap;padding-left:10px;padding-right:10px;">
                            			<input type="checkbox" name="info3" id="info3_${info.id?if_exists}" value="${info.id?if_exists}" onclick="checkInfo3(this);" <#if info.isChecked?exists&&info.isChecked=='y'>checked</#if> /> <b>${info.functionName?if_exists}</b> 
                            		</td>
                            		<td>
                            			<#if info.subFunctions?exists&&(info.subFunctions?size>0)>
                            			<#list info.subFunctions as sub>
                            			<span style="white-space:nowrap;"><input class="subcheck3" type="checkbox" name="info3" id="info3_${info.id?if_exists}_sub_${sub.id?if_exists}" value="${sub.id?if_exists}" style="margin-left:10px;" <#if sub.isChecked?exists&&sub.isChecked=='y'>checked</#if> /> ${sub.functionName?if_exists}</span>
           			           			</#list>
                            			</#if>
                            		</td>
                            	</tr>
                            	</#list>
                            </tbody>
                            </table>
                			</#if>            
                        </div>
                        <div id="func_tp_4" class="form-group" <#if userRoleDo.type?exists&&userRoleDo.type==4>style="display:block;"<#else>style="display:none;"</#if>>
                            <label>功能权限：</label>
                            <#if info4List?exists&&(info4List?size>0)>
                            <table border="1" cellspacing="0" cellpadding="5" class="table table-bordered">
                            <tbody>
								<#list info4List as info>                                    
                            	<tr>
                            		<td style="width:10%;white-space:nowrap;padding-left:10px;padding-right:10px;">
                            			<input type="checkbox" name="info4" id="info4_${info.id?if_exists}" value="${info.id?if_exists}" onclick="checkInfo4(this);" <#if info.isChecked?exists&&info.isChecked=='y'>checked</#if> /> <b>${info.functionName?if_exists}</b> 
                            		</td>
                            		<td>
                            			<#if info.subFunctions?exists&&(info.subFunctions?size>0)>
                            			<#list info.subFunctions as sub>
                            			<span style="white-space:nowrap;"><input class="subcheck4" type="checkbox" name="info4" id="info4_${info.id?if_exists}_sub_${sub.id?if_exists}" value="${sub.id?if_exists}" style="margin-left:10px;" <#if sub.isChecked?exists&&sub.isChecked=='y'>checked</#if> /> ${sub.functionName?if_exists}</span>
           			           			</#list>
                            			</#if>
                            		</td>
                            	</tr>
                            	</#list>
                            </tbody>
                            </table>
                			</#if>            
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

function checkType(obj) {
	var v = obj.value;
	if(v == "2") {
		document.getElementById("func_tp_2").style.display = "block";
		document.getElementById("func_tp_3").style.display = "none";
		document.getElementById("func_tp_4").style.display = "none";
	}else if(v == "3") {
		document.getElementById("func_tp_2").style.display = "none";
		document.getElementById("func_tp_3").style.display = "block";
		document.getElementById("func_tp_4").style.display = "none";
	}else if(v == "4") {
		document.getElementById("func_tp_2").style.display = "none";
		document.getElementById("func_tp_3").style.display = "none";
		document.getElementById("func_tp_4").style.display = "block";
	}
}

function checkInfo2(obj) {
	var v = obj.value;
	var id = obj.id;
	var sid = id+"_sub_";
	if(obj.checked) {
		$("input[name='info2']").each(function(){
			if(this.id.indexOf(sid) != -1) {
				this.checked = true;
			}
		});
	}else {
		$("input[name='info2']").each(function(){
			if(this.id.indexOf(sid) != -1) {
				this.checked = false;
			}
		});
	}
}

$(".subcheck2").click(function(){
	var id = this.id;
	var arr = id.split("_");
	var ptar = document.getElementById(arr[0] + "_" + arr[1]);
	if(this.checked) {
		if(!ptar.checked) {
			ptar.checked = true;
		}
	}else {
		var sid = arr[0] + "_" + arr[1] + "_" + arr[2];
		var flag = false;
		$("input[name='info2']").each(function(){
			if(this.id.indexOf(sid) != -1)  {
				if(this.checked) {
					flag = true;
				}
			}
		});
		if(flag == false) {
			if(ptar.checked) {
				ptar.checked = false;
			}
		}
	}
});

function checkInfo3(obj) {
	var v = obj.value;
	var id = obj.id;
	var sid = id+"_sub_";
	if(obj.checked) {
		$("input[name='info3']").each(function(){
			if(this.id.indexOf(sid) != -1) {
				this.checked = true;
			}
		});
	}else {
		$("input[name='info3']").each(function(){
			if(this.id.indexOf(sid) != -1) {
				this.checked = false;
			}
		});
	}
}

$(".subcheck3").click(function(){
	var id = this.id;
	var arr = id.split("_");
	var ptar = document.getElementById(arr[0] + "_" + arr[1]);
	if(this.checked) {
		if(!ptar.checked) {
			ptar.checked = true;
		}
	}else {
		var sid = arr[0] + "_" + arr[1] + "_" + arr[2];
		var flag = false;
		$("input[name='info3']").each(function(){
			if(this.id.indexOf(sid) != -1)  {
				if(this.checked) {
					flag = true;
				}
			}
		});
		if(flag == false) {
			if(ptar.checked) {
				ptar.checked = false;
			}
		}
	}
});

function checkInfo4(obj) {
	var v = obj.value;
	var id = obj.id;
	var sid = id+"_sub_";
	if(obj.checked) {
		$("input[name='info4']").each(function(){
			if(this.id.indexOf(sid) != -1) {
				this.checked = true;
			}
		});
	}else {
		$("input[name='info4']").each(function(){
			if(this.id.indexOf(sid) != -1) {
				this.checked = false;
			}
		});
	}
}

$(".subcheck4").click(function(){
	var id = this.id;
	var arr = id.split("_");
	var ptar = document.getElementById(arr[0] + "_" + arr[1]);
	if(this.checked) {
		if(!ptar.checked) {
			ptar.checked = true;
		}
	}else {
		var sid = arr[0] + "_" + arr[1] + "_" + arr[2];
		var flag = false;
		$("input[name='info4']").each(function(){
			if(this.id.indexOf(sid) != -1)  {
				if(this.checked) {
					flag = true;
				}
			}
		});
		if(flag == false) {
			if(ptar.checked) {
				ptar.checked = false;
			}
		}
	}
});

function save() {
	var name = $.trim($("#name").val());
	if(!name) {
		parent.showTipMessage("请输入角色名称", 1500, 2);
		return false;
	}
	var memo = $.trim($("#memo").val());
	var type = $("input[name='type1']:checked").val();
	if(!type) {
		parent.showTipMessage("请选择角色类型", 1500, 2);
		return false;
	}
	var flag = false;
	$("input[name='info"+type+"']").each(function(){
		if(this.checked) {
			flag = true;
		}
	});
	if(flag == false) {
		parent.showTipMessage("请选择功能权限", 1500, 2);
		return false;
	}
	$.ajax({
		type:"POST",
		url:"../web/roleManage.htm?m=updateRole",
		async:false,
		data:$('#optForm').serialize(),
		success:function(data){
			var json = eval('('+data+')');
			if(json.code == "0") {
				parent.parent.showTipMessage(json.msg, 600, 1);
				setTimeout(reload, 600);
			}else {
				parent.parent.showTipMessage(json.msg, 2500, 3);
			}
		}
	});
}

function reload() {
	parent.$("#optForm").submit();
}

</script>
</body>
</html>