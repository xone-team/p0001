/**
 * Version: 1.0
 * Author: hunny【胡泽雄】
 * Email: huxiong888@163.com
 * Licence: Open Source MIT Licence
 */
(function($){
	$.fn.myallcheckbox = function (options) {
		var defaults = {
			allcheckvalue: ''
		}, s = $.extend({}, defaults, options);
		return this.each(function() {
			var tagName = this.tagName.toLowerCase();
			if ('input' != tagName) {
				return;
			}
			if ('checkbox' != this.type.toLowerCase()) {
				return;
			}
			var $this = $(this);
			$this.bind('click', function() {
				$this.attr('checked', ($this.attr('checked') == undefined ? true : false));
				checkAll($this);
			});
		});
		function checkAll(t) {
			var name = t.attr('name');
			if (t.val() == s.allcheckvalue) {
				var checked = (t.attr('checked') == undefined ? false : true);
				$('input[type="checkbox"][name="' + name + '"][value!=""]').each(function() {
					var mycheckbox = $(this);
					mycheckbox.attr('checked', checked);
					jqcheck(mycheckbox);
				});
				return;
			}
			var all = '';
			var allcheck = 0;
			var checked = 0;
			$('input[type="checkbox"][name="' + name + '"]').each(function() {
				var $m = $(this);
				if ($m.val() != '') {
					allcheck ++;
					if ($m.attr('checked')) {
						checked ++;
					}
				} else {
					all = $(this);
				}
			});
			if (allcheck != 0 && allcheck == checked) {
				all.attr('checked', true);
			} else {
				all.attr('checked', false);
			}
			jqcheck(all);
		}
		function jqcheck(t) {
			var pdiv = t.closest('div.ui-checkbox');
			var checked = t.attr('checked') == undefined ? false : true;
			var label = pdiv.find('label:first');
			var onoff = (checked ? 'checkbox-on' : 'checkbox-off');
			label.attr('data-icon', onoff);
			label.removeClass('ui-checkbox-on').removeClass('ui-checkbox-off').addClass('ui-' + onoff);
			label.find('span.ui-icon:first').removeClass('ui-icon-checkbox-off').removeClass('ui-icon-checkbox-on').addClass('ui-icon-' + onoff);
		}
	};
})(jQuery);