(function($) {
	//定义插件
	$.fn.myimagerotate = function(options) {
		var opts = $.extend({}, $.fn.myimagerotate.defaults, options);
		return this.each(function() {
			var tagName = this.tagName.toLowerCase();
			if ('img' != tagName) {
				return;
			}
			var $this = $(this);
			if ($this.data('canvas')) {//已经执行过，不需要再执行
				return;
			}
			preImage(this,  function() {
				var width = $this.width();
				if ($(window).width() < width) {
					width = $(window).width();
				}
				var height = $this.height();
				if ($(window).height() < height) {
					height = width;
				}
				$this.attr('width', width);
				$this.attr('height', height);
				//var elements = initElements(this);
				//$this.data('button',  elements.button);
				//$this.data('canvas',  elements.canvas);
			});
		});
	};
	//插件的默认值
	$.fn.myimagerotate.defaults = {
	};
	function initElements(image) {
		var identify = new Date().getTime();
		var button = initButton({
			id: 'button' + identify, name: 'rotate', value: 'Rotate', 
			clickevent: function() {
				myrotate(image);
			}
		});
		var div = initDivElement();
		div.appendChild(button);
		button = initButton({
			id: 'toDataURL' + identify, name: 'toDataURL', value: 'toDataURL', 
			clickevent: function() {
				var canvas = $(image).data('canvas');
				alert(canvas.toDataURL("image/png").replace("image/png", "image/octet-stream"));
			}
		});
		div.appendChild(button);
		image.parentNode.appendChild(div);
		var canvasId = 'canvas' +  identify;
		var canvas = document.getElementById(canvasId); 
		if (canvas == null) { 
			image.style.visibility = 'hidden'; 
			image.style.position = 'absolute'; 
			canvas = document.createElement('canvas'); 
			canvas.setAttribute("id", canvasId); 
			div = initDivElement();
			div.appendChild(canvas);
			image.parentNode.appendChild(div);
		}
		initImage(canvas, image);
		return {
			button: button,
			canvas : canvas
		};
	}
	function initButton(param) {
		var d = new Date().getTime();
		var opt = $.extend({}, {
			id : d, name: d, value: d, clickevent: null
		}, param);
		var button = document.createElement('input');
		button.setAttribute('type', 'button');
		button.setAttribute('id', 'button' + opt.id);
		button.name = opt.name;
		button.value = opt.value;
		if (null != opt.clickevent) {
			button.addEventListener('click', opt.clickevent);
		}
		return button;
	}
	function initDivElement() {
		var div = document.createElement('div');
		div.style.border = '1px solid green';
		div.style.width = '100%';
		return div;
	}
	function initImage(canvas, image) {
		var canvasContext = canvas.getContext('2d');
		canvas.setAttribute('width', image.width); 
		canvas.setAttribute('height', image.height); 
		canvasContext.rotate(0 * Math.PI / 180); 
		canvasContext.drawImage(image, 0, 0);
		canvasContext.save();
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
		} else if (180 == angle) {
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
		var c = $(image).data('canvas');
		var canvasContext = c.getContext('2d');
		c.setAttribute('width', image.width); 
		c.setAttribute('height', image.height); 
		canvasContext.rotate(angle * Math.PI / 180); 
		canvasContext.drawImage(image, image.width * param.x, image.height * param.y);
		canvasContext.save();
	}
	function myrotate(image) {
		var n = image.getAttribute('step');
		if (null == n) {
			n = 0;
		}
		(n == 3) ? n = 0 : n ++;
		image.setAttribute('step', n);
		rotateImage(image, n * 90);
	}
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
	//闭包结束
})(jQuery);