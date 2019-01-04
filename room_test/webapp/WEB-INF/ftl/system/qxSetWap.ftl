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
					<h4><i class="fa fa-bars"></i>wap图片广告设置</h4>
				</div>
				<div class="box-body big">
					<form class="new_user_form" id="optForm" method="post"/>
					<input type="hidden" id="fileId" name="fileId" value="${fileId?if_exists}" />
                            	<div class="form-group">
                                    <label>图片广告：</label>
                                    <img style="height:50px;" src="${fileDo.filePath?if_exists}" />
                                </div>
                                <div class="form-group">
                                    <label>设置为wap广告：</label>
                                    <input class="" type="radio" name="setkey" id="" value="wap" <#if fileDo.fileMemo?exists&&fileDo.fileMemo=='wap'>checked</#if> style="" /> 是
                                    <input class="" type="radio" name="setkey" id="" value="notwap" <#if fileDo.fileMemo?exists&&fileDo.fileMemo=='notwap'>checked</#if> style="margin-left:20px;" /> 否
                                </div>
                            	<div class="form-group">
                                    <label>显示排序：</label>
                                    <input class="form-control" type="text" name="oindex" id="oindex" placeholder="显示排序" onkeyup="value=value.replace(/[^\d]/g, '')" value="${fileDo.merchantId?if_exists}" />
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
	var fileId = $("#fileId").val();
	var setkey = $("input[name='setkey']:checked").val();
	if(!setkey) {
		parent.showTipMessage("请确认是否设置为wap广告", 1500, 2);
		return false;
	}
	if(setkey == "wap") {
		var oindex = $("#oindex").val();
		if(!(parseInt(oindex) > 0)) {
			parent.showTipMessage("请输入显示排序", 1500, 2);
			return false;
		}
	}
	$.ajax({
		type:"POST",
		url:"../web/imageList.htm?m=setWap",
		async:false,
		data:{"opt":"save","fileId":fileId,"setkey":setkey,"oindex":oindex},
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

</script>
</body>
</html>