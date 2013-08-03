'jQuery.fn.serializeObject = function()
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
		jQuery("body").append(X.getHtml("/common/modal-"+modalName+".html.section"));
	};
	
    
	X.queryAction = function(queryUrl, renderRow, handleElValues, handleElValidation, listBody, prefix, container){
        if(queryUrl == null){
            X.log("Method[queryAction] queryUrl is null");
            return;
        }
        if(renderRow == null){
            X.log("Method[queryAction] renderRow is null");
            return;
        }
            
        if(listBody == null)
            listBody = jQuery("#tbodyList");
        if(prefix == null)
            prefix = "q.";
        if(container == null)
            container = jQuery("#queryForm");
        
        var d = container.serializeObject();
        X.ajax({
            url : queryUrl,
            type : "POST",
            data : d,
            success : function(data, textStatus, jqXHR) {
                if(data == null)
                    return;
                var list = data.list;
                var html = "";
                if(list != null && list.length != null){
                    for ( var i = 0; i < list.length; i++) {
                        html += renderRow(i, list[i]);
                    }
                }
                listBody.html(html);
                
                var formData = data.q;
                if(formData != null){
                    X.renderFormValues(formData, handleElValues, prefix, container);
                }
            }
        });
    }
    
	X.renderFormValues = function(formData, handleEl, prefix, container){
        if(formData == null)
            return;
        
        if(prefix == null)
            prefix = "f.";
        if(container == null)
            container = jQuery("#inputForm");
        
        for(var fieldName in formData){
            var value = formData[fieldName];
            if(handleEl != null){
                handleEl.call(this, (prefix+fieldName), container);
            }else{
                var inputEl = jQuery('input[name="'+prefix+fieldName+'"]', container); 
                if(inputEl.size() > 1 && value != null){
                    inputEl.val(value); 
                }
            }
        }
    }
	
    X.getAction = function(getUrl, handleElValues, handleElValidation, prefix, container) {
        if(getUrl == null){
            XONE.log("Method[initInputForm] getUrl is missing.");
            return;
        }
        
        if(prefix == null)
            prefix = "f.";
        if(container == null)
            container = jQuery("#inputForm");
        
        XONE.ajax({
            url : getUrl,
            type : "POST",
            data : jQuery.url().param(),
            success : function(data, textStatus, jqXHR) {
                if (data == null)
                    return;
                var formData = data.o;
                var vc = data.validationContext;
                XONE.renderFormValues(formData, handleElValues, prefix, container);
                XONE.renderValidation(validationContext, handleElValidation, prefix, container);
            }
        });
    }
    
    
    X.saveAction = function(saveUrl, handleElValues, handleElValidation, prefix, container) {
        if(saveUrl == null){
            XONE.log("Method[saveUrl] getUrl is missing.");
            return;
        }
        
        if(prefix == null)
            prefix = "f.";
        if(container == null)
            container = jQuery("#inputForm");
        
        var d = container.serializeObject();
        XONE.ajax({
            url : saveUrl,
            type : "POST",
            data : d,
            success : function(data, textStatus, jqXHR) {
                if (data == null)
                    return;
                var formData = data.o;
                var vc = data.validationContext;
                XONE.renderFormValues(formData, handleElValues, prefix, container);
                XONE.renderValidation(validationContext, handleElValidation, prefix, container);
            }
        })
    }
    
    X.renderValidation = function(validationContext, handleEl, prefix, container) {
        if(validationContext == null)
            return;
        
        if(prefix == null)
            prefix = "f.";
        if(container == null)
            container = jQuery("#inputForm");
        
        if(validationContext.fieldErrors != null){
            for(var i = 0; i < validationContext.fieldErrors.length; i++){
                var fieldError = validationContext.fieldErrors[i];
                X.renderFieldMessage(prefix + fieldError.name, fieldError.value, "error", container, handleEl);
            }
        }
    }

    
    X.renderFieldMessage = function(fieldText, status, inputEl){
        var controlEl = inputEl.parent();
        var controlGroupEl = controlEl.parent();
        controlGroupEl.removeClass("warning error info success")
        controlGroupEl.addClass(status);
        controlEl.children().remove(".X-field-message");
        controlEl.append('<span class="X-field-message help-inline">'+fieldText+'</span>');
    }
    
    X.clearFieldMessage = function(inputEl){
        var controlEl = inputEl.parent();
        var controlGroupEl = controlEl.parent();
        controlGroupEl.removeClass("warning error info success")
        controlEl.children().remove(".X-field-message");
    }
    
    
    X.valid = function(validationConfig, container, prefix){
        var passFlag = true;
        var firstErrorField = null;
        var errorFieldList = [];
        
        for (var i = 0; i < validationConfig.length; i++) {
            var v = validationConfig[i];
            var fieldName = v.name;
            var fieldText = v.text;
            var func = v.func;
            var handleEl = v.find;
            
            var passField = true;
            var inputEl = null;
            if(handleEl != null){
                inputEl = handleEl.call(this, prefix + fieldName, container);
            }else{
                inputEl = jQuery('input[name="'+prefix + fieldName+'"]', container);   
            }
            if(inputEl.size() < 1)
                continue;
            
            if(func == null){
                passField = inputEl.val() != null && inputEl.val().length > 0;
            }else{
                passField = func.call(this, inputEl, container);
            }
            if (!passField) {
                if(firstErrorField == null)
                    firstErrorField = inputEl;
                X.renderFieldMessage(fieldText, "error", inputEl);
                errorFieldList.push(fieldName);
                passFlag = false;
            }else{
                var inErrorList = false;
                for(var x in errorFieldList){
                    if(errorFieldList[x] == fieldName){
                        inErrorList = true;
                        break;
                    }
                }
                if(!inErrorList)
                    X.clearFieldMessage(inputEl);
            }
        }
        
        if (!passFlag && firstErrorField != null) {
            firstErrorField.focus();
        }
        
        return passFlag;
    }

})(window.XONE);
