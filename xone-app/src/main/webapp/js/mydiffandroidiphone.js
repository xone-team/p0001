/**
 * Version: 1.0
 * android和iphone兼容的函数
 * Author: hunny【胡泽雄】
 * Email: huxiong888@163.com
 * Licence: Open Source MIT Licence
 */
(function($) {
	$.extend({
		myAlert: function(msg) {
			if (isIphone()) {
				callClientAlertView(msg, '1', '消息提示', '');
			} else {
				alert(msg);
			}
		},
		myConfirm: function(msg, callback) {
			if (isIphone()) {
				callClientAlertView(msg, '0', '确认', callback);
			} else {
				if (confirm(msg)) {
					callback();
				}
			}
		},
		rockRoll: function (params) {
			if (isIphone()) {
				window.location.href= "http://callClient/rockRoll?id=" + params;
			} else {
				try {
			    	window.main.rockRoll(params);
		    	} catch (e) {}
			}
		},
		mloginValue: function(callback) {
			if (isIphone()) {
				$('body').unbind('mloginiphone');
				$('body').bind('mloginiphone', function(e, v) {
					callback(v);
					$('body').unbind('mloginiphone');
				});
				window.location.href= "http://callClient/mloginValue";
			} else {
				try {
					callback(window.main.mloginValue());
		    	} catch (e) {}
			}
		}
	});
	$.fn.myImageUploded = function(options) {
		var defaults = {
			complete: function() {},
			filenotmatch: function() {return false},
			load: function() {}
		};
		defaults.selector = $(this).selector;
		var opt = $.extend({}, defaults, options);
		return this.each(function() {
			var $this = $(this);
			if (isIphone()) {//iPhone部分功能
				$this.bind('imagecomplete', function() {
					if ($.isFunction(opt.complete)) {
						opt.complete();
					}
					var base64 = $(opt.selector).data('base64');
					var imgType = $this.data('imageType');
					var m = imgType.match(/(png|jpeg|jpg|gif)$/i);
					if (null == m) {
						if ($.isFunction(opt.filenotmatch)) {
							opt.filenotmatch();
						}
						return;
					}
					opt.load(base64, imgType);
				});
				$this.bind('click', iphoneFileSelect);
				return;
			}
			//android部分功能
			$this.fileupload({
				complete: function() {
					if ($.isFunction(opt.complete)) {
						opt.complete();
					}
				},
				filenotmatch: function() {
					opt.filenotmatch();
				},
				onload:function(it, e) {
					opt.load(it.data('base64source'), it.data('imageType'));
				}
			});
		});
		function iphoneFileSelect() {
			window.location.href="http://callClient/selectImageFromPhotoLibrary?fromType=3&selector=" + encodeURIComponent(opt.selector);
		}
	}
	function isIphone(){
		if (/\((iPhone|iPod|iPad)/i.test(navigator.userAgent)) {  
			return true;
		}
		return false;
	}
	/*
	 * 弹出框
	 * 参数说明：
	 *	popType:弹出框类型      popType ＝  “1” 为一个按钮的弹出框（确定按钮）， popType ＝  “0” 为二个按钮的弹出框（确定和取消按钮）
	 *	title: 弹出框标题
	 *	message: 弹出框信息
	 *	jsCode: 弹出框弹出后回调函数
	 **/
	function callClientAlertView(message, popType, title, jsCode){
		$('body').unbind('iphoneconfirm');
		$('body').bind('iphoneconfirm', function(e, type) {
			if (type == '1' && $.isFunction(jsCode)) {
				jsCode();
				return;
			}
			$('body').unbind('iphoneconfirm');
		});
		window.location.href = "http://callClient/showAlert?popType="+popType+"&title="+title+"&message="+message;
	}
})(jQuery);