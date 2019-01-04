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
                    <h4>赎回操作</h4>
                </div>

                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container" style="padding-bottom:0px;">
                            <form class="new_user_form" id="" method="post"/>
                                <input type="hidden" id="fuId" name="fuId" value="${fuId?if_exists}" />
                                <div class="span12 field-box" style="margin-bottom:15px;">
                                    <label>鸡的代码：</label>
                                    <#if fundDo?exists>${fundDo.code?if_exists}</#if>
                                </div>
                                <div class="span12 field-box" style="margin-bottom:15px;">
                                    <label>鸡的名称：</label>
                                    <#if fundDo?exists>${fundDo.name?if_exists}</#if>
                                </div>
                                <div class="span12 field-box" style="margin-bottom:15px;">
                                    <label>赎回份额：</label>
                                	<input class="span4" name="tradeAmount" id="tradeAmount" placeholder="最大 ${fundUserDo.nowAmount?if_exists?string("#0.00")} 份" />
                                	<a style="margin-left:20px;" href="javascript:;" onclick="$('#tradeAmount').val(' ${fundUserDo.nowAmount?if_exists?string("#0.00")}')">全部赎回</a>
                                </div>
                                <div class="span12 field-box" style="margin-bottom:15px;">
                                    <label>赎回日期：</label>
                                	<input type="text" readonly class="span4" style="cursor:default;background:white;" name="sellDate" id="sellDate" placeholder="赎回日期" value="<#if fundDo.nowDate?exists>${fundDo.nowDate?date}</#if>" 
                                    	onFocus="WdatePicker({skin:'twoer',startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
                                </div>
                                <div class="span12 field-box">
                                    <label>赎回净值：</label>
                                	<input class="span4" name="sellUnit" id="sellUnit" placeholder="赎回净值" value="${fundDo.nowUnit?if_exists?string("#0.0000")}" />
                                	<span class="subtext">（例如：2.2276）</span>
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
	var fuId = $("#fuId").val();
	var tradeAmount = $.trim($("#tradeAmount").val());
	var sellDate = $.trim($("#sellDate").val());
	var sellUnit = $.trim($("#sellUnit").val());
	if(!isNumber(tradeAmount)) {
		parent.showTipMessage("请设置赎回份额", 1500, 2);
		return false;
	}
	if(parseFloat(tradeAmount) > parseFloat('${fundUserDo.nowAmount?if_exists?string("#0.00")}')) {
		parent.showTipMessage("最大份额 " + '${fundUserDo.nowAmount?if_exists?string("#0.00")}' + " 份", 1500, 2);
		return false;
	}
	if(!sellDate) {
		parent.showTipMessage("请设置赎回日期", 1500, 2);
		return false;
	}
	if(!isNumber(sellUnit)) {
		parent.showTipMessage("请设置赎回净值", 1500, 2);
		return false;
	}
	$.ajax({
		type:"POST",
		url:"../fund/fundList.htm?m=back",
		async:false,
		data:{"opt":"save","fuId":fuId,"tradeAmount":tradeAmount,"sellDate":sellDate,"sellUnit":sellUnit},
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

</script>
</body>
</html>