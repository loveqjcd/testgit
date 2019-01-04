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

<script>
$(document).ready(function(){
	setDay();
	setToday();
});

function queryData() {
	$("#hyzjDiv").html("");
	document.getElementById("error_msg").innerHTML = "";
	var year = $("#birthdayYear").val();
	var month = $("#birthdayMonth").val();
	var day = $("#birthdayDay").val();
	if(!year || !month || !day) {
		document.getElementById("error_msg").innerHTML = "请选择查询日期";
		return false;
	}
	$("#zxd-form-submit").removeAttr("onclick");
	$("#zxd-form-submit").val("查询中...");
	$.ajax({
		type:"POST",
		url:"../wap.htm?m=wnl",
		async:true,
		data:{"opt":"q","year":year,"month":month,"day":day},
		success:function(data){
			var json = eval('('+data+')');
			if(json.code == "0") {
				var obj = eval('('+json.msg+')');
				var html = "<li class='clear'><div class='text'>";
				html += "<div class='tit clear'><span class='title'><a class='c222'>"+obj.date+"&nbsp;"+obj.weekday+"</a></span></div>";
				if(obj.holiday != undefined && obj.holiday != null && obj.holiday != "") {
					html += "<div class='tit clear'><span class='title'><a class='c222'>"+obj.holiday;
					if(obj.desc != undefined && obj.desc != null && obj.desc != "") {
						html += "&nbsp;"+obj.desc;
					}
					html +="</a></span></div>";
				}
				html += "<div class='tit clear'><span class='title'><a class='c222'>"+obj.lunarYear+"【"+obj.animalsYear+"】&nbsp;"+obj.lunar+"</a></span></div>";
				if(checkExist(obj.suit)) {
				 html += "<div class='tit clear'><span class='title'><a style='color:#00ff77;'>宜："+obj.suit+"</a></span></div>";
				}
				if(checkExist(obj.avoid)) {
					html += "<div class='tit clear'><span class='title'><a style='color:#ff7700;'>忌："+obj.avoid+"</a></span></div>";
				}
				html += "</div></li>";
				$("#hyzjDiv").append(html);
			}else {
				$("#hyzjDiv").append(json.msg);
			}
			$("#zxd-form-submit").attr("onclick", "queryData()");
			$("#zxd-form-submit").val("查  询");
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

function numFilter(str) {
	var filter = /^[0-9]*$/;
	return filter.test(str);
}

	function setDay() {
		var htmlYear = "<option value=''>&nbsp;年份</option>";
		for (var i = 1900; i < 2100; i++) {
			htmlYear += "<option value='" + i + "'>&nbsp;" + i + "</option>";
		}
		$("#birthdayYear").append(htmlYear);
		var htmlMonth = "<option value=''>&nbsp;月份</option>";
		for (var i = 1; i < 13; i++) {
			htmlMonth += "<option value='" + i + "'>&nbsp;" + i + "</option>";
		}
		$("#birthdayMonth").append(htmlMonth);
		var htmlDay = "<option value=''>&nbsp;日期</option>";
		for (var i = 1; i < 32; i++) {
			htmlDay += "<option name='day' value='" + i + "'>&nbsp;" + i + "</option>";
		}
		$("#birthdayDay").append(htmlDay);
	}

	function changeDays() {
		var year = $("#birthdayYear").val();
		var month = $("#birthdayMonth").val();
		var day = $("#birthdayDay").val();
		var arr = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
		if(year != "" && month != "") {
			if(year%4==0 && year%100!=0 || year%400 == 0) {
				arr = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
			}
			var sum = 0;
			$("option[name='day']").each(function(){
				sum = this.value;
			});
			if(arr[month-1] != sum) {
				var htmlDay = "<option value=''>&nbsp;日期</option>";
				for(var i=1;i<=arr[month-1];i++) {
					if(day == i) {
						htmlDay += "<option name='day' value='"+i+"' selected>&nbsp;"+i+"</option>";
					}else {
						htmlDay += "<option name='day' value='"+i+"'>&nbsp;"+i+"</option>";
					}
				}
				$("#birthdayDay").empty();
				$("#birthdayDay").append(htmlDay);
			}
		}
		document.getElementById("error_msg").innerHTML = "";
		if(year != "" && month != "" && day != "") {
			queryData();
		}
	}
	
	function setToday() {
		var today = new Date();
		$("#birthdayYear").val(today.getFullYear());
		changeDays();
		$("#birthdayMonth").val(today.getMonth()+1);
		changeDays();
		$("#birthdayDay").val(today.getDate());
		changeDays();
		//queryData();
	}

</script>
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
			      <div class="jiting clearfix">
			        <label style="width:33%;">
				          <select id="birthdayYear" name="birthdayYear" onchange="changeDays();">
				          </select>
			        </label>
			        <label style="width:33%;">
				          <select id="birthdayMonth" name="birthdayMonth" onchange="changeDays();">
				          </select>
			        </label>
			        <label style="width:33%;">
				          <select id="birthdayDay" name="birthdayDay" onchange="changeDays();">
				          </select>
			        </label>
			      </div>
			      <span style="color:red;" id="error_msg"></span>
			      <input id="zxd-form-submit" class="ptag-set" type="button" onclick="queryData();" value="查  询">
		    </form>
		  </div>
		</section>
		<div class="b_list">
			<ul id="hyzjDiv">
				
			</ul>
		</div>
<!-- footer wrapper starts -->
  <#include "../common/wapfooter.ftl">
<!-- footer wrapper ends -->
</body>
</html>