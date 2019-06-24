$(function() {
	showLocation();
})

/**
 * 添加地址
 */
$(function() {
	$("#J_newAddress").on('click', function() {
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
 * 关闭添加地址栏
 */
$(function() {
	$("#J_cancel").click(function() {
		$(".address-edit-box").hide(),
		$("#J_editAddrBackdrop").hide()
	})
})


/**
 * 保存新密码
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


/**
 * 保存收货地址
 */
$(function() {
	$("#J_save").click(function() {
		var c = $("#uname"),
			g = $("#address"),
			i = $("#phone"),
			s = $("#addrid"),
			k = /^[1-9]+\d*$/,
			l = /^\d{6}$/,
			m = /^1[0-9]{10}$/,
			n = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/,
			o = /^\d+$/,
			p = /^[0-9a-zA-Z]+$/,
			q = /^[a-zA-Z\u4e00-\u9fa5]+$/,
			r = {},
			v = !1;
		var t = $.trim(c.val()),
			u = c.attr("placeholder");
		if (t === u && (t = ""), !(strLen(t) >= 4)) return c.focus(), setMsg(c, "收货人姓名太短 (最小值为 2 个中文字)"), !1;
		if (!q.test(t)) return c.focus(), setMsg(c, "收货人姓名不正确（只能是英文、汉字）"), !1;
		setMsg(c, ""), r.uname = t, v = !0;
		var w = $.trim(i.val()),
			x = !1;
		a = !0;
		if (w === i.attr("placeholder") && (w = ""), !(strLen(w) == 11)) return i.focus(), setMsg(i, "请填写11位手机号"), !1;
		if (a && w && w !== i.attr("placeholder") ? a = !1 : !a && w && w === i.attr("placeholder") ? i.attr("placeholder", "") : a || w || i.attr("placeholder", "11位手机号"), !a && w !== i.attr("placeholder") && !m.test(w)) return i.focus(), setMsg(i, "请填写11位手机号"), !1;
		setMsg(i, ""), r.phone = w, x = !0;
		var C = $.trim(g.val()).replace(/</g, "").replace(/>/g, "").replace(/\//g, "").replace(/\\/g, ""),
			D = g.attr("placeholder"),
			E = !1;
		if (C === D && (C = ""), !(C.length >= 5 && C.length <= 32)) return g.focus(), setMsg(g, "详细地址长度不对，最少5个字，最多32个字"), !1;
		if (n.test(C) || o.test(C) || p.test(C)) return g.focus(), setMsg(g, "详细地址不正确"), !1;
		setMsg(g, ""), r.address = C, E = !0;

		var S = $.trim(s.val());
		r.addrid = S;


		saveAddr(r), Close(), resetData();


	})
})

/**
 * 验证长度
 */
function strLen(a) {
	return a.replace(/[^\x00-\xff]/g, "**").length
}

/**
 * 显示错误信息
 */
function setMsg(a, b) {
	a && b ? a.siblings(".tipMsg").html(b).show() : a.siblings(".tipMsg").html("").hide()
}

/**
 * 关闭地址栏
 */
function Close() {
	$(".address-edit-box").hide(),
	$("#J_editAddrBackdrop").hide()
}

/**
 * 保存新密码
 */
function savePassword(re){
	$.ajax({
		type: "POST",
		url: baselocation + '/uc/user/info/update',
		data: re,
		dataType: "json",
		success: function(result){
			if(result.code == 1){
				layer.alert(result.message);
				window.location.href = '/shop_war_exploded/login';
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


/**
 * 保存收货地址
 */
function saveAddr(a) {
    //新增 和 修改
    console.log(a);
    if (a.addrid == null || a.addrid == "") {
        $.ajax({
            type: "POST",
            url: baselocation + '/uc/user/address/insert',
            data: a,
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
    } else {
        $.ajax({
            type: "POST",
            url: baselocation + '/uc/user/address/update',
            data: a,
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
 * 删除收货地址
 */
function address_delete(obj, data) {
	layer.confirm('确认要删除吗？', {
		btn : [ '确定', '取消' ]
	}, function() {
		$.ajax({
			type : 'delete',
			dataType : 'json',
			url : baselocation + '/uc/user/address/' + data,
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
*打开地址栏
*/
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

/**
*修改收货地址
*/
$(function() {
	$("#J_addressModify").on('click', function() {
		resetData();
		var loc = new Location();
		var b = $(this).parent().parent(),
			c = b.attr("data-consignee"),
			d = b.attr("data-province_id"),
			e = b.attr("data-province_name"),
			f = b.attr("data-city_id"),
			g = b.attr("data-city_name"),
			h = b.attr("data-district_id"),
			i = b.attr("data-district_name"),
			j = b.attr("data-address"),
			k = b.attr("data-zipcode"),
			l = b.attr("data-tel"),
			m = b.attr("data-tag_name"),
			n = b.attr("data-address_id");
		return $("#user_name").val(c),
			$("#user_adress").val(j),
			$("#user_tag").val(m),
			$("#user_zipcode").val(k),
			$("#user_phone").val(l),
			$("#address_id").val(n),
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
 * 重置收货地址
 */
function resetData() {
	var loc = new Location();
	loc.fillOption('loc_province', '0');
	loc.fillOption('loc_city', '');
	loc.fillOption('loc_town', '');
	$("#uname").val(""),
	$("#address").val(""),
	$("#phone").val("").attr("placeholder", "11位手机号"),
	$("#addrid").html(""),
	$(".tipMsg").html("").hide();
}

function resetPass(){
	$("#password").val(""),
		$("#password_new").val(""),
	$(".tipMsg").html("").hide();
}