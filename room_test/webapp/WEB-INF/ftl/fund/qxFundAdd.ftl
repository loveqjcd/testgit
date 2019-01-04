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
    <link rel="stylesheet" href="../css/compiled/new-user.css" type="text/css" media="screen" />

	<!-- scripts -->
	<script src="../js/jquery-1.7.2.min.js"></script>
    <script src="../js/jquery-latest.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/theme.js"></script>
    <script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<!-- main container -->
    <div class="content" style="min-height:200px;padding-bottom:10px;">
        
        <div class="container-fluid">
            <div id="pad-wrapper" class="new-user" style="margin-top:10px">
                <div class="row-fluid header" style="margin-bottom:20px">
                    <h4>建仓操作</h4>
                </div>

                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container" style="padding-bottom:0px;">
                            <form class="new_user_form" id="" method="post"/>
                                <input type="hidden" id="fundId" name="fundId" value="${fundId?if_exists}" />
                                <div class="span12 field-box" style="margin-bottom:15px;">
                                    <label>鸡的代码：</label>
                                    <input class="span7" style="background-color:white;" <#if fundDo?exists>readonly</#if> name="code" id="code" placeholder="鸡的代码" value="<#if fundDo?exists>${fundDo.code?if_exists}</#if>" onblur="checkFund();" />
                                </div>
                                <div class="span12 field-box" style="margin-bottom:15px;">
                                    <label>鸡的名称：</label>
                                    <input class="span7" style="background-color:white;" <#if fundDo?exists>readonly</#if> name="name" id="name" placeholder="鸡的名称" value="<#if fundDo?exists>${fundDo.name?if_exists}</#if>" />
                                </div>
                                <div class="span12 field-box" style="margin-bottom:15px;">
                                    <label>购买日期：</label>
                                	<input type="text" readonly class="span4" style="cursor:default;background:white;" name="buyDate" id="buyDate" placeholder="购买日期" value="<#if nowtime?exists>${nowtime}</#if>" 
                                    	onFocus="WdatePicker({skin:'twoer',startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
                                </div>
                                <div class="span12 field-box" style="margin-bottom:15px;">
                                    <label>购买净值：</label>
                                	<input class="span4" name="buyUnit" id="buyUnit" placeholder="购买净值" value="" />
                                	<span class="subtext">（例如：2.2276）</span>
                                </div>
                                <div class="span12 field-box" style="margin-bottom:15px;">
                                    <label>购买市值：</label>
                                	<input class="span4" name="buyValue" id="buyValue" placeholder="购买市值" value="" />
                                	<span class="subtext">（例如：5000）</span>
                                </div>
                                <div class="span12 field-box" style="margin-bottom:15px;">
                                    <label>购买份额：</label>
                                	<input class="span4" name="buyAmount" id="buyAmount" placeholder="购买份额" value="" />
                                	<span class="subtext">（例如：2231.18）</span>
                                </div>
                                <div class="span12 field-box" style="margin-bottom:15px;">
                                    <label>止盈位：</label>
                                	<input class="span4" name="stopProfit" id="stopProfit" placeholder="止盈位" value="" />
                                	<span class="subtext">（例如：0.2，盈利达到20%）</span>
                                </div>
                                <div class="span12 field-box" style="margin-bottom:15px;">
                                    <label>止损位：</label>
                                	<input class="span4" name="stopLoss" id="stopLoss" placeholder="止损位" value="" />
                                	<span class="subtext">（例如：0.2，亏损达到20%）</span>
                                </div>
                                
                                <div class="span11 field-box actions">
                                    <input type="button" class="btn-glow primary" style="margin-right:20px;" value="提   交" onclick="save();" />
                                    <span></span>
                                    <input type="reset" value="取   消" class="reset" onclick="parent.$.fancybox.close();">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end main container -->
<script language="javascript">

function save() {
	var fundId = $("#fundId").val();
	var code = $.trim($("#code").val());
	var name = $.trim($("#name").val());
	var buyDate = $.trim($("#buyDate").val());
	var buyUnit = $.trim($("#buyUnit").val());
	var buyValue = $.trim($("#buyValue").val());
	var buyAmount = $.trim($("#buyAmount").val());
	var stopProfit = $.trim($("#stopProfit").val());
	var stopLoss = $.trim($("#stopLoss").val());
	if(!code) {
		parent.showTipMessage("请设置鸡的代码", 1500, 2);
		return false;
	}
	if(!name) {
		parent.showTipMessage("请设置鸡的名称", 1500, 2);
		return false;
	}
	if(!buyDate) {
		parent.showTipMessage("请设置购买日期", 1500, 2);
		return false;
	}
	if(!isNumber(buyUnit)) {
		parent.showTipMessage("请设置购买净值", 1500, 2);
		return false;
	}
	if(!isNumber(buyValue)) {
		parent.showTipMessage("请设置购买市值", 1500, 2);
		return false;
	}
	if(!isNumber(buyAmount)) {
		parent.showTipMessage("请设置购买份额", 1500, 2);
		return false;
	}
	if(!isNumber(stopProfit)) {
		parent.showTipMessage("请设置止盈位", 1500, 2);
		return false;
	}
	if(!isNumber(stopLoss)) {
		parent.showTipMessage("请设置止损位", 1500, 2);
		return false;
	}
	
	$.ajax({
		type:"POST",
		url:"../fund/fundList.htm?m=add",
		async:false,
		data:{"opt":"save","fundId":fundId,"code":code,"name":name,"buyDate":buyDate,"buyUnit":buyUnit
			,"buyValue":buyValue,"buyAmount":buyAmount,"stopProfit":stopProfit,"stopLoss":stopLoss},
		success:function(data){
			if(data == "yes") {
				parent.showTipMessage("操作成功", 600, 1);
				setTimeout(reload, 600);
			}else {
				parent.showTipMessage("操作失败", 2500, 3);
			}
		}
	});
}

function reload() {
	parent.$("#optForm").submit();
}

function isNumber(oNum) { 
	if(!oNum) return false; 
	var strP=/^\d+(\.\d+)?$/; 
	if(!strP.test(oNum)) {
		return false;
	}
	try { 
		if(parseFloat(oNum)!=oNum || parseFloat(oNum) <= 0) {
			return false;
		} 
	} catch(ex) { 
		return false; 
	} 
	return true; 
}

function checkFund() {
	var code = $.trim($("#code").val());
	if(code != "" && code.length == 6) {
		$.ajax({
			type:"POST",
			url:"../fund/fundList.htm?m=check",
			async:false,
			data:{"code":code},
			success:function(data){
				var json = eval('('+data+')');
				if(json.msg == 'no') {
					$("#fundId").val("");
				}else if(json.msg == 'ok') {
					$("#fundId").val(json.fundId);
					$("#name").val(json.name);
				}
			}
		});
	}
}

</script>
</body>
</html>