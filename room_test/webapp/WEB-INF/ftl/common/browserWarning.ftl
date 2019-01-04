<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>${sysTitle}</title>
<link href="../css/cdjsnsbkdt.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
<script language="javascript">
	function visitStill() {
		parent.$("#optForm").submit();
	}
	
	function visitCancel() {
		parent.$("#browserFlag").val("");
		parent.$.fancybox.close();
	}
</script>
</head>
<body>
<div id="bd" class="container clearfix" style="width:100%;">
	<div id="main">
		<div class="modal browser_modal" style="margin-top:20px;">
			<div class="modal-header">
				<h3>致亲爱的用户</h3>
			</div>
			<div class="modal-body">
				<p class="ta-c" style="font-size:14px;">
					为了更完善的体验，抢先建议您使用：<br>谷歌浏览器、火狐浏览器、360极速浏览器、世界之窗浏览器、IE9.0+<br/>其他浏览器可能会导致您无法正常使用部分功能，点击下列图标进行下载。
				</p>
				<p class="ta-c">
					<a title="下载谷歌浏览器" href="http://pan.baidu.com/s/1i3DXxjf" target="_blank">
						<img src="../image/icon_google.png" alt="下载谷歌浏览器" width="88" height="88" />
					</a>
					<a title="下载火狐浏览器" href="http://pan.baidu.com/s/1i3DXxjf" target="_blank">
						<img src="../image/icon_firefox.jpg" alt="下载火狐浏览器" width="88" height="88" />
					</a>
					<a title="下载360极速浏览器" href="http://pan.baidu.com/s/1i3DXxjf" target="_blank">
						<img src="../image/icon_360jisu.jpg" alt="下载360极速浏览器" width="88" height="88" />
					</a>
					<a title="下载世界之窗浏览器" href="http://pan.baidu.com/s/1i3DXxjf" target="_blank">
						<img src="../image/icon_world.jpg" alt="下载世界之窗浏览器" width="88" height="88" />
					</a>
					<a title="下载IE9.0+" href="http://pan.baidu.com/s/1i3DXxjf" target="_blank">
						<img src="../image/icon_ie9+.jpg" alt="下载IE9.0+" width="88" height="88" />
					</a>
				</p>
				<p class="ta-c" style="margin-top:20px;">
					<a href="javascript:;" onclick="visitStill();" class="btn btn-primary btn-large" style="font-size:14px;">继续访问</a>
					<a href="javascript:;" onclick="visitCancel();" class="btn btn-default btn-large" style="font-size:14px;margin-left:20px;">取消</a>
                </p>
			</div>
		</div>
	</div>
</div>
</body>
</html>
