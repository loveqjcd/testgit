<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>空间图片</title>
  <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
  <link rel="stylesheet" type="text/css" href="../css/upload.css">
</head>
<body>

<div class="edui-modal edui-dialog-image" style="z-index: 1001; display: block;">
	<div class="edui-modal-body">
	<div class="edui-image-wrapper">
		<ul class="edui-tab-nav">
		  <li class="edui-tab-item"><a class="edui-tab-text" href="../common/uploadPicture.htm?m=commonUpload&type=local&imgId=${imgId?if_exists}&maxSize=${maxSize?if_exists}&fileSuffix=${fileSuffix?if_exists}">上传图片</a></li>
		  <li class="edui-tab-item edui-active"><a class="edui-tab-text" href="javascript:;">空间图片</a></li>
		</ul>
		<div class="edui-tab-content">
		  <div class="edui-image-local edui-tab-pane" style="display:block;">
		  	<#if pageInfo?exists&&(pageInfo.data?size>0)>
			<div class="edui-image-content" style="height:280px;">
			<#list pageInfo.data as file>
			  <div class="edui-image-item edui-image-upload-item" onclick="choosePic('${file.id?if_exists}');">
				<div id="gou_${file.id?if_exists}" name="gou" class=""></div>
				<input type="hidden" id="filePath_${file.id?if_exists}" value="${file.filePath?if_exists}" />
				<input type="hidden" id="fileSize_${file.id?if_exists}" value="${file.fileSize?if_exists}" />
				<img src="${file.filePath?if_exists}" class="edui-image-pic" height="75" width="120" style="top: 22.5px; left: 0px;">
			  </div>
			</#list>
			</div>
			
			<div class="edui-image-searchBar">
			  <li style="float:right;list-style-type:none;">
			  	共有&nbsp;${pageInfo.dataTotal?if_exists}&nbsp;条记录
			  	<select style="width:80px;" id="pageNo" onchange="pageChange();">
					<option>fff</option>
				</select>
			  </li>
			</div>
			<#else>
			<div class="edui-image-searchBar" style="margin-top:10%;margin-left:40%;">
			  <li style="list-style-type:none;">
			  	<a>暂无图片记录</a>
			  </li>
			</div>
			</#if>
		  </div>
		</div>
	</div>
	</div>
	<div class="edui-modal-footer" style="position:absolute;bottom:0px;right:9px;top:380px;">
		<div class="edui-modal-tip"></div>
		<input type="hidden" id="imgId" name="imgId" value="${imgId?if_exists}" />
		<input type="hidden" id="maxSize" name="maxSize" value="${maxSize?if_exists}" />
		<input type="hidden" id="fileSuffix" name="fileSuffix" value="${fileSuffix?if_exists}" />
		<input type="hidden" id="sId"  name="sId" value="" />
		<input type="hidden" id="filePath" name="filePath" value="" />
		<div class="edui-btn edui-btn-primary" data-ok="modal" onclick="confirmPic();">确认</div>
		<div class="edui-btn" data-hide="modal" onclick="parent.$.fancybox.close();">取消</div>
	</div>
</div>

<script language="javascript" >
<#if pageInfo?exists&&(pageInfo.data?size>0)>
	$("#pageNo").empty();
	var pageTotal = "${pageInfo.pageTotal?if_exists}";
	pageTotal = parseInt(pageTotal);
	var currentlyPageNo = "${pageInfo.currentlyPageNo?if_exists}";
	currentlyPageNo = parseInt(currentlyPageNo);
	var html = "";
	for(var i=1;i<=pageTotal;i++) {
		if(i == currentlyPageNo) {
			html += "<option value='"+i+"' selected>&nbsp;第&nbsp;"+i+"&nbsp;页&nbsp;</option>"
		}else {
			html += "<option value='"+i+"'>&nbsp;第&nbsp;"+i+"&nbsp;页&nbsp;</option>"
		}
	}
	$("#pageNo").append(html);
</#if>

function pageChange(){
	var pageNo = $("#pageNo").val();
	var imgId = $("#imgId").val();
	var maxSize = $("#maxSize").val();
	var fileSuffix = $("#fileSuffix").val();
	window.location.href="../common/uploadPicture.htm?m=commonUpload&type=space&imgId="+imgId+"&pageNo="+pageNo+"&maxSize="+maxSize+"&fileSuffix="+fileSuffix;
}

function choosePic(id) {
	if($("#gou_"+id).attr("class").indexOf("edui-image-close") != -1) { 
		$("#gou_"+id).removeClass("edui-image-close");
		$("#filePath").val("");
		$("#sId").val("");
	}else {
		$("div[name='gou']").each(function(){
			$(this).removeClass("edui-image-close");
		});
		$("#gou_"+id).addClass("edui-image-close");
		$("#filePath").val($("#filePath_"+id).val());
		$("#sId").val(id);
	}
}

function confirmPic() {
	var filePath = $("#filePath").val();
	if(filePath == "") {
		parent.parent.showTipMessage("请选择图片", 1500, 2);
		return false;
	}
	var maxSize = $("#maxSize").val();
	if(maxSize != "") {
		var sId = $("#sId").val();
		if(sId != "") {
			var fileSize = $("#fileSize_"+sId).val();
			fileSize = parseInt(fileSize);
			var max = parseInt(maxSize) * 1024;
			if(fileSize > max) {
				parent.parent.showTipMessage("图片最大允许 "+maxSize+" KB", 1500, 2);
				return false;
			}
		}
	}
	var fileSuffix = $("#fileSuffix").val();
	if(fileSuffix != "") {
		if(filePath.indexOf(fileSuffix) != (filePath.length-3)) {
			parent.parent.showTipMessage("仅支持 "+fileSuffix+" 格式图片", 1500, 2);
			return false;
		}
	}
	var imgId = $("#imgId").val();
	var arr = imgId.split("_");
	parent.$("#"+arr[0]).val(filePath);
	parent.$("#"+imgId).attr("src", filePath);
	parent.$.fancybox.close();
}

</script>
</body>
</html>