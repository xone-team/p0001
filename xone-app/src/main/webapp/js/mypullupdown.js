/**
 * Version: 1.0
 * Author: hunny【胡泽雄】
 * Email: huxiong888@163.com
 * Licence: Open Source MIT Licence
 */
(function($){
	$.fn.mypullupdown = function (options) {
		var defaults = {// setup default settings
			url: '',
			data: '',
			onDown: function() {
				return {};
			},
			onUp: function(){
				return {};
			},
			down: function() {},
			up: function() {},
			downed: function() {}, 
			uped: function() {}
		}, s = $.extend({}, defaults, options);// This makes it so the users custom options overrides the default ones
		return this.each(function() {
			var it = $(this);
			if (!it.data('iscrollbinding')) {
				it.bind({
			        "iscroll_onpulldown" : pullDown,
			        "iscroll_onpullup"   : pullUp,
			        "iscroll_onpulluppulled": s.downed,
			        "iscroll_onpullupreset": s.uped
		        });
			}
			it.data('iscrollbinding', true);
			function pullDown() {
				var data = {
						'_': new Date().getTime()
					};
				data = $.extend({}, data, s.onDown());
				loadData('prepend', s, data);
			}
			function pullUp() {
				var data = {
						'_':new Date().getTime()
					};
				data = $.extend({}, data, s.onUp());
				loadData('appand', s, data);
			}
			function loadData(insertType, s, data) {
				$.ajax({
					type: 'GET',
					url: s.url,
					data: data,
					insertType: insertType,
					options: s,
					success: function(html) {
						if (this.insertType == 'prepend') {
							this.options.down(html);
						} else {
							this.options.up(html);
						}
					}
				});
			}
			return this;
		});
	};
})(jQuery);