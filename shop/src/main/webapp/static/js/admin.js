function setMsg(a, b) {
    a && b ? a.siblings(".tipMsg").html(b).show() : a.siblings(".tipMsg").html("").hide()
}

/**
 * 权限验证
 */
function check_admin() {
    $.ajax({
        type: "POST",
        url: baselocation + '/admin/user',
        data: null,
        dataType: "json",
        success: function (result) {
            if (result.code == 1) {
                window.location.href = baselocation + '/admin/user/list';
            } else {
                layer.alert(result.message, {
                    icon: 2
                });
            }
        }
    })
}

/**
 * 删除用户
 */
function user_delete(obj, data) {
    layer.confirm('确认要删除吗？', {
        btn : [ '确定', '取消' ]
    }, function() {
        $.ajax({
            type : 'delete',
            dataType : 'json',
            url : baselocation + '/admin/user/delete/' + data,
            success : function(result) {
                if (result.code == 1) {
                    $(obj).parent().parent("div").remove();
                    layer.msg('已删除!', {
                        icon : 1,
                        time : 1000
                    });
                } else {
                    layer.alert(result.message, {
                        icon : 2
                    });
                }
            }
        })
    });
}

/**
 * 新增用户
 */
$(function(){
    $("#user_save").click(function(){
        var uname = $("#new_uname"),
            password = $("#new_psw"),
            v = !1,
            para = {};
        var nu = $.trim(uname.val()),
            Nu = uname.attr("placeholder");
        if(nu === Nu && (nu = "")) return uname.focus(), setMsg(uname, "请输入用户名"), !1;
        setMsg(uname, ""), para.uname=nu, v=!0;
        var pn = $.trim(password.val()),
            N = password.attr("placeholder"),
            a = !1;
        if(pn === N && (pn = "")) return new_psw.focus(), setMsg(new_psw, "请输入新密码"), !1;
        setMsg(password, ""), para.password=pn, a=!0;

        saveUser(para), resetUser();
    })
})

