<style>
.footerWrapper {
    padding-left: 24px;
    padding-right: 24px;
    background-color: #333;
    height:40px;
    box-shadow: inset 0px 1px 3px rgba(0,0,0,0.12);
    width: 100%;
    display: block;
    overflow: hidden;
    position:fixed;
    bottom:0px;
}
.copyrightWrapper {
    height: 40px;
    line-height: 40px;
    clear: both;
}
.copyright {
    color: #fff;
    display: inline;
    float: left;
}
</style>

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