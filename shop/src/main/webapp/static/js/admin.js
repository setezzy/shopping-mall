function setMsg(a, b) {
    a && b ? a.siblings(".tipMsg").html(b).show() : a.siblings(".tipMsg").html("").hide()
}


/**
 * 保存密码
 */
$(function(){
    $("#P_save").click(function(){
        var pold = $("#password"),
            pnew = $("#password_new"),
            v = !1,
            re = {};
        var po = $.trim(pold.val()),
            O = pold.attr("placeholder");
        if(po === O && (po = "")) return pold.focus(), setMsg(pold, "请输入原始密码"), !1;
        setMsg(pold, ""), re.password=po, v=!0;
        var pn = $.trim(pnew.val()),
            N = pnew.attr("placeholder");
        a = !1;
        if(pn === N && (pn = "")) return pnew.focus(), setMsg(pnew, "请输入新密码"), !1;
        setMsg(pnew, ""), re.password_new=pn, a=!0;

        savePassword(re), resetPass();
    })
})


/**
 * 取消保存密码
 */
$(function(){
    $("#P_cancel").click(function(){
        resetPass();
    })


})

function savePassword(re){
    $.ajax({
        type: "POST",
        url: baselocation + '/admin/info/update',
        data: re,
        dataType: "json",
        success: function(result){
            if(result.code == 1){
                layer.alert(result.message);
                window.location.href = '/shop_war_exploded/admin/login';
            }
            else{
                layer.alert(result.message, {
                    icon: 2
                });
            }
        },
        error: function (result) {
            layer.alert(result.message, {
                icon : 2
            });
        }

    });
}


function resetPass(){
    $("#password").val(""),
        $("#password_new").val(""),
        $(".tipMsg").html("").hide();
}