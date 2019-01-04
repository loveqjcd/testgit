<!DOCTYPE html>
<html class="login-bg">
<head>
	<title>${sysTitle}</title>
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
	
    <!-- bootstrap -->
    <link href="../css/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="../css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <link href="../css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />
    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="../css/layout.css" />
    <link rel="stylesheet" type="text/css" href="../css/elements.css" />
    <link rel="stylesheet" type="text/css" href="../css/icons.css" />
    <!-- libraries -->
    <link rel="stylesheet" type="text/css" href="../css/lib/font-awesome.css" />
    <!-- this page specific styles -->
    <link rel="stylesheet" href="../css/compiled/signup.css" type="text/css" media="screen" />
    
    <!-- scripts -->
    <script src="../js/jquery-1.7.2.min.js"></script>
    <script src="../js/jquery-latest.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/theme.js"></script>
    <script src="../js/csqx.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/getscript?v=2.0&ak=CG8eakl6UTlEb1OakeWYvofh"></script>
    
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
</head>
<body>
    <div class="header">
        <a href="index.html">
            <img src="../img/logo.png" class="logo" />
        </a>
    </div>
    <div class="row-fluid login-wrapper">
        <div class="box">
            <div class="content-wrap">
                <h6>城市区县经纬度同步</h6>
                <table width="100%">
                <tr>
                	<td>城市区县：</td>
                	<td>
                		<select class="" style="width:120px;height:30px;" id="cityId" name="cityId">
                        	<option value="">城市名称</option>
                            <#if cityList?exists&&(cityList?size>0)>
                            <#list cityList as city>
                            <option name="city" value="${city.id?if_exists}">${city.name?if_exists}</option>
                            </#list>
                            </#if>
                         </select>
                         <select class="" style="width:120px;height:30px;" id="districtId" name="districtId">
                        	<option name="" value="">城市名称</option>
                         </select>
                	</td>
                </tr>
                </table>
                <div class="action">
                    <a class="btn-glow primary signup" href="javascript:;" onclick="updateCity();">更新城市</a>
                    <a class="btn-glow primary signup" href="javascript:;" onclick="updateDist();">更新区县</a>
                </div>
                <br><br>
                city_flag：<input type="" id="city_flag" value="" /><br><br>
                dist_second_txt：<input type="" id="dist_second_txt" value="" /><br><br>
                dist_index_txt：<input type="" id="dist_index_txt" value="" /><br><br>
                
                areaId：<input type="" id="areaId" value="" /><br><br>
                lng：<input type="" id="lng" value="" /><br><br>
                lat：<input type="" id="lat" value="" /><br>
            </div>
        </div>

        <div class="span12 already" style="margin-top:80px;">
            <p>上海香象信息技术有限公司 版权所有 © 2010-2014</p>
            <a target="_blank" href="http://www.miitbeian.gov.cn/">沪ICP备13043583号</a>
        </div>
    </div>

<script language="javascript">

var myGeo = new BMap.Geocoder();
function locate() {
	var addr = "";
	var cityId = $("#cityId").val();
	var districtId = $("#districtId").val();
	
	if(cityId != "") {
		addr = $("select[name='cityId'] option[value='"+cityId+"']").text();
		$("#areaId").val(cityId);
	}
	if($("#districtId").val() != "") {
		addr = addr + " " + $("select[name='districtId'] option[value='"+districtId+"']").text();
		$("#areaId").val(districtId);
	}
	if(addr != "") {
		myGeo.getPoint(addr, function(point){
			if(point){
				$("#lng").val(point.lng);
				$("#lat").val(point.lat);			
			}else {
				$("#lng").val("");
				$("#lat").val("");
			}
		});
	}else {
		$("#lng").val("");
		$("#lat").val("");
		$("#areaId").val("");
	}
}

var city_length = $("select[name='cityId'] option[name='city']").length;	//城市总数

var city_index = 0;
var dist = 0;
function updateDist() {
	dist ++;
	if(dist%5 == 0) {
		var city_flag = $("#city_flag").val();
		if(city_flag == "" && city_index<city_length) {	//当前该切换城市
			city_index++;
			if(79 <= city_index) {
				$("#cityId").get(0).selectedIndex = city_index;
				$("#city_flag").val($("#cityId").val());
				getDistrict();
				setTimeout(aaa, 5000);
			}
		}
	}
	setTimeout(updateDist, 1000);
	$("#dist_second_txt").val(dist);
}

var dist_index = 0;
var dist_length = 0;
function aaa() {
	dist_length = $("select[name='districtId'] option[name='district']").length;
	if(dist_index < dist_length) {
		dist_index++;
		$("#districtId").get(0).selectedIndex = dist_index;
		locate();
		setTimeout(update, 2000);	//定位2秒后开始更新操作
		setTimeout(aaa, 5000);	//更新操作3秒后切换下一个地区
	}else {
		$("#city_flag").val("");
		dist_index = 0;
		dist_length = 0;
		$("#districtId").empty();
		var html = "<option name='' value=''>城市名称</option>";
		$("#districtId").append(html);
	}
	$("#dist_index_txt").val(dist_index);
}

function update() {
	var areaId = $("#areaId").val();
	var lng = $("#lng").val();
	var lat = $("#lat").val();
	
	if(cityId != "" && lng != "" && lat != "") {
		$.ajax({
			type:"POST",
			url:"../common/common.htm?m=updateLoaction",
			async:false,
			data:{"areaId":areaId,"lng":lng,"lat":lat},
			success:function(data) {
				if(data == "yes") {
					showTipMessage(areaId+" 更新完成", 600, 1);
				}
			}
		});
	}
}

function getDistrict() {
	var cityId = $("#cityId").val();
	$("#districtId").empty();
	var html="<option name='' value=''>城市名称</option>";
	$.ajax({
		type:"POST",
		url:"../common/common.htm?m=getAreas&parentId="+cityId,
		async:true,
		success:function(data){
			var jsons = eval('('+data+')');
			for(var i in jsons.data) {
				var json = jsons.data[i];	
				html = html + "<option name='district' value='"+json.id+"' >"+json.name+"</option>";
			}
			$("#districtId").append(html);
		}
	});
}

function updateCity() {
	if(city_index < city_length) {	//当前该切换城市
		city_index++;
		$("#cityId").get(0).selectedIndex = city_index;
		locate();
		setTimeout(update, 2500);
		setTimeout(updateCity, 5000);
	}else {
		alert("game over!");
	}
}

</script>

<script language="javascript">

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
</body>
</html>