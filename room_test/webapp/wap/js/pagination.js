function initPage(total,currentlyPageNo,pageTotal){
	document.getElementById("wap_page").innerHTML = "";
	if(total > 0) {
		var html ="<ul style='display:inline-flex;'>"
				+"<li style='padding-right:5px;'><a id='prev-page' href='javascript:;'>上一页</a></li>"
				+"<li style='padding-right:5px;'><a id='next-page' href='javascript:;'>下一页</a></li>"
				+"<li style='padding-right:5px;'><select id='select-page' style='width:50px;height:20px;margin-bottom:10px;font-size:12px;'></select></li>"
				+"</ul>";
				
		document.getElementById("wap_page").innerHTML = html;
		$('#prev-page').bind('click',function(){
			$('#pageNo').val(currentlyPageNo-1);
			queryData();
		});
		$('#next-page').bind('click',function(){
			$('#pageNo').val(currentlyPageNo+1);
			queryData();
		});
		if(currentlyPageNo == 1) {
			$('#prev-page').unbind('click');
			$('#prev-page').attr('style', 'color:#bcc6d3;cursor:default;');
		}
		if(currentlyPageNo == pageTotal) {
			$('#next-page').unbind('click');
			$('#next-page').attr('style', 'color:#bcc6d3;cursor:default;');
		}
		var ss = "";
		for(var i=1;i<=pageTotal;i++) {
			if(i == currentlyPageNo) {
				ss += "<option value='"+i+"' selected>&nbsp;"+i+" </option>";
			}else {
				ss += "<option value='"+i+"'>&nbsp;"+i+" </option>";
			}
		}
		$("#select-page").append(ss);
		$('#select-page').bind('change',function(){
			$('#pageNo').val($('#select-page').val());
			queryData();
		});
	}	
}