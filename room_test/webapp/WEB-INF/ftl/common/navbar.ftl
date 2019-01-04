<style type="text/css">
	.global_tip{ position:fixed;_position:absolute; z-index:2000; width:100%; max-width:1440px; min-width:1000px; text-align:center;}
	.global_tip .tip_block{padding:3px 15px 5px;*padding:5px 10px;font-size:14px; color:#fff; border-radius:15px;}
	.global_tip .tip_success{ background-color:#74b749;}
	.global_tip .tip_warning{ background-color:#ffb400;}
	.global_tip .tip_error{background-color:#ed6d49;}
</style>

<div id="tip_notice" class="global_tip" style="top:10px;display:none;">
  <span class="tip_block">提示信息</span>
</div>
<div id="tip_broswer_notice" class="global_tip" style="z-index:1000;display:none;" >
  <span class="tip_block" style="background-color:#c3d400;">亲爱的用户，如果访问页面显示异常，请试着切换到极速模式或者升级下浏览器版本</span>
</div>
    <header class="navbar clearfix" id="header">
		<div class="container">
				<div class="navbar-brand">
					<a href="../web/home.htm">
						<img src="../img/logo.png" alt="Cloud Admin Logo" class="img-responsive" style="margin-top:5px;height:21px;width:140px">
					</a>
					
					<!-- SIDEBAR COLLAPSE -->
					<div id="sidebar-collapse" class="sidebar-collapse btn">
						<i class="fa fa-bars" 
							data-icon1="fa fa-bars" 
							data-icon2="fa fa-bars" ></i>
					</div>
					<!-- /SIDEBAR COLLAPSE -->
				</div>
				<!-- NAVBAR LEFT -->
				<ul class="nav navbar-nav pull-left hidden-xs" id="navbar-left">
					
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-cog"></i>
							<span class="name">换肤</span>
							<i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu skins">
							<li class="dropdown-title">
								<span><i class="fa fa-leaf"></i> 主题皮肤</span>
							</li>
							<li><a href="#" data-skin="default">蓝色经典（默认）</a></li>
							<li><a href="#" data-skin="night">深邃星空</a></li>
							<li><a href="#" data-skin="earth">尘土飞扬</a></li>
							<li><a href="#" data-skin="utopia">独辟蹊径</a></li>
							<li><a href="#" data-skin="nature">自然清新</a></li>
							<li><a href="#" data-skin="graphite">委婉深沉</a></li>
						 </ul>
					</li>
				</ul>
				<!-- /NAVBAR LEFT -->
				<!-- BEGIN TOP NAVIGATION MENU -->					
				<ul class="nav navbar-nav pull-right" style="min-width: 150px;">
					<!-- BEGIN USER LOGIN DROPDOWN -->
					<li class="dropdown user" id="header-user">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<img alt="" src="" style="visibility: hidden;width: 0px;" />
							<span class="username"> ${Session["login_user"].username?if_exists} 
							<#if Session["login_user"].type?exists&&Session["login_user"].type==1>（超级管理员）
							<#elseif Session["login_user"].type?exists&&Session["login_user"].type==2>（平台管理员）
							<#elseif Session["login_user"].type?exists&&Session["login_user"].type==3>（代理商管理员）
							<#elseif Session["login_user"].type?exists&&Session["login_user"].type==4>（商家管理员）
							</#if>
							</span>
							<i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu">
							<li><a href="../web/system.htm"><i class="fa fa-user"></i>  账号信息</a></li>
							<li><a href="javascript:;" onclick="logout();"><i class="fa fa-power-off"></i>  退出登录</a></li>
						</ul>
					</li>
					<!-- END USER LOGIN DROPDOWN -->
				</ul>
				<!-- END TOP NAVIGATION MENU -->
		</div>
	</header>

<script language="javascript">
$(function(){
	var curl = window.location.href;
	if(curl.indexOf("stop=yes") != -1) {
		showTipMessage("用户角色权限不足，无法访问", 2000, 2);
	}
});

$(function(){
	var browserFlag = true;
	var isIE = window.navigator.userAgent.indexOf("MSIE");
	if(isIE != -1) {
		var ie5 = window.navigator.userAgent.indexOf("MSIE 5.0");
		var ie6 = window.navigator.userAgent.indexOf("MSIE 6.0");
		var ie7 = window.navigator.userAgent.indexOf("MSIE 7.0");
		if(ie5 != -1 || ie6 != -1 || ie7 != -1) {
			browserFlag = false;
		}
	}
	if(browserFlag == false) {
		$("#tip_broswer_notice").show();
	}
});

function logout() {
	if(confirm("确定退出吗？")) {
		window.location.href = "../../userLogin.htm?m=logout";
	}
}

function showTipMessage(text, time, type) {
	var notice = document.getElementById("tip_notice");
	$(notice).slideToggle();	
	var tar = notice.getElementsByTagName("span")[0];
	tar.innerHTML = text;
	if(type == 1) {
		$(tar).addClass("tip_success");
	}else if(type == 2) {
		$(tar).addClass("tip_warning");
	}else if(type == 3) {
		$(tar).addClass("tip_error");
	}else {
		$(tar).addClass("tip_warning");
	}
	setTimeout(hideTipMessage, time);
}

function hideTipMessage() {
	var notice = document.getElementById("tip_notice");
	$(notice).slideToggle();
	var tar = notice.getElementsByTagName("span")[0];
	tar.innerHTML = "";
	$(tar).removeClass("tip_success");
	$(tar).removeClass("tip_warning");
	$(tar).removeClass("tip_error");
}

</script>
