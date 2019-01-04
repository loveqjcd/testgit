<!DOCTYPE html>
<html>
<head>
	<title>${sysTitle}</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
    <!-- bootstrap -->
    <link href="../css/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="../css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />
    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="../css/layout.css" />
    <link rel="stylesheet" type="text/css" href="../css/elements.css" />
    <link rel="stylesheet" type="text/css" href="../css/icons.css" />
    <!-- libraries -->
    <link href="../css/lib/font-awesome.css" type="text/css" rel="stylesheet" />
    <!-- this page specific styles -->
    <link rel="stylesheet" href="../css/compiled/user-list.css" type="text/css" media="screen" />
	
	<!-- scripts -->
	<script src="../js/jquery-1.7.2.min.js"></script>
    <script src="../js/jquery-latest.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/theme.js"></script>
  	<script type="text/javascript" src="../js/fancybox/jquery.mousewheel-3.0.2.pack.js"></script>
  	<script type="text/javascript" src="../js/fancybox/jquery.fancybox-1.3.1.pack.js"></script>
  	<link type="text/css" href="../js/fancybox/jquery.fancybox-1.3.1.css" rel="stylesheet" media="screen" />
    <script language="javascript">
		jQuery(document).ready(function() { 
			$(".show-fancy").fancybox({
				'width' : 650,
				'height' : 420,
				'autoScale' : false,
				'transitionIn' : 'none',
				'transitionOut' : 'none',
				'type' : 'iframe' 
			}); 
		});
		jQuery(document).ready(function() { 
			$(".show-fancy2").fancybox({
				'width' : 600,
				'height' : 380,
				'autoScale' : false,
				'transitionIn' : 'none',
				'transitionOut' : 'none',
				'type' : 'iframe' 
			}); 
		});
  	</script>
