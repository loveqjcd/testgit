<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>上传图片</title>
  <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
  <script type="text/javascript" src="../js/jquery.form.js"></script>
  <link rel="stylesheet" type="text/css" href="../css/upload.css">
</head>
<body> 

<div class="edui-modal edui-dialog-image" tabindex="-1" id="edui-dialog-image" style="z-index: 1001;display: block;">
	<div class="edui-modal-body">
	<div class="edui-image-wrapper">
		<ul class="edui-tab-nav">
		  <li class="edui-tab-item edui-active"><a class="edui-tab-text" href="javascript:;">上传图片</a></li>
		  <li class="edui-tab-item"><a class="edui-tab-text" href="javascript:;" onclick="changeType();">空间图片</a></li>
		</ul>
		<div class="edui-tab-content">
		  <div class="edui-image-JimgSearch edui-tab-pane edui-active" style="display:;">
			<div class="edui-image-searchBar">
			  <table>
				<tbody>
					<tr style="line-height:40px;">
						<td style="width:20%"><a>网络图片:</a></td>
						<td><input class="edui-image-searchTxt" type="text" id="net_picture" placeholder="请贴入网络图片地址，允许256kb"></td>
						<td><div class="edui-image-searchAdd" onclick="getPicture();">提取</div></td>
					</tr>
					<tr style="line-height:40px;">
						<td style="width:20%"><a>本地上传:<br>允许256kb</a></td>
						<td>
							<form id="uploadForm" name="uploadForm" method="POST" enctype="multipart/form-data" action="">
								<input name="imageFile" onchange="uploadImage(this);" type="file" />
							</form>
						</td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td>
						  <div class="edui-image-item" style="width:120px;margin-top">			
							<img id="picture_upload" src="<#if uploadFileDo?exists>${uploadFileDo.filePath?if_exists}<#else>../image/no-pic.jpg</#if>" class="edui-image-pic" height="58" width="120" style="top: 31px; left: 0px;">
						  </div>
						</td>
						<td></td>
					</tr>
				</tbody>
			  </table>
			</div>
		  </div>
		</div>
	</div>
	</div>
	<div class="edui-modal-footer" style="position:absolute;bottom:0px;right:9px;top:380px;">
		<div class="edui-modal-tip"></div>
		<input type="hidden" id="imgId" name="imgId" value="${imgId?if_exists}" />
		<input type="hidden" id="maxSize" name="maxSize" value="${maxSize?if_exists}" />
		<input type="hidden" id="fileSuffix" name="fileSuffix" value="${fileSuffix?if_exists}" />
		<input type="hidden" id="filePath" name="filePath" value="<#if uploadFileDo?exists>${uploadFileDo.filePath?if_exists}</#if>" />
		<div class="edui-btn edui-btn-primary" data-ok="modal" onclick="confirmPic();">确认</div>
		<div class="edui-btn" data-hide="modal" onclick="parent.$.fancybox.close();">取消</div>
	</div>
</div>

<script language="javascript">

function changeType() {
	var imgId = $("#imgId").val();
	var maxSize = $("#maxSize").val();
	var fileSuffix = $("#fileSuffix").val();
	window.location.href = "../common/uploadPicture.htm?m=commonUpload&type=space&imgId="+imgId+"&maxSize="+maxSize+"&fileSuffix="+fileSuffix;
}

function uploadImage(obj) {
	if(obj.value != "") {
		var fileSuffix = $("#fileSuffix").val();
		if(fileSuffix != "" && fileSuffix == "jpg") {
			var imgtype = /^.*\.(jpg)$/i;
			if(!imgtype.test(obj.value)) {
				parent.parent.showTipMessage("仅支持 jpg 格式图片", 1500, 2);
				document.uploadForm.reset();
				return false;
			}
		}if(fileSuffix != "" && fileSuffix == "png") {
			var imgtype = /^.*\.(png)$/i;
			if(!imgtype.test(obj.value)) {
				parent.parent.showTipMessage("仅支持 png 格式图片", 1500, 2);
				document.uploadForm.reset();
				return false;
			}
		}if(fileSuffix != "" && fileSuffix == "gif") {
			var imgtype = /^.*\.(gif)$/i;
			if(!imgtype.test(obj.value)) {
				parent.parent.showTipMessage("仅支持 gif 格式图片", 1500, 2);
				document.uploadForm.reset();
				return false;
			}
		}else {
			var imgtype = /^.*\.(jpg|png|gif)$/i;
			if(!imgtype.test(obj.value)) {
				parent.parent.showTipMessage("仅支持jpg、png、gif格式图片", 1500, 2);
				document.uploadForm.reset();
				return false;
			}
		}
		var maxSize = $("#maxSize").val();
		$("#uploadForm").ajaxSubmit({
			type:"POST",
			url:"../common/uploadPicture.htm?m=uploadImageLocal&maxSize="+maxSize,
			dataType:"JSON",
			success:function(data){
				data = eval('('+data+')');
                if(data.code == "0") {
                	$("#picture_upload").attr("src", data.msg);
                	$("#filePath").val(data.msg);
                }else {
                	parent.parent.showTipMessage(data.msg, 1500, 2);
                	return false;
                }
            }
		});
	}
}

function getPicture() {
	var pic = $.trim($("#net_picture").val());
	var fileSuffix = $("#fileSuffix").val();
	if(fileSuffix != "" && pic.indexOf(fileSuffix) != (pic.length-3)) {
		parent.parent.showTipMessage("仅支持  jpg 格式图片", 1500, 2);
		return false;
	}
	
	if(isPicUrl(pic)) {
		loadPicture();
	}else {
		parent.parent.showTipMessage("仅支持jpg、png、gif格式图片", 1500, 2);
        return false;
	}
}

function isPicUrl(str_url) {
	var strRegex = "^((https|http|ftp|rtsp|mms)?://)" 
        + "([a-z0-9A-Z])"
        + ".*\.(jpg|png|gif)$"; 
    var re = new RegExp(strRegex); 
    if(re.test(str_url)) {
   		return (true); 
  	}else { 
        return (false); 
    }
}

function loadPicture() {
	var pic = $.trim($("#net_picture").val());
	var maxSize = $("#maxSize").val();
	if(isPicUrl(pic)) {
		$.ajax({
			type:"POST",
			url:"../common/uploadPicture.htm?m=uploadImageNet&maxSize="+maxSize,
			async:true,
			data:{"picture":pic},
			success:function(data) {
				data = eval('('+data+')');
                if(data.code == "0") {
                	$("#picture_upload").attr("src", data.msg);
                	$("#filePath").val(data.msg);
                }else {
                	parent.parent.showTipMessage(data.msg, 1500, 2);
                	return false;
                }
			}
		});
	}
}

function confirmPic() {
	var filePath = $("#filePath").val();
	if(filePath == "") {
		parent.parent.showTipMessage("请选择图片", 1500, 2);
		return false;
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