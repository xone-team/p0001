/**
 * Version: 1.0
 * Author: hunny【胡泽雄】
 * Email: huxiong888@163.com
 * Licence: Open Source MIT Licence
 */
(function($){
	$.fn.fileupload = function (options) {
		var defaults = {// setup default settings
			onload: function() {
			}
		}, s = $.extend({}, defaults, options);// This makes it so the users custom options overrides the default ones
		function getExtName(v) {
			var a = v.split('.');
			return a[a.length - 1];
		}
		function handleFileSelect(evt) {
			var files = evt.target.files;
			for (var i = 0, f; f = files[i]; i++) {
				var reader = new FileReader();
				reader.onload = (function(theFile) {
					return function(e) {
						var name = getExtName(theFile.name);
						var result = e.target.result.replace(/data:base64,/, 'data:image/' + name + ';base64,');
						var $it = $(evt.target);
						$it.data('uploadfilename', escape(theFile.name));
						$it.data('base64source', result);
						//alert($it.data('uploadfilename'));
						s.onload($it, e);
					};
				})(f);
				reader.onerror = function(evt) {
					switch (evt.target.error.code) {
					case evt.target.error.NOT_FOUND_ERR:
						alert('File Not Found!');
						break;
					case evt.target.error.NOT_READABLE_ERR:
						alert('File is not readable');
						break;
					case evt.target.error.ABORT_ERR:
						break; // noop
					default:
						alert('An error occurred reading this file.');
					};
				};
				reader.onabort = function(e) {
					alert('File read cancelled');
				};
				reader.onloadstart = function(e) {

				};
				// Read in the image file as a data URL.
				reader.readAsDataURL(f);
			}
		}
		return this.each(function() {
			$(this).bind('change', handleFileSelect);
			return this;
		});
	};
})(jQuery);