</head>
<body>
<#assign sign="li_120000"/>
<#assign sign2="li_120010"/>
    <!-- navbar --><#include "../common/navbar.ftl"> <!-- end navbar -->
	<!-- sidebar --><#include "../common/sidebar.ftl"><!-- end sidebar -->

	<!-- main container -->
    <div class="content">

        <div class="container-fluid">
            <div id="pad-wrapper" class="users-list">
                <div class="row-fluid">
                	<form id="optForm" method="post" action="../fund/fundList.htm?m=list">
                	<input type="hidden" id="pageNo" name="pageNo" value="1" />
                		<table width="100%" border="0" cellspacing="0" cellpadding="5">
                		<tbody>
                			<tr>
                				<td style="text-align:right;white-space:nowrap;">鸡的代码：</td>
                				<td>
                					<input type="text" style="width:136px;margin-bottom:0px;" placeholder="鸡的代码" id="code" name="code" value="${code?if_exists}" />
                				</td>
                				<td style="vertical-align:middle;white-space:nowrap;">
                					<a class="btn-glow" href="javascript:;" onclick="$('#optForm').submit()">搜&nbsp;&nbsp;索</a>
                				</td>
                				<td style="vertical-align:middle;white-space:nowrap;">
                					<a href="../fund/fundList.htm?m=add" class="btn-flat success pull-right show-fancy"><span>+</span>建&nbsp;&nbsp;仓</a>
                				</td>
                			</tr>
                		</tbody>
                		</table>
                	</form>
                </div>

                <!-- Users table -->
                <div class="row-fluid table">
                	<style>
                	.table tr th{text-align:center;}
                	.table tr td{text-align:center;}
                	</style>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th class="span3">
									代码/名称
                                </th>
                                <th class="span3">
                                    <span class="line"></span>当前净值
                                </th>
                                <th class="span3">
                                    <span class="line"></span>购买净值
                                </th>
                                <th class="span3">
                                    <span class="line"></span>购买市值/份额
                                </th>
                                <th class="span3">
                                    <span class="line"></span>当前市值/份额
                                </th>
                                <th class="span3">
                                    <span class="line"></span>止盈/止损
                                </th>
                                <th class="span3">
                                    <span class="line"></span>当前盈利
                                </th>
                                <th class="span2">
                                    <span class="line"></span>赎&nbsp;&nbsp;回
                                </th>
                                <th class="span2 align-right">
                                    <span class="line"></span>操&nbsp;&nbsp;作
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                        <#if fundList?exists&&(fundList?size>0)>
                        <#list fundList as bean>
						<#if bean.fundUserList?exists?exists&&(bean.fundUserList?size>0)>
						<#list bean.fundUserList as fundUser>
						<tr <#if bean_index==0>class="first"</#if>>
							<#if fundUser_index==0>
							<td rowspan="<#if bean.fundUserList?exists>${bean.fundUserList?size}</#if>">
                            	<a target="_black" href="https://www.baidu.com/s?wd=${bean.code?if_exists}">${bean.code?if_exists}</a><br>(${bean.name?if_exists})
                            </td>
                            <td rowspan="<#if bean.fundUserList?exists>${bean.fundUserList?size}</#if>">
								<a class="show-fancy2" href="../fund/fundList.htm?m=setFund&fundId=${bean.id?if_exists}">${bean.nowUnit?if_exists?string("#0.0000")}</a><br><#if bean.nowDate?exists>(${bean.nowDate?date})</#if>
                            </td>
							</#if>
							<td>
                            	${fundUser.buyUnit?if_exists?string("#0.0000")}<br><#if fundUser.buyDate?exists>(${fundUser.buyDate?date})</#if>
                            </td>
                            <td>
                            	${fundUser.buyValue?if_exists?string("#0.00")}<br>${fundUser.buyAmount?if_exists?string("#0.00")}
                            </td>
                            <td>
                            	<span style="color:red;">
                            	${fundUser.nowValue?if_exists?string("#0.00")}<br>${fundUser.nowAmount?if_exists?string("#0.00")}
                            	</span>
                            </td>
                            <td>
                            	<span style="color:red;">${fundUser.stopProfit?if_exists*100}%</span><br>
                            	<span style="color:green;">${fundUser.stopLoss?if_exists*100}%</span>
                            </td>
                            <td>
                            	<span style="color:${fundUser.color?if_exists};font-weight:bolder;">${fundUser.profitValue?if_exists}</span><br>
                            	<span style="color:${fundUser.color?if_exists};font-weight:bolder;">${fundUser.profitRate?if_exists*100}%</span>
                            </td>
                            <td>
                            	<#if fundUser.needBack?exists&&fundUser.needBack=='Y'><span style="color:${fundUser.color?if_exists};">是</span>
                            	<#elseif fundUser.needBack?exists&&fundUser.needBack=='N'><span style="color:gray;">否</span>
                            	</#if>
                            </td>
                            <td class="align-right">
                            	<a class="show-fancy2" href="../fund/fundList.htm?m=back&fuId=${fundUser.id?if_exists}">赎回</a><br>
                            	<a class="show-fancy" href="../fund/fundList.htm?m=add&fundId=${bean.id?if_exists}">加仓</a>
                            </td>
						</tr>
						</#list>
                        <#else>
						<tr <#if bean_index==0>class="first"</#if>>
							<td colspan="6">
                            	<td style="text-align:center;" colspan="6">你还没养这只鸡</td>
                            </td>
                            <td>
                            	<a class="show-fancy" href="../fund/fundList.htm?m=add&fundId=${bean.id?if_exists}">建仓</a>
                            </td>
                        </tr>						
						</#if>
						</#list>
                        <#else>
                        <tr class="first">
                        	<td style="text-align:center;" colspan="9">暂无相关信息记录</td>
                        </tr>
                        </#if>
                        </tbody>
                    </table>
                </div>
                <!-- end users table -->
            </div>
        </div>
    </div>
    <!-- end main container -->

<script language="javascript">



</script>
</body>
</html>