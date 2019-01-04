<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${title?if_exists}</title>
<!-- meta tags start -->
<meta name="Keywords" content="">
<meta name="Description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!-- meta tags end -->
<!-- CSS files start -->
<link href="../wap/css/framework.css" rel="stylesheet" type="text/css" media="all">
<link href="../wap/css/style.css" rel="stylesheet" type="text/css" media="all">
<!-- CSS files end -->
<!-- JavaScript files start -->
<script type="text/javascript" src="../wap/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="../wap/js/RevealTrans.js"></script>
<!-- JavaScript files end -->
</head>
<style type="text/css">
.container{
	height:220px;
	border:1px solid #eee;
	position:relative;
}

#idNum{
	position:absolute;
	right:2px; 
	bottom:0px;
	z-index:9999;
}
#idNum li{
	float: left;
	list-style:none;
	color: #fff;
	text-align: center;
	line-height: 16px;
	width: 16px;
	height: 16px;
	font-family: Arial;
	font-size: 12px;
	cursor: pointer;
	margin: 1px;
	border: 1px solid #707070;
	background-color: #060a0b;
}
#idNum li.on{
	line-height: 18px;
	width: 18px;
	height: 18px;
	font-size: 14px;
	border: 0;
	background-color: #ce0609;
	font-weight: bold;
}

#cur_time img{
	height: 15px;
}
#cur_time{
	display: inline-flex;
	float:right;
	margin-top:32px;
	margin-right:-15px;
	color: #eee;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	times();
	autoadd();
});

var interval = 0;
function autoadd(){
	clearInterval(interval);
	interval = setInterval("times()", 1000);
}

function getImg(val) {
	var len=val.length;
	var images="";
	for (var i = 0; i < len; i++) {
		var num=val.substr(i,1);
		switch(num){
			case '0' : 
				images += "<img src='../wap/img/time/0.png' />";
			break;
			case '1' : 
				images += "<img src='../wap/img/time/1.png' />";
			break;
			case '2': 
				images += "<img src='../wap/img/time/2.png' />";
			break;
			case '3' : 
				images += "<img src='../wap/img/time/3.png' />";
			break;
			case '4' : 
				images += "<img src='../wap/img/time/4.png' />";
			break;
			case '5' : 
				images += "<img src='../wap/img/time/5.png' />";
			break;
			case '6' : 
				images += "<img src='../wap/img/time/6.png' />";
			break;
			case '7': 
				images += "<img src='../wap/img/time/7.png' />";
			break;
			case '8': 
				images += "<img src='../wap/img/time/8.png' />";
			break;
			case '9' : 
				images += "<img src='../wap/img/time/9.png' />";
			break;
		}
	}
	return images;
}

function times() {
	var dv=document.getElementById('cur_time');
	var date=new Date();
	var year=date.getFullYear()+"";
	var months=date.getMonth()+1;
	months=months<10?'0'+months:months+"";
	var day =date.getDate();
	day=day<10?'0'+day:day+"";
	var hours=date.getHours();
	hours=hours<10?'0'+hours:hours+"";
	var minutes=date.getMinutes();
	minutes=minutes<10?'0'+minutes:minutes+"";
	var seconds=date.getSeconds();
	seconds=seconds<10?'0'+seconds:seconds+"";
	//dv.innerHTML = getImg(year)+"<img src='../wap/img/time/nyr.png'/>"+ getImg(months)+"<img src='../wap/img/time/nyr.png'/>"+getImg(day)+"<img src='../wap/img/time/blank.png'/>"+getImg(hours)+"<img src='../wap/img/time/sfm.png'/>"+ getImg(minutes)+"<img src='../wap/img/time/sfm.png'/>"+ getImg(seconds);
	dv.innerHTML = year + "-" + months + "-" + day + " " + hours + ":" + minutes + ":" + seconds;
}
</script>
<body>
<!-- website wrapper starts -->
<div class="websiteWrapper" style="min-height: 792px;"> 
  
  <!-- header outer wrapper starts -->
  <div class="headerOuterWrapper" style="height:50px">
  	<div id="demo" class="qimo8">
	  <div class="qimo">
	    <div id="demo1">
	      <ul id="rolechar">
	      </ul>
	    </div>
	    <div id="demo2"></div>
	  </div>
	</div>
    <div class="headerWrapper" style="height:50px">
    	<div id="cur_time"></div>
    </div>
  </div>
  <!-- header outer wrapper ends --> 
  
  <!-- slider wrapper starts -->
  <div class="sliderOuterWrapper">
    <div class="sliderWrapper">
      <div class="mainSlider container" id="idPicShow"> 
		<ul id="idNum"></ul>
	  </div>
    </div>
  </div>
  <!-- slider wrapper ends --> 
  
  <!-- main menu outer wrapper starts -->
  <div class="mainMenuOuterWrapper">
	<ul class="mainMenuWrapper">
	  <#if apiList?exists&&(apiList?size>0)>
	  <#list apiList as api>
	  <li class="" style=""><a href="../wap.htm?m=${api.apiCode?if_exists}">${api.apiName?if_exists}<span style="float:right;margin-right: 20px;">&gt;&gt;</span></a></li>
	  </#list>
	  </#if>
    </ul>
  </div>
  <!-- main menu outer wrapper ends --> 
