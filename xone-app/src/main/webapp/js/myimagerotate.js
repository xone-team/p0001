(function($) {
	//插件的默认值
	var defaults = {
		init: false,
		maxHeight: 100,
		maxWidth: 100,
		canvascomplete: function(event, image, canvas) {
			var $this = $(image);
			var imageType = $.getImageTypeByHtmlImage(image);
			var base64 = canvas.toDataURL(imageType);
			var imgid = $this.data('imageid');
			img = document.getElementById(imgid);
			if (null == img) {
				img = $this.data('image');
				var div = document.createElement('div');
				div.style.border = '1px solid green';
				div.style.width = '100%';
				img.setAttribute('width', 100);
				img.setAttribute('height', 100);
				div.appendChild(img);
				image.parentNode.appendChild(div);
				$this.hide();
			}
			img.src = base64;
		},
		initimage: function(id) {
			var img = document.getElementById(id);
			if (null == img) {
				img = document.createElement('img');
				img.setAttribute('id', id);
			}
			return img;
		}
	};
	//定义插件
	$.fn.myxoneimage = function(options) {
		var opts = $.extend({}, defaults, options);
		return this.each(function() {
			var tagName = this.tagName.toLowerCase();
			if ('img' != tagName) {
				return;
			}
			var $this = $(this);
			$this.parent().append('<span class="mypicloading">图片加载中，请稍候...</span>');
			preImage(this,  function() {
				if (!$this.data('initcompleted')) {
					if ($.isFunction(opts.canvascomplete)) {
						$this.bind('canvascomplete', function(event, image, canvas) {
							opts.canvascomplete(event, image, canvas);
						});
					}
					$this.bind('imagerotate', function(event) {
						myrotate($this.get(0));
					});
					init(this, opts);
					$this.data('initcompleted', true);
					if (opts.init) {
						$this.trigger('imagerotate');
					}
					$this.parent().find('span.mypicloading').remove();
				}
			});
		});
	};
	function preImage(image, callback) {
		image.src = image.src;
		//如果图片已经存在于浏览器缓存，直接调用回调函数 
		if (image.complete) {
			callback.call(image);
			return;//直接返回，不用再处理onload事件
		}
		 //图片下载完毕时异步调用callback函数。  
		image.onload = function() {
			callback.call(image);//将回调函数的this替换为Image对象  
		};
	}
	function init(image, opts) {
		$this = $(image);
		var identify = new Date().getTime();
		$this.attr('width', $this.width());
		$this.attr('height', $this.height());
		$this.data('width', $this.width());
		$this.data('height', $this.height());
		$this.data('maxWidth', opts.maxWidth);
		$this.data('maxHeight', opts.maxHeight);
		$this.data('imageid', 'image_' + identify);
		$this.data('canvasid', 'canvas_' + identify);
		$this.data('image', opts.initimage($this.data('imageid')));
		$this.data('canvas', initCanvasElements($this.data('canvasid')));
	}
	function initCanvasElements(id) {
		var canvas = document.getElementById(id);
		if (canvas == null) {
			canvas = document.createElement('canvas'); 
			canvas.setAttribute("id", id);
		}
		return canvas;
	}
	function rotateImage(image, angle) {
		var param = {
			x: 0,
			y: 0
		};
		if (0 == angle) {
			param = $.extend({}, param, {
				x: 0,
				y: 0
			});
		} else if (90 == angle) {
			param = $.extend({}, param, {
				x: 0,
				y: -1
			});
		} 
		else if (180 == angle) {
			param = $.extend({}, param, {
				x: -1,
				y: -1
			});
		} else if (270 == angle) {
			param = $.extend({}, param, {
				x: -1,
				y: 0
			});
		}
		var $image = $(image);
		var canvas = $image.data('canvas');
		var context = canvas.getContext('2d');
		var maxWidth = $image.data('maxWidth');
		var maxHeight = $image.data('maxHeight');
		var width = image.width;
		var height = image.height;
		var scaleX = 1;
		if (width > maxWidth)  {
			scaleX = (maxWidth / width);
			width = maxWidth;
		} 
		var scaleY = 1;
		if (height > maxHeight) { 
			scaleY = (maxHeight / height);
			height = maxHeight;
		}
		var n = image.getAttribute('step');
		if (null == n) {
			n = 0;
		}
		if (n % 2 == 0) {
			canvas.setAttribute('width', width); 
			canvas.setAttribute('height', height); 
			context.scale(scaleX, scaleY);
		} else {
			canvas.setAttribute('width', height); 
			canvas.setAttribute('height', width); 
			context.scale(scaleY, scaleX);
		}
		context.rotate(angle * Math.PI / 180); 
		context.drawImage(image, image.width * param.x, image.height * param.y);
		context.save();
		$image.trigger('canvascomplete', [image, canvas]);
	}
	function myrotate(image) {
		var n = image.getAttribute('step');
		if (null == n || n > 3) {
			n = 0;
		}
		rotateImage(image, n * 90);
		n++;
		image.setAttribute('step', n);
	}
	$.extend({
		getImageTypeByHtmlImage: function(img) {
			var src = img.src;
			if (/^data:image\/(\w*);base64,.*/.test(src)) {
				src = src.substring(0, 40);
				var m = src.match(/^data:image\/(\w*);base64,.*/);
				return 'image/' + m[1].toLowerCase();
			}
			if (/.*\.(\w*)$/.test(src)) {
				var m = src.match(/.*\.(\w*)$/);
				return 'image/' + m[1].toLowerCase();
			}
			return 'image/png';
		},
		myImagePart: function(opt) {
			var div = document.createElement('div');
			div.innerHTML = [
			    '<div class="mybuttonarea" data-role="controlgroup" data-mini="true" data-type="horizontal" align="right">',
				'<a href="#" class="rotateImage" data-role="button" data-theme="b" data-icon="forward" title="旋转图片">旋转图片</a>',
				'<a href="#" class="removeImage" data-role="button" data-theme="b" data-icon="delete" title="删除图片">删除图片</a>',
				'</div><div class="', opt.imgClassName, 'div">',
				'<img class="', opt.imgClassName, '" src="', opt.base64, '" title="', 'upload image', '"/>',
				'<input type="hidden" name="images" value="', opt.base64, '" /></div>' ].join('');
			var $div = $(div);
			$div.find('a.rotateImage').bind('click', function(e) {
				e.preventDefault();
				$(e.target).closest('li').find('img.' + opt.imgClassName).trigger('imagerotate');
				return false;
			});
			$div.find('a.removeImage').bind('click', function(e) {
				opt.removeImage(e);
			});
			return $div;
		}
	});
	//闭包结束
})(jQuery);