<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${title?if_exists}</title>
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width">
<link rel="stylesheet" href="../wap/css/amazeui.min.css" type="text/css">
<link rel="stylesheet" href="../wap/css/style-lssdjt.css" type="text/css">
<script type="text/javascript" src="../wap/js/jquery-2.1.4.min.js"></script>

<style>
#hyzjDiv .img_span{
    height: 40px;
    position: absolute;
    bottom: 0px;
    background-color: gray;
    width: 100%;
    padding: 2px;
    margin-bottom: 34px;
    font-size: 14px;
    color: white;
    filter: alpha(opacity=90); 
	opacity:0.9; 
	-moz-opacity:0.9;
}

#hyzjDiv .img_span a{
    color: white;
}

#hyzjDiv img{
	width:100%;
	height:120px;
}

</style>
</head>
	<body>
	   <header data-am-widget="header" class="am-header am-header-default j-header am-no-layout">
	      <a href="../wap.htm?m=list" style="float:left;"><img src="../wap/img/pre.png" style="width:35px;"></a>
    	  <a href="javascript:window.location.reload();" style="float:right;"><img src="../wap/img/Refresh.png" style="width:35px;"></a>
	      <h1 class="am-header-title">
	      	<a href="javascript:;" class="" style="font-size:14px;">${title?if_exists}</a>
	      </h1>
	   </header>
       <section class="xyl">
		  <div id="fabiaoqu">
		    <form class="zxd-form">
		    	  <input type="hidden" id="pageNo" name="pageNo" value="1" /> 
		    </form>
		  </div>
		</section>
		<div class="b_list">
			<ul id="hyzjDiv">
				<!--
				<li class='clear'>
					<div class='text' style="position: relative;">
						<a href='http://v.juhe.cn/weixin/redirect?wid=wechat_20170103036022'>
						<img src='http://zxpic.gtimg.com/infonew/0/wechat_pics_-11745427.jpg/640'>
						<div class='tit clear img_span'>
							<span class='title'>这4类妈妈生出的孩子准是高智商！你是哪一类？</span>
						</div>
						</a>
						<div class='t_ft'>
							<div class='more'>20170103</div>
							<div class='date'>辣妈学堂</div>
						</div>
					</div>
				</li>
				<li class='clear'>
					<div class='text' style="position: relative;">
						<div class='tit clear'>
							<span class='title'><a class='c222' href='http://v.juhe.cn/weixin/redirect?wid=wechat_20170103036022'>这4类妈妈生出的孩子准是高智商！你是哪一类？</a></span>
						</div>
						<div class='t_ft'>
							<div class='more'>20170103</div>
							<div class='date'>辣妈学堂</div>
						</div>
					</div>
				</li>
				-->
				暂无相关记录
			</ul>
		</div>  
		<!-- 分页 -->
		<div id="wap_page" style="float:right;position:fixed;bottom:0px;right:0px;z-index:1001;"></div>
        <!-- 分页 -->
<!-- footer wrapper starts -->
  <#include "../common/wapfooter.ftl">
<!-- footer wrapper ends -->
<script type="text/javascript" src="../wap/js/pagination.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	queryData();
});
	
function queryData() {
	$("#hyzjDiv").html("");
	var pageNo = $("#pageNo").val();
	$.ajax({
		type:"POST",
		url:"../wap.htm?m=wxjx",
		async:true,
		data:{"opt":"q","pageNo":pageNo},
		success:function(data){
			var json = eval('('+data+')');
			if(json.code == "0") {
				if(checkExist(json.list)) {
					var objs = eval('('+json.list+')');
					var html = "";
					for(var i=0;i<objs.length;i++) {
						var obj = objs[i];
						html += "<li class='clear'><div class='text' style='position:relative;'>";
						if(checkExist(obj.firstImg)) {
							html += "<a href='"+obj.url+"'><img src='"+obj.firstImg+"'>";
							html += "<div class='tit clear img_span'><span class='title'>"+obj.title+"</span></div></a>"
						}else {
							html += "<div class='tit clear'><span class='title'><a class='c222' href='"+obj.url+"'>"+obj.title+"</a></span></div>";
						}
						html += "<div class='t_ft'>";
						if(checkExist(obj.id)) {
							html += "<div class='more'>"+getDate(obj.id)+"</div>";
						}
						if(checkExist(obj.source)) {
							html += "<div class='date'>"+obj.source+"</div>";
						}
						html += "</div></div></li>";
					}
					html += "<br>";
					$("#hyzjDiv").append(html);
					initPage(parseInt(json.ps)*parseInt(json.totalPage), parseInt(json.pno), parseInt(json.totalPage));
				}else {
					$("#hyzjDiv").append("暂无相关记录");
					initPage(0, 0, 0);
				}
			}else {
				$("#hyzjDiv").append("暂无相关记录");
				initPage(0, 0, 0);
			}
		}
	});
}

function getDate(id) {
	if(checkExist(id) && id.length >= 15) {
		return id.substring(7, 15);
	}else {
		return "";
	}
}

function checkExist(str) {
	if(str != undefined && str != "" && str != null) {
		return true;
	}else {
		return false;
	}
}

</script>
</body>
</html>