</div>

<!-- footer wrapper starts -->
  <div class="footerWrapper" style="margin-top:20px;"> 
    <!-- copyright wrapper starts -->
    <div class="copyrightWrapper"> 
      <!-- copyright starts --> 
      <span class="copyright">版权所有  ©${.now?if_exists?substring(0, 4)} 常识小哥</span> <!-- copyright ends --> 
    </div>
    <!-- copyright wrapper ends --> 
  </div>
  <!-- footer wrapper ends -->
<!-- website wrapper ends -->
<style type="text/css">
.qimo8{ overflow:hidden;position: absolute;top: 0px; z-index: 1001;color: #ddd;}
.qimo8 .qimo {width:1000%; height:30px;}
.qimo8 .qimo div{ float:left;}
.qimo8 .qimo ul{float:left; height:30px; overflow:hidden; zoom:1; }
.qimo8 .qimo ul li{float:left; line-height:30px; list-style:none;margin-right:10px;}
</style>
<script type="text/javascript">
$(document).ready(function(){
	getChars();
});

function getChars() {
	$("#rolechar").html("");
	$.ajax({
		type:"POST",
		url:"../wap.htm?m=runchar",
		async:false,
		success:function(data){
			var json = eval('('+data+')');
			if(json.code == "0" && checkExist(json.chars)) {
				var html = "";
				var chars = eval('('+json.chars+')');
				for(var i=0;i<chars.length;i++) {
					html += "<li>"+chars[i].content+"</li>";
				}
				$("#rolechar").append(html);
				runChars();
			}else {
			}
		}
	});
}

function runChars() {
	var demo = document.getElementById("demo");
	var demo1 = document.getElementById("demo1");
	var demo2 = document.getElementById("demo2");
	demo2.innerHTML = document.getElementById("demo1").innerHTML;
	function Marquee(){
		if(demo.scrollLeft - demo2.offsetWidth >= 0){
			demo.scrollLeft -= demo1.offsetWidth;
		}else{
			demo.scrollLeft++;
		}
	}
	var myvar = setInterval(Marquee, 30);
	demo.onmouseout = function (){
		myvar = setInterval(Marquee, 30);
	}
	demo.onmouseover = function(){
		clearInterval(myvar);
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
<script type="text/javascript">
$(document).ready(function(){
	$(".mainMenuWrapper li").each(function(){
		$(this).css("background-color", getrgb());
	});
});

function getrgb() {
	
	return "rgb("+getNum(80,155)+","+getNum(80,155)+","+getNum(80,155)+")";
}

//获取随机整数
function getNum(min, max) {   
	var range = max - min;   
	return parseInt((min + Math.random() * range));   
}
</script>

<script>
var rvt = new RevealTrans("idPicShow");

<#if fileList?exists&&(fileList?size>0)>
<#list fileList as file>
rvt.Add('${file.filePath?if_exists}');
</#list>
<#else>
rvt.Add('/wap/img/slide-2.jpg');
</#if>

var arrImg = [];
var oNum = XXXXX("idNum"), arrNum = [];

//设置图片列表
Each(rvt.List, function(list, i){
	//图片式
	var img = document.createElement("img");
	img.src = list["img"];
	arrImg[i] = img;
	//按钮式
	var li = document.createElement("li");
	li.innerHTML = i + 1;
	arrNum[i] = li;
	if(rvt.List.length > 1) {
	oNum.appendChild(li);
	}
	//事件设置
	img.onmouseover = li.onmouseover = function(){ rvt.Auto = false; rvt.Index = i; rvt.Start(); };
	img.onmouseout = li.onmouseout = function(){ rvt.Auto = true; rvt.Start(); };
});

//设置图片列表样式 文本显示区域
rvt.onShow = function(){
	var i = this.Index, list = this.List[i];
	//图片式
	Each(arrImg, function(o){ o.className = ""; }); arrImg[i].className = "on";
	//按钮式
	Each(arrNum, function(o){ o.className = ""; }); arrNum[i].className = "on";
}
rvt.Start();

</script>
</div>
</body>
</html>
