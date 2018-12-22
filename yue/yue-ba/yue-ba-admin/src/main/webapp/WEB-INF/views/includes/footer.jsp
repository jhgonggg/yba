
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="/static/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->


<script src="/static/assets/global/plugins/morris/morris.min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/morris/raphael-min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/counterup/jquery.waypoints.min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/counterup/jquery.counterup.min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/horizontal-timeline/horizontal-timeline.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/flot/jquery.flot.min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/flot/jquery.flot.resize.min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/flot/jquery.flot.categories.min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/jquery-easypiechart/jquery.easypiechart.min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/jquery.sparkline.min.js" type="text/javascript"></script>

<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="/static/assets/global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="/static/assets/pages/scripts/dashboard.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<script src="/static/assets/layouts/layout6/scripts/layout.js" type="text/javascript"></script>
<script src="/static/assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
<script src="/static/assets/layouts/global/scripts/quick-nav.min.js" type="text/javascript"></script>
<!-- END THEME LAYOUT SCRIPTS -->
<!--GoEasy-->
<script type="text/javascript" src="https://cdn.goeasy.io/goeasy.js"></script>
<!--Vue-->
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.21/dist/vue.min.js"></script>
<script>
    var flag = true,//状态true为正常的状态,false为放大的状态
        imgH, //图片的高度
        imgW; //图片的宽度
    $(function () {
        $("img").each(function () {
            $(this).click(function () {
                //图片点击事件
                imgH =  $(this).height(); //获取图片的高度
                imgW =  $(this).width(); //获取图片的宽度
                if(flag){
                    //图片为正常状态,设置图片宽高为现在宽高的2倍
                    flag = false;//把状态设为放大状态
                    $(this).height(imgH*2.5);
                    $(this).width(imgW*2.5);
                }else{
                    //图片为放大状态,设置图片宽高为现在宽高的二分之一
                    flag = true;//把状态设为正常状态
                    $(this).height(imgH/2.5);
                    $(this).width(imgW/2.5);
                }
            })
        })
    })
</script>