function saveUser(para){
    $.ajax({
        type: "POST",
        url: baselocation + '/admin/user/update',
        data: para,
        dataType: "json",
        success: function(result){
            if(result.code == 1){
                layer.alert(result.message);
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

function resetUser(){
    $("#new_uname").val(""),
        $("#new_psw").val(""),
        $(".tipMsg").html("").hide();
}


$(function(){
    $("#user_cancel").click(function(){
        resetUser();
    })


})


/**
 * 修改用户角色
 */
$(function () {
    $("#user_modify").on('click', function(){
        var rid = $("#admin_role").val(),
            uid = $("#user_modify").attr("user-id"),
            r = {};
        r.rid = rid;
        r.uid = uid;
        $.ajax({
            type : 'post',
            dataType : 'json',
            data: r,
            url : baselocation + '/admin/user/modifyUser',
            success : function(result) {
                if (result.code == 1) {
                    layer.msg('修改成功!', {
                        icon : 1,
                        time : 1000
                    });
                } else {
                    layer.alert(result.message, {
                        icon : 2
                    });
                }
            }
        })
    })
})




/**
 *新建商品
 */
$(function() {
    $("#J_newProduct").on('click', function() {
        resetData();
        if ("object" != typeof $(this)) return !1;
        var b = $(this).offset().left - 15,
            c = $(this).offset().top,
            d = $(this).outerWidth() + 70;
        $(".address-edit-box").css({
            width : d,
            top : c,
            left : b
        }).show();
        var e = $(document).width(),
            f = $(document).height();
        $("#J_editAddrBackdrop").css({
            width : e,
            height : f
        }).show()
    })
})


/**
 * 点击保存商品
 */
$(function() {
    $("#Pro_save").click(function() {
        var c = $("#pname"),
            g = $("#description"),
            i = $("#price"),
            s = $("#amount"),
            z = $("#pid"),
            k = /^[1-9]+\d*$/,
            l = /^\d{6}$/,
            m = /^1[0-9]{10}$/,
            n = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/,
            o = /^\d+$/,
            p = /^[0-9a-zA-Z]+$/,
            q = /^[a-zA-Z\u4e00-\u9fa5]+$/,
            r = {},
            pc = {},
            v = !1;
        var t = $.trim(c.val()),
            u = c.attr("placeholder");
        if (t === u && (t = ""), !(strLen(t) >= 4)) return c.focus(), setMsg(c, "商品名称太短 (最小值为 2 个中文字)"), !1;
        setMsg(c, ""), r.pname = t, v = !0;
        var w = $.trim(i.val()),
            x = !1;
        a = !0;
        if (w === i.attr("placeholder") && (w = "")) return i.focus(), setMsg(i, "请填写商品价格"), !1;
        setMsg(i, ""), r.price = w, x = !0;
        var C = $.trim(g.val()).replace(/</g, "").replace(/>/g, "").replace(/\//g, "").replace(/\\/g, ""),
            D = g.attr("placeholder"),
            E = !1;
        if (C === D && (C = ""), !(C.length >= 5 && C.length <= 50)) return g.focus(), setMsg(g, "商品描述最少5个字，最多50个字"), !1;
        if (n.test(C) || o.test(C) || p.test(C)) return g.focus(), setMsg(g, "商品描述不正确"), !1;
        setMsg(g, ""), r.description = C, E = !0;

        var S = $.trim(s.val()),
            M = !1;
        if (S === s.attr("placeholder") && (S = "")) return s.focus(), setMsg(s, "请填写商品数量"), !1;
        setMsg(s, ""), r.amount = S, M = !0;

        var Z = $.trim(z.val());
        r.pid = Z;
        pc.pid = Z;

        var ca = $("#child_category").val();
        r.cid= ca;

        saveProduct(r), Close(), resetData();


    })
})


function saveProduct(r){
    if (r.pid== null || r.pid == "") {
        $.ajax({
            type: "POST",
            url: baselocation + '/admin/product/insert',
            data: r,
            dataType: "json",
            success: function (result) {
                if (result.code == 1) {
                    window.location.reload();
                } else {
                    layer.alert(result.message, {
                        icon: 2
                    });
                }
            }
        })
    }else{
        $.ajax({
            type: "POST",
            url: baselocation + '/admin/product/update',
            data: r,
            dataType: "json",
            success: function (result) {
                if (result.code == 1) {
                    window.location.reload();
                } else {
                    layer.alert(result.message, {
                        icon: 2
                    });
                }
            }
        })
    }
}

/**
 * 删除商品
 */
function product_delete(obj, data) {
    layer.confirm('确认要删除吗？', {
        btn : [ '确定', '取消' ]
    }, function() {
        $.ajax({
            type : 'delete',
            dataType : 'json',
            url : baselocation + '/admin/product/delete/' + data,
            success : function(result) {
                if (result.code == 1) {
                    $(obj).parent().parent("div").remove();
                    layer.msg('已删除!', {
                        icon : 1,
                        time : 1000
                    });
                } else {
                    layer.alert(result.message, {
                        icon : 2
                    });
                }
            }
        })
    });
}

/**
 *修改商品
 */
$(function() {
    $("#J_productModify").on('click', function() {
        resetData();
        var loc = new Location();
        var b = $(this).parent().parent(),
            c = b.attr("product-name"),
            d = b.attr("data-province_id"),
            e = b.attr("data-province_name"),
            f = b.attr("data-city_id"),
            g = b.attr("data-city_name"),
            h = b.attr("data-district_id"),
            i = b.attr("data-district_name"),
            j = b.attr("product-desc"),
            k = b.attr("product-amount"),
            l = b.attr("product-price"),
            m = b.attr("data-tag_name"),
            n = b.attr("product-id"),
            z = b.attr("product-cate");
        return $("#pname").val(c),
            $("#description").val(j),
            $("#user_tag").val(m),
            $("#amount").val(k),
            $("#price").val(l),
            $("#pid").val(n),
            $("#cid").val(z),
            $("#loc_province").find("option[value='" + d + "']").prop("selected", !0),
            $("#select2-chosen-1").html(e),
            loc.fillOption('loc_city', '0,' + d),
            $("#loc_city").find("option[value='" + f + "']").prop("selected", !0),
            $("#select2-chosen-2").html(g),
            loc.fillOption('loc_town', '0,' + d + ',' + f),
            $("#loc_town").find("option[value='" + h + "']").prop("selected", !0),
            $("#select2-chosen-3").html(i),
            Show(b), !1
    })
})


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

$(function() {
    $("#J_cancel").click(function() {
        $(".address-edit-box").hide(),
            $("#J_editAddrBackdrop").hide()
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

function Close() {
    $(".address-edit-box").hide(),
        $("#J_editAddrBackdrop").hide()
}

function resetData() {
    var loc = new Location();
    loc.fillOption('loc_province', '0');
    loc.fillOption('loc_city', '');
    loc.fillOption('loc_town', '');
        $("#pname").val(""),
        $("#price").val(""),
        $("#description").val(""),
        $("#amount").html(""),
        $(".tipMsg").html("").hide();
}

function Show(a) {
    if ("object" != typeof a) return !1;
    var b = a.offset().left - 15,
        c = a.offset().top,
        d = a.outerWidth() + 70;
    $(".address-edit-box").css({
        width : d,
        top : c,
        left : b
    }).show();
    var e = $(document).width(),
        f = $(document).height();
    $("#J_editAddrBackdrop").css({
        width : e,
        height : f
    }).show()
}

function strLen(a) {
    return a.replace(/[^\x00-\xff]/g, "**").length
}