jQuery.fn.serializeObject = function()
{
    var o = {};
    var a = this.serializeArray();
    jQuery.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

window.XONE = {};
(function(X){
	X.log = function(e){
		if(console && console.log)
			console.log(e);
	};
	X.null2blank = function(o){
	    return o == null ? "" : o;
	}
	X.getContextPath = function() {
		if(X.contextPath != null) 
			return X.contextPath;
	    var base = document.getElementsByTagName('base')[0];
	    if (base && base.href && (base.href.length > 0)) {
	        base = base.href;
	    } else {
	        base = document.URL;
	    }
	    X.contextPath = base.substr(0,
	        base.indexOf("/", base.indexOf("/", base.indexOf("//") + 2) + 1));
	    return X.contextPath;
	};
	X.contextPath = X.getContextPath();
    X.ajax = function(config){
        if(config.url != null){
            config.url = X.contextPath + config.url;
        }
        if(config.dataType == null){
            config.dataType = "JSON";
        }
        if(config.error == null){
            config.error = function(jqXHR, textStatus, errorThrown) {
                X.log("error getJson from url ["+config.url+"].");
            }
        }
        return jQuery.ajax(config);
    };  
    X.getJson = function(url){
        var result = null;
        jQuery.ajax({
            url : X.contextPath + url,
            type : "GET",
            dataType : "JSON",
            async: false,
            success : function(data, textStatus, jqXHR){
                result = data;
            },
            error : function(jqXHR, textStatus, errorThrown) {
                X.log("error getJson from url ["+url+"].");
            }
        });
        return result;
    };
	X.getHtml = function(url){
		var result = null;
	    jQuery.ajax({
	        url : X.contextPath + url,
	        type : "GET",
	        dataType: "html",
	        async: false,
	        success : function(data, textStatus, jqXHR){
	        	result = data;
	        },
	        error : function(jqXHR, textStatus, errorThrown) {
	        	X.log("error getHtml from url ["+url+"].");
	        }
	    });
	    return result;
	};
	
	
	X.initConsoleMenu = function(activeMenuCode){
		jQuery("body").prepend(XONE.getHtml("/common/top.html.section"));
		jQuery("#X_bodyContainer").prepend(XONE.getHtml("/common/left-nav.html.section"));
		jQuery("#X_contentContainer").prepend(XONE.getHtml("/common/breadcrumbs.html.section"));
		jQuery("body").append(XONE.getHtml("/common/footer.html.section"));
		var menus = XONE.getJson("/common/menus.json");
		var mc = jQuery("#X_menu_container");
		var activeMenu = null;
		for(var i = 0; i < menus.menus.length; i++){
			var m = menus.menus[i];
			// first grade
			if(m.parent == null && m.link == null){
				var h = "";
				h += '<div class="accordion-group">';
				h += '	<div class="accordion-heading">';
				h += '		<div class="accordion-toggle nav-header" data-toggle="collapse"';
				h += '			data-target="#X_menu_collapse_'+m.code+'">'+m.name+'</div>';
				h += '	</div>';
				h += '	<div id="X_menu_collapse_'+m.code+'" class="accordion-body collapse">';
				h += '		<div class="accordion-inner">';
				h += '			<ul class="nav nav-list" id="X_menu_ul_'+m.code+'">';
				h += '			</ul>';
				h += '		</div>';
				h += '	</div>';
				h += '</div>';
				mc.append(h);
			}
			if(m.parent != null){
				var menuUl = jQuery("#X_menu_ul_"+m.parent);
				var h = "";
				h += '<li id="X_menu_li_'+m.code+'"><a href="'+m.link+'">'+m.name+'</a></li>';
				menuUl.append(h);
			}
			if(m.parent == null && m.link != null){
				var h = "";
				h += '<div>';
				h += '	<ul class="nav nav-list">';
				h += '		<li id="X_menu_li_'+m.code+'"><a href="'+m.link+'">'+m.name+'</a></li>';
				h += '	</ul>';
				h += '</div>';
				mc.append(h);
			}
			if(activeMenuCode == m.code){
				activeMenu = m;
			}
		}
		var breadcrumbsHtml = "";
		breadcrumbsHtml += '<li>后台 <span class="divider">/</span></li>';
		if(activeMenu != null){
			jQuery("#X_menu_li_"+activeMenu.code).addClass("active");
			var t = "后台";
			if(activeMenu.parent != null){
				var activeParent = null;
				for(var i = 0; i < menus.menus.length; i++){
					var m = menus.menus[i];
					if(m.code == activeMenu.parent){
						activeParent = m;
						break;
					}
				}
				if(activeParent != null){
					t += " - " + activeParent.name;
					breadcrumbsHtml += '<li>'+activeParent.name+' <span class="divider">/</span></li>';
				}
				
			}
			t += " - " + activeMenu.name;
			breadcrumbsHtml += '<li class="active">'+activeMenu.name+'</li>';
			jQuery("title").text(t);
		}
		jQuery("#X_breadcrumbs_ul").html(breadcrumbsHtml);
		
		jQuery(".collapse").collapse();
	};
	
	X.initModal = function(modalName){
		jQuery("body").append(XONE.getHtml("/common/modal-"+modalName+".html.section"));
	};
})(window.XONE);
