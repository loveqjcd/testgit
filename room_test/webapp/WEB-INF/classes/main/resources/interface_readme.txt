messageUrl=http://top.hkvips.com  代表SCRM微信接口  应用服务器的地址

1、当微信公众号接入到 SCRM时  会自动生成  
URL=http://top.hkvips.com/wechat/token 
Token=token  其实就是我们给这个公众号 定义的 sellerId

2、当SCRM 前端web 要调用 微信接口时：比如拿到 access_token 需要调用的链接地址是

messageUrl=http://top.hkvips.com/appreq/token?m=access_token


