function zgpagination(totalProperty,currentlyPageNo,pageTotal){
	if(totalProperty > 0) {
		var html ="<ul class='pagination pagination-sm'>"
				+"<li><a id='first-page' href='javascript:;'>首页</a></li>"
				+"<li><a id='prev-page' href='javascript:;'>上一页</a></li>"
				+"<li><a id='next-page' href='javascript:;'>下一页</a></li>"
				+"<li><a id='end-page' href='javascript:;'>尾页</a></li>"
				+"<li><span style='padding-left:10px;position:relative;bottom:0px;'>页次:"+currentlyPageNo+"/"+pageTotal+"页</span></li>"
				+"<li><span style='padding-left:10px;position:relative;bottom:0px;'>共"+totalProperty+"条记录</span></span></li>"
				+"<li><select id='select-page' class='ms-sel-ctn' style='margin-left:10px;width:100px;height:29px;padding:4px;font-size:12px;border: 1px solid #dddddd;'></select></li>"
				+"</ul>";
				
		document.getElementById("dt_example").innerHTML = html;
		$('#first-page').bind('click',function(){
			$('#pageNo').val(1);
			$('#optForm').submit();
		});
		$('#prev-page').bind('click',function(){
			$('#pageNo').val(currentlyPageNo-1);
			$('#optForm').submit();
		});
		$('#next-page').bind('click',function(){
			$('#pageNo').val(currentlyPageNo+1);
			$('#optForm').submit();
		});
		$('#end-page').bind('click',function(){
			$('#pageNo').val(pageTotal);
			$('#optForm').submit();
		});
		if(currentlyPageNo == 1) {
			$('#first-page').unbind('click');
			$('#prev-page').unbind('click');
			$('#first-page').attr('style', 'color:#bcc6d3;cursor:default;');
			$('#prev-page').attr('style', 'color:#bcc6d3;cursor:default;');
		}
		if(currentlyPageNo == pageTotal) {
			$('#next-page').unbind('click');
			$('#end-page').unbind('click');
			$('#next-page').attr('style', 'color:#bcc6d3;cursor:default;');
			$('#end-page').attr('style', 'color:#bcc6d3;cursor:default;');
		}
		var ss = "";
		for(var i=1;i<=pageTotal;i++) {
			if(i == currentlyPageNo) {
				ss += "<option value='"+i+"' selected>第 "+i+" 页</option>";
			}else {
				ss += "<option value='"+i+"'>第 "+i+" 页</option>";
			}
		}
		$("#select-page").append(ss);
		$('#select-page').bind('change',function(){
			$('#pageNo').val($('#select-page').val());
			$('#optForm').submit();
		});
	}	
}