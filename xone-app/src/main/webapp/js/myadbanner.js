/**
 * Version: 1.0
 * Author: hunny【胡泽雄】
 * Email: huxiong888@163.com
 * Licence: Open Source MIT Licence
 */
(function($){
	$.fn.myadbanner = function (options) {
		var defaults = {// setup default settings
			url: '',
			data: '',
			bannerClass: 'ui-mybanner'
		}, s = $.extend({}, defaults, options);// This makes it so the users custom options overrides the default ones
		doAdBannerRequest();
		function doAdBannerRequest() {
			$.fn.myadbanner.requestData({
				url: s.url,
				data: s.data,
				handler: function(html) {
					if ($.trim(html).length != 0) {
						activeHtmlHandler(html);
					}
				}
			});
		}
		$(document).bind("pageshow", function(event) {
//			testEvent();
			var info = activePageInfo();
//			console.log('At:' + new Date() + ' info banner page:' + info.page.attr('data-url'));
			if (!info.banner.data('loaded')) {
				if ($('body').data('myadbanner')) {
//					console.log('At:' + new Date() + ' execute activeHtmlHandler');
					activeHtmlHandler($('body').data('myadbanner'));
				} else {
//					console.log('At:' + new Date() + ' execute doAdBannerRequest');
					doAdBannerRequest();
				}
			}
//			var banner = $('div.' + s.bannerClass);
//			banner.html(banner.length + ' At: ' + new Date() + ', page-role' + $('div.ui-page-active[data-role="page"]').length);
	    });
		function activeHtmlHandler(html) {
			var info = activePageInfo();
			if (!info.banner.data('loaded')) {
				$('body').data('myadbanner', html);
//				console.log('At:' + new Date() + ' inner activeHtmlHandler, handler page:' + info.page.attr('data-url') + ', banner len:' + info.banner.length);
				info.banner.html(html);
//				console.log('At:' + new Date() + ' inner activeHtmlHandler, append html to banner:' + html);
				var lis = info.banner.find('li.ui-mybanner-link');
				if (lis.length >= 1) {
					info.banner.show().data('loaded', true);
					var i = Math.round(Math.random() * 10) % lis.length;
					rollbanner(info, i);
					info.header.fixedtoolbar('updatePagePadding');
				}
			}
		}
		function rollbanner(info, i) {
			var t = info.banner.find('li.ui-mybanner-link:eq(' + i + ')');
//			console.log('At:' + new Date() + ' link:' + t.html());
//			resizeImage(info.banner.height(), info.page.width(), t.find('img'));
			info.banner.find('li.ui-mybanner-link').hide();
			t.show('slow');
		}
		function activePageInfo() {
			var activePage = $.mobile.activePage;//$('div.ui-page-active[data-role="page"]');//
			var activeHeader = activePage.find('div[data-role="header"]');
			var activeBanner = activeHeader.find('div.' + s.bannerClass);
			if (activeBanner.length == 0) {
				activeHeader.append('<div class="' + s.bannerClass + '" style="display:none;">&nbsp;</div>');
				activeBanner = activeHeader.find('div.' + s.bannerClass);
				activeBanner.hide();
			}
			return {
				page: activePage,
				header: activeHeader,
				banner: activeBanner
			}
		}
//		function resizeImage(sh, sw, img) {
//			var t = new Image();
//		    t.src = img.attr('src');
//		    t.onreadystatechange = function() {
//		    	if (t.readState == 'complete') {
//				    if (parseInt(t.height, 10) > parseInt(sh, 10)) {
//				    	img.css({height: sh + 'px'});
//				    	img.attr('height', sh + 'px');
//				    }
//				    if (parseInt(t.width, 10) > parseInt(sw, 10)) {
//				    	img.css({width: sw + 'px'});
//				    	img.attr('width', sw + 'px');
//				    }
//				    var fileSize = Math.ceil(t.fileSize / 1024);
//				    console('<div> resize image src=' + img.attr('src') + ' height:' + t.height + ', width' + t.width + ', fileSize:' + fileSize + 'k</div>');
//		    	}
//		    }
//		}
//		function testEvent() {
//			$.ajax({
//				type: 'GET',
//				url: s.testUrl,
//				data: s.data,
//				success: function(html) {
//				}
//			});
//		}
		return this.each(function() {
			var it = $(this);
			return this;
		});
	};
	$.fn.myadbanner.requestData = function(s) {
		$.ajax({
			type: 'GET',
			url: s.url,
			data: s.data,
			handler: s.handler,
			success: function(html) {
				this.handler(html);
			}
		});
	}
})(jQuery);