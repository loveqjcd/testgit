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
#hyzjDiv img{
	width:100px;
	height:60px;
	padding-right:10px;
}
#hyzjDiv .title{
}
#hyzjDiv .tit{
	vertical-align:middle;
	display:inline-flex;
}

#hyzjDiv .t a{display: inline-block; margin-right:15px; width: 6px;height:3px; background: green;line-height: 0;font-size:0;vertical-align: middle;-webkit-transform: rotate(45deg);}
#hyzjDiv .t a:after{content:'/';display:block;width: 12px;height:3px; background: green;-webkit-transform: rotate(-90deg) translateY(-50%) translateX(50%);}
#hyzjDiv .f a{display: inline-block; margin-right:10px; width: 12px;height:3px; background: red;line-height: 0;font-size:0;vertical-align: middle;-webkit-transform: rotate(45deg);}
#hyzjDiv .f a:after{content:'/';display:block;width: 12px;height:3px; background: red;-webkit-transform: rotate(-90deg);}
</style>
<style type="text/css">     
.mask {       
	position: absolute; 
	top: 0px; 
	filter: alpha(opacity=100); 
	background-color: #777;     
	z-index: 1002; 
	left: 0px;     
	opacity:1.0; 
	-moz-opacity:1.0;
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
			      <div class="jiting clearfix">
			        <label>
				          <select name="subject" id="subject" class="q-param">
				          	<option value="">科目类型</option>
				          	<option value="1">&nbsp;科目一</option>
				          	<option value="4">&nbsp;科目四</option>
				          </select>
			        </label>
			        <label>
				          <select name="model" id="model" class="q-param">
				          	<option value="">驾照类型</option>
				          	<option value="a1">&nbsp;a1</option>
				          	<option value="a2">&nbsp;a2</option>
				          	<option value="b1">&nbsp;b1</option>
				          	<option value="b2">&nbsp;b2</option>
				          	<option value="c1">&nbsp;c1</option>
				          	<option value="c2">&nbsp;c2</option>
				          </select>
			        </label>
			      </div>
			      <input id="zxd-form-submit" class="ptag-set" type="button" onclick="queryData();" value="查  询">
		    </form>
		  </div>
		</section>
		<div class="b_list">
			<ul id="hyzjDiv">
				暂无相关记录
			</ul>
		</div>  
		<!-- 分页 -->
		<div id="wap_page" style="float:right;position:fixed;bottom:0px;right:0px;z-index:1001;"></div>
        <!-- 分页 -->
        <!-- 遮罩层 -->
		<div id="mask" class="mask" onclick="hideImg();"></div>  
<!-- footer wrapper starts -->
  <#include "../common/wapfooter.ftl">
<!-- footer wrapper ends -->
<script type="text/javascript" src="../wap/js/pagination.js"></script>
<script type="text/javascript">

function hideImg(){
	$("#mask").fadeOut();
}

function showImg(obj) {
	var width = $(document).width();
	$("#mask").css("height",$(document).height());
	$("#mask").css("width",width);
	document.getElementById("mask").innerHTML = "<img style='position:fixed;top:25%;margin:auto;max-width:"+width+"px;' src='"+obj.src+"'>";
	var imgW = $("#mask").find("img")[0].width;
	var ml = 0;
	if(width > imgW) {
		ml = (width - imgW) / 2;
	}
	var tar = $("#mask").find("img")[0];
	$(tar).css("margin-left", ml+"px");
	$("#mask").fadeIn();
}
	
function queryData() {
	$("#hyzjDiv").html("");
	var subject = $("#subject").val();
	if(!subject) {
		alert("请选择科目类型");
		initPage(0, 0, 0);
		return false;
	}
	var model = $("#model").val();
	if(subject == "1" && !model) {
		alert("请选择驾照类型");
		initPage(0, 0, 0);
		return false;
	}
	var pageNo = $("#pageNo").val();
	$.ajax({
		type:"POST",
		url:"../wap.htm?m=jztk",
		async:true,
		data:{"opt":"q","subject":subject,"model":model,"pageNo":pageNo},
		success:function(data){
			var json = eval('('+data+')');
			if(json.code == "0") {
				if(checkExist(json.result)) {
					var objs = eval('('+json.result+')');
					var html = "";
					for(var i=0;i<objs.length;i++) {
						var obj = objs[i];
						html += "<li class='clear'><div class='text'><div class='tit clear'>";
						if(checkExist(obj.url)) {
							html += "<img onclick='showImg(this);' src='"+obj.url+"'>";
						}
						html += "<span class='title'><span class='c222'>"+obj.sourceId+"."+obj.question+"</span></span>";
						html += "</div>";
						if(checkExist(obj.item1Flag) && obj.item1Flag == 'T') {
							html += "<div class='t_ft t' style='margin-top:0px;'><a></a>A."+obj.item1+"</div>";
						}else {
							html += "<div class='t_ft f' style='margin-top:0px;'><a></a>A."+obj.item1+"</div>";
						}
						if(checkExist(obj.item2Flag) && obj.item2Flag == 'T') {
							html += "<div class='t_ft t' style='margin-top:0px;'><a></a>B."+obj.item2+"</div>";
						}else {
							html += "<div class='t_ft f' style='margin-top:0px;'><a></a>B."+obj.item2+"</div>";
						}
						if(checkExist(obj.item3)) {
							if(checkExist(obj.item3Flag) && obj.item3Flag == 'T') {
								html += "<div class='t_ft t' style='margin-top:0px;'><a></a>C."+obj.item3+"</div>";
							}else {
								html += "<div class='t_ft f' style='margin-top:0px;'><a></a>C."+obj.item3+"</div>";
							}
						}
						if(checkExist(obj.item4)) {
							if(checkExist(obj.item4Flag) && obj.item4Flag == 'T') {
								html += "<div class='t_ft t' style='margin-top:0px;'><a></a>D."+obj.item4+"</div>";
							}else {
								html += "<div class='t_ft f' style='margin-top:0px;'><a></a>D."+obj.item4+"</div>";
							}
						}
						html += "<div class='t_bd' style='margin-top:10px;'>"+obj.explains+"</div>";
						html += "</div></li>";
					}
					html += "<br>";
					$("#hyzjDiv").append(html);
					initPage(json.total, json.currentlyPageNo, json.totalPage);
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

function checkExist(str) {
	if(str != undefined && str != "" && str != null) {
		return true;
	}else {
		return false;
	}
}

$("#subject").change(function(){
	var v = this.value;
	$("#pageNo").val("1");
	initPage(0, 0, 0);
	if(v == "") {
		$("#hyzjDiv").html("暂无相关记录");
	}else if(v == "1") {
		var model = $("#model").val();
		if(model != "") {
			queryData();
		}else {
			$("#hyzjDiv").html("暂无相关记录");
		}
	}else if(v == "4") {
		queryData();
	}
});

$("#model").change(function(){
	var subject = $("#subject").val();
	if(subject == "4") {
	}else {
		var v = this.value;
		$("#pageNo").val("1");
		initPage(0, 0, 0);
		
		if(subject == "") {
			$("#hyzjDiv").html("暂无相关记录");
		}else {
		 	if(v == "") {
		 		$("#hyzjDiv").html("暂无相关记录");
		 	}else {
		 		queryData();
		 	}
		}
	}
});

</script>
</body>
</html>