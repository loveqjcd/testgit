	
    <!-- SIDEBAR -->
	<div id="sidebar" class="sidebar">
		<div class="sidebar-menu nav-collapse">
			<div class="divide-20"></div>
			<!-- SIDEBAR MENU -->
			<ul>
				<#if Session["login_user"]["functionInfos"]?exists>
	          	<#list Session["login_user"]["functionInfos"] as info>
	          	<#if info.subFunctions?exists&&(info.subFunctions?size>0)>
	          		<li class="has-sub" id="li_${info.id?if_exists}">
						<a href="javascript:;" class="">
						<i class="fa  ${info.iconSrc?if_exists} fa-fw"></i> 
						<span class="menu-text">
						${info.functionName?if_exists}
						<span class="badge pull-right"></span></span>
						<span class="arrow"></span>
						</a>
						<ul class="sub" id="ul_li_${info.id?if_exists}">
						<#list info.subFunctions as sub>
							<li><a class="" id="li_${sub.id?if_exists}" href="${sub.functionUrl?if_exists}" data-type="page-transition"><span class="sub-menu-text">${sub.functionName?if_exists}</span></a></li>
						</#list>
						</ul>
					</li>
	          		
	          	<#else>
		          	<li id="li_${info.id?if_exists}" class="">                
		                <a href="${info.functionUrl?if_exists}" data-type="page-transition">
		                    <i class="fa ${info.iconSrc?if_exists} fa-fw"></i>
		                    <span class="menu-text">${info.functionName?if_exists}
		                    <span class="badge pull-right"></span>
		                    </span>
		                </a>
		            </li>
	          	</#if>
	          	</#list>
	          	</#if>
			</ul>
			<!-- /SIDEBAR MENU -->
		</div>
	</div>
	<!-- /SIDEBAR -->
    
<script language="javascript">
<#if sign?exists>
	$("#${sign?if_exists}").attr("class", "has-sub active");
</#if>
<#if sign2?exists>
	$("#${sign2?if_exists}").attr("class", "active");
	$("#${sign2?if_exists}").parent().attr("class","current");
	$("#ul_${sign?if_exists}").attr("style", "display:block");
</#if>
</script>
