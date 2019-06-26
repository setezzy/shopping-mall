/**
 * 地址选择
 */
$(function() {
	$(".J_addressItem").on("click", function() {
		$(this).addClass("selected").siblings().removeClass("selected");
		var b = $(this),
			c = b.attr("data-consignee"),
			e = b.attr("data-province_name"),
			g = b.attr("data-city_name"),
			i = b.attr("data-district_name"),
			j = b.attr("data-address"),
			k = b.attr("data-zipcode"),
			l = b.attr("data-tel"),
			m = b.attr("data-tag_name"),
			n = b.attr("data-address_id");
		var html = '<div class="seleced-address" id="J_confirmAddress">' + c + '&nbsp;&nbsp;' + l + '<br>'
			+  j + '&nbsp;&nbsp;';
		$(".section-bar").find(".fl:first-child").html(html);
	})
})


/**
 * 选择送货时间
 */
$(function() {
	$(".section-time .J_option").on("click", function() {
		$(this).addClass("selected").siblings().removeClass("selected");
	})
})



/**
 * 去结算
 */
$(function() {
	$("#J_checkoutToPay").on("click", function() {
		var b = $("#J_addressList").find(".selected").length;
		if (0 >= b) {
			layer.alert("请选择地址！", {
				icon : 2
			});
			return !1;
		}

		var params = {};

		params.addrid = $("#J_addressList").find(".selected").attr('data-address_id');
		/*
		params.payType = $(".section-payment").find(".selected").attr('data-value');
		params.shipmentType = $(".section-shipment").find(".selected").attr('data-value');
		params.shipmentAmount = $(".section-shipment").find(".selected").attr('data-amount');
		params.shipmentTime = $(".section-time").find(".selected").attr('data-value');
		params.invoiceType = $(".section-invoice").find(".selected").attr('data-value');
		params.invoiceTitle = $("#invoice_title").val();
		 */
		console.log(params);
		$.ajax({
			url : baselocation + '/buy/confirm',
			type : 'post',
			dataType : 'json',
			data : params,
			success : function(result) {
				if (result.code == true) {
					window.location.href = baselocation + '/buy/confirm/' + result.message;
				} else {
					layer.alert(result.message, {
						icon : 2
					});
				}
			}
		});
	})
})

/**
 * 导航分类栏显示及颜色变换
 */
$(function() {
	$('#J_navCategory').mouseover(function() {
		$('.site-category').css('display', 'block');
	})
	$('#J_navCategory').mouseout(function() {
		$('.site-category').css('display', 'none');
	})
});