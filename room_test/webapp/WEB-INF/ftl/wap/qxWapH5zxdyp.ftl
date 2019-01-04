<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${title?if_exists}</title>
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width">
<script type="text/javascript" src="../wap/js/jquery-2.1.4.min.js"></script>

<script>
$(document).ready(function(){
	$.ajax({
		type:"POST",
		url:"../wap.htm?m=h5zxdyp",
		async:true,
		data:{"opt":"q"},
		success:function(data){
			var json = eval('('+data+')');
			if(json.code == "0") {
				var obj = eval('('+json.msg+')');
				if(is_weixn()) {
					window.location.href = obj.h5weixin;
				}else {
					window.location.href = obj.h5url;
				}
			}else {
				alert(json.msg);;
			}
		}
	});
});

function is_weixn(){
    var ua = navigator.userAgent.toLowerCase();  
    if(ua.match(/MicroMessenger/i)=="micromessenger") {  
        return true;  
    } else {  
        return false;  
    }  
} 

</script>
</head>
<body>
	   
</body>
</html>