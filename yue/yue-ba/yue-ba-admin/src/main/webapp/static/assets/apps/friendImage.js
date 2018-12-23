var Images=function () {

    var init=function () {
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
        });
    };

    var love=function (uid,id) {
        //点赞  id---朋友圈id
        $.ajax({
            "url":"/praise/love",
            "data":{"praiseUid":uid,"fcmId":id},
            "type":"POST",
            "dataType":"JSON",
            "success":function (data) {
                $(".modal-body").html(data.message);
                $("#modal-danger").modal("show");
                $("#check").click(function () {
                    window.location.reload();
                })
            }
        });
    };
    return{
        init:function () {
            init();
        },
        love:function (uid,id) {
           love(uid,id) ;
        }
    }
}();

jQuery(document).ready(function () {
    Images.init();
});