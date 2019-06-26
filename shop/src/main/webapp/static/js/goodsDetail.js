$(function () {

});

/**
 * 导航分类栏显示及颜色变换
 */
$(function () {
    $('#J_navCategory').mouseover(function () {
        $('.site-category').css('display', 'block');
    })
    $('#J_navCategory').mouseout(function () {
        $('.site-category').css('display', 'none');
    })
});

/**
 * 图片介绍动画切换效果
 */
$(function () {
    $("#goodsPicList").on('click', 'li', function () {
        $("#goodsPicList li").removeClass("current");
        $(this).addClass("current");
        var largePath = $(this).children("img").attr("src");
        $("#J_BigPic").attr({
            src: largePath
        })
    });
    $("#goodsPicList li:first").click(); //第一张图片
})

/**
 * 导航悬浮
 */
$(window).scroll(function () {
    var $this = $(this);
    var targetTop = $(this).scrollTop();
    var height = $(window).height();

    //document.title=targetTop;
    //控制导航悬浮
    if (targetTop > 800) {
        $("#goodsSubBar").css('display', 'block');
    } else {
        $("#goodsSubBar").css('display', 'none');
    }

    if (targetTop > $("#goodsDesc").offset().top - 100 && targetTop < $("#goodsParam").offset().top - 100) {
        $(".goods-sub-bar .detail-list").find("li").removeClass("current");
        $(".goods-sub-bar .detail-list").find("li").eq(0).addClass("current");
    } else if (targetTop > $("#goodsParam").offset().top - 100 && targetTop < $("#goodsComment").offset().top - 100) {
        $(".goods-sub-bar .detail-list").find("li").removeClass("current");
        $(".goods-sub-bar .detail-list").find("li").eq(1).addClass("current");
    }
});


/**
 * 导航悬浮点击事件
 */
var subNav_active = $(".current");
var subNav_scroll = function (target) {
    subNav_active.removeClass("current");
    target.parent().addClass("current");
    subNav_active = target.parent();
};
$(".goods-sub-bar .detail-list a").click(function () {
    subNav_scroll($(this));
    if ($(this).parent().attr("id") != "join") {
        var target = $(this).attr("href");
        var targetScroll = $(target).offset().top - 40;
        $("html,body").animate({
            scrollTop: targetScroll
        }, 300);
        return false;
    }
});
$(".goods-detail-nav .detail-list a").click(function () {
    subNav_scroll($(this));
    if ($(this).parent().attr("id") != "join") {
        var target = $(this).attr("href");
        var targetScroll = $(target).offset().top - 40;
        $("html,body").animate({
            scrollTop: targetScroll
        }, 300);
        return false;
    }
});
$(".goods-info-head-userfaq .detail-list a").click(function () {
    if ($(this).parent().attr("id") != "join") {
        var target = $(this).attr("href");
        var targetScroll = $(target).offset().top - 40;
        $("html,body").animate({
            scrollTop: targetScroll
        }, 300);
        return false;
    }
});




/**
 * 加入购物车
 */
function add_cart(obj) {
    layer.alert("暂未开通该功能", {
        icon: 5
    });
    var pnumber = $(obj).attr("data-product-number");
    $.ajax({
        type: 'post',
        dataType: 'json',
        data: {
            'pnumber': pnumber
        },
        url: baselocation + '/cart',
        success: function (result) {
            console.log(result.message);
            if (result.code == 1) {
                window.location.href = baselocation + '/cart/' + result.message;
            } else if (result.code == 401) {
                window.location.href = '/shop_war_exploded/login';
            } else {
                layer.alert(result.message, {
                    icon: 2
                });
            }
        }
    })
}



/**
 * 直接购买
 */

function direct_buy(obj){
        var pnumber = $(obj).attr("data-product-number"),
            dat = {};
        dat.pnumber = pnumber;
        $.ajax({
            type: 'post',
            url: baselocation + '/buy/product',
            data: dat,
            dataType: "json",
            success: function (result) {
                if(result.code == 1){
                    window.location.href = baselocation + '/buy/checkout'
                }
                else if(result.code == 401){
                    layer.alert(result.message, {
                        icon: 4
                    });
                    window.location.href = '/shop_war_exploded/login'
                }
                else{
                    layer.alert(result.message, {
                        icon: 2
                    });
                }
            },
            error: function(result){
                alert(result)
            }
        })
}

