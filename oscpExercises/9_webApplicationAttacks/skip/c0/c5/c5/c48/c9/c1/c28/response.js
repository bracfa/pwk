var res = {'data':'HTTP/1.1 200 Partial Content\x0aDate: Sun, 20 Sep 2020 15:04:41 GMT\x0aServer: Apache/2.4.29 (Ubuntu)\x0aLast-Modified: Thu, 03 Nov 2016 05:40:34 GMT\x0aETag: \x2247fa-5405eff119880-gzip\x22\x0aAccept-Ranges: bytes\x0aVary: Accept-Encoding\x0aContent-Encoding: gzip\x0aContent-Range: bytes 0-5266/5267\x0aContent-Length: 5267\x0aKeep-Alive: timeout=5, max=12\x0aConnection: Keep-Alive\x0aContent-Type: application/javascript\x0a\x0a/*!\x0a * jQuery UI Resizable 1.11.4\x0a * http://jqueryui.com\x0a *\x0a * Copyright jQuery Foundation and other contributors\x0a * Released under the MIT license.\x0a * http://jquery.org/license\x0a *\x0a * http://api.jqueryui.com/resizable/\x0a */\x0a!function(a){\x22function\x22==typeof define&&define.amd?define([\x22jquery\x22,\x22./core\x22,\x22./mouse\x22,\x22./widget\x22],a):a(jQuery)}(function(a){return a.widget(\x22ui.resizable\x22,a.ui.mouse,{version:\x221.11.4\x22,widgetEventPrefix:\x22resize\x22,options:{alsoResize:!1,animate:!1,animateDuration:\x22slow\x22,animateEasing:\x22swing\x22,aspectRatio:!1,autoHide:!1,containment:!1,ghost:!1,grid:!1,handles:\x22e,s,se\x22,helper:!1,maxHeight:null,maxWidth:null,minHeight:10,minWidth:10,zIndex:90,resize:null,start:null,stop:null},_num:function(a){return parseInt(a,10)||0},_isNumber:function(a){return!isNaN(parseInt(a,10))},_hasScroll:function(b,c){if(\x22hidden\x22===a(b).css(\x22overflow\x22))return!1;var d=c&&\x22left\x22===c?\x22scrollLeft\x22:\x22scrollTop\x22,e=!1;return b[d]\x3e0||(b[d]=1,e=b[d]\x3e0,b[d]=0,e)},_create:function(){var b,c,d,e,f,g=this,h=this.options;if(this.element.addClass(\x22ui-resizable\x22),a.extend(this,{_aspectRatio:!!h.aspectRatio,aspectRatio:h.aspectRatio,originalElement:this.element,_proportionallyResizeElements:[],_helper:h.helper||h.ghost||h.animate?h.helper||\x22ui-resizable-helper\x22:null}),this.element[0].nodeName.match(/^(canvas|textarea|input|select|button|img)$/i)&&(this.element.wrap(a(\x22\x3cdiv class=\x27ui-wrapper\x27 style=\x27overflow: hidden;\x27\x3e\x3c/div\x3e\x22).css({position:this.element.css(\x22position\x22),width:this.element.outerWidth(),height:this.element.outerHeight(),top:this.element.css(\x22top\x22),left:this.element.css(\x22left\x22)})),this.element=this.element.parent().data(\x22ui-resizable\x22,this.element.resizable(\x22instance\x22)),this.elementIsWrapper=!0,this.element.css({marginLeft:this.originalElement.css(\x22marginLeft\x22),marginTop:this.originalElement.css(\x22marginTop\x22),marginRight:this.originalElement.css(\x22marginRight\x22),marginBottom:this.originalElement.css(\x22marginBottom\x22)}),this.originalElement.css({marginLeft:0,marginTop:0,marginRight:0,marginBottom:0}),this.originalResizeStyle=this.originalElement.css(\x22resize\x22),this.originalElement.css(\x22resize\x22,\x22none\x22),this._proportionallyResizeElements.push(this.originalElement.css({position:\x22static\x22,zoom:1,display:\x22block\x22})),this.originalElement.css({margin:this.originalElement.css(\x22margin\x22)}),this._proportionallyResize()),this.handles=h.handles||(a(\x22.ui-resizable-handle\x22,this.element).length?{n:\x22.ui-resizable-n\x22,e:\x22.ui-resizable-e\x22,s:\x22.ui-resizable-s\x22,w:\x22.ui-resizable-w\x22,se:\x22.ui-resizable-se\x22,sw:\x22.ui-resizable-sw\x22,ne:\x22.ui-resizable-ne\x22,nw:\x22.ui-resizable-nw\x22}:\x22e,s,se\x22),this._handles=a(),this.handles.constructor===String)for(\x22all\x22===this.handles&&(this.handles=\x22n,e,s,w,se,sw,ne,nw\x22),b=this.handles.split(\x22,\x22),this.handles={},c=0;c\x3cb.length;c++)d=a.trim(b[c]),f=\x22ui-resizable-\x22+d,e=a(\x22\x3cdiv class=\x27ui-resizable-handle \x22+f+\x22\x27\x3e\x3c/div\x3e\x22),e.css({zIndex:h.zIndex}),\x22se\x22===d&&e.addClass(\x22ui-icon ui-icon-gripsmall-diagonal-se\x22),this.handles[d]=\x22.ui-resizable-\x22+d,this.element.append(e);this._renderAxis=function(b){var c,d,e,f;b=b||this.element;for(c in this.handles)this.handles[c].constructor===String?this.handles[c]=this.element.children(this.handles[c]).first().show():(this.handles[c].jquery||this.handles[c].nodeType)&&(this.handles[c]=a(this.handles[c]),this._on(this.handles[c],{mousedown:g._mouseDown})),this.elementIsWrapper&&this.originalElement[0].nodeName.match(/^(textarea|input|select|button)$/i)&&(d=a(this.handles[c],this.element),f=/sw|ne|nw|se|n|s/.test(c)?d.outerHeight():d.outerWidth(),e=[\x22padding\x22,/ne|nw|n/.test(c)?\x22Top\x22:/se|sw|s/.test(c)?\x22Bottom\x22:/^e$/.test(c)?\x22Right\x22:\x22Left\x22].join(\x22\x22),b.css(e,f),this._proportionallyResize()),this._handles=this._handles.add(this.handles[c])},this._renderAxis(this.element),this._handles=this._handles.add(this.element.find(\x22.ui-resizable-handle\x22)),this._handles.disableSelection(),this._handles.mouseover(function(){g.resizing||(this.className&&(e=this.className.match(/ui-resizable-(se|sw|ne|nw|n|e|s|w)/i)),g.axis=e&&e[1]?e[1]:\x22se\x22)}),h.autoHide&&(this._handles.hide(),a(this.element).addClass(\x22ui-resizable-autohide\x22).mouseenter(function(){h.disabled||(a(this).removeClass(\x22ui-resizable-autohide\x22),g._handles.show())}).mouseleave(function(){h.disabled||g.resizing||(a(this).addClass(\x22ui-resizable-autohide\x22),g._handles.hide())})),this._mouseInit()},_destroy:function(){this._mouseDestroy();var b,c=function(b){a(b).removeClass(\x22ui-resizable ui-resizable-disabled ui-resizable-resizing\x22).removeData(\x22resizable\x22).removeData(\x22ui-resizable\x22).unbind(\x22.resizable\x22).find(\x22.ui-resizable-handle\x22).remove()};return this.elementIsWrapper&&(c(this.element),b=this.element,this.originalElement.css({position:b.css(\x22position\x22),width:b.outerWidth(),height:b.outerHeight(),top:b.css(\x22top\x22),left:b.css(\x22left\x22)}).insertAfter(b),b.remove()),this.originalElement.css(\x22resize\x22,this.originalResizeStyle),c(this.originalElement),this},_mouseCapture:function(b){var c,d,e=!1;for(c in this.handles)d=a(this.handles[c])[0],(d===b.target||a.contains(d,b.target))&&(e=!0);return!this.options.disabled&&e},_mouseStart:function(b){var c,d,e,f=this.options,g=this.element;return this.resizing=!0,this._renderProxy(),c=this._num(this.helper.css(\x22left\x22)),d=this._num(this.helper.css(\x22top\x22)),f.containment&&(c+=a(f.containment).scrollLeft()||0,d+=a(f.containment).scrollTop()||0),this.offset=this.helper.offset(),this.position={left:c,top:d},this.size=this._helper?{width:this.helper.width(),height:this.helper.height()}:{width:g.width(),height:g.height()},this.originalSize=this._helper?{width:g.outerWidth(),height:g.outerHeight()}:{width:g.width(),height:g.height()},this.sizeDiff={width:g.outerWidth()-g.width(),height:g.outerHeight()-g.height()},this.originalPosition={left:c,top:d},this.originalMousePosition={left:b.pageX,top:b.pageY},this.aspectRatio=\x22number\x22==typeof f.aspectRatio?f.aspectRatio:this.originalSize.width/this.originalSize.height||1,e=a(\x22.ui-resizable-\x22+this.axis).css(\x22cursor\x22),a(\x22body\x22).css(\x22cursor\x22,\x22auto\x22===e?this.axis+\x22-resize\x22:e),g.addClass(\x22ui-resizable-resizing\x22),this._propagate(\x22start\x22,b),!0},_mouseDrag:function(b){var c,d,e=this.originalMousePosition,f=this.axis,g=b.pageX-e.left||0,h=b.pageY-e.top||0,i=this._change[f];return this._updatePrevProperties(),!!i&&(c=i.apply(this,[b,g,h]),this._updateVirtualBoundaries(b.shiftKey),(this._aspectRatio||b.shiftKey)&&(c=this._updateRatio(c,b)),c=this._respectSize(c,b),this._updateCache(c),this._propagate(\x22resize\x22,b),d=this._applyChanges(),!this._helper&&this._proportionallyResizeElements.length&&this._proportionallyResize(),a.isEmptyObject(d)||(this._updatePrevProperties(),this._trigger(\x22resize\x22,b,this.ui()),this._applyChanges()),!1)},_mouseStop:function(b){this.resizing=!1;var c,d,e,f,g,h,i,j=this.options,k=this;return this._helper&&(c=this._proportionallyResizeElements,d=c.length&&/textarea/i.test(c[0].nodeName),e=d&&this._hasScroll(c[0],\x22left\x22)?0:k.sizeDiff.height,f=d?0:k.sizeDiff.width,g={width:k.helper.width()-f,height:k.helper.height()-e},h=parseInt(k.element.css(\x22left\x22),10)+(k.position.left-k.originalPosition.left)||null,i=parseInt(k.element.css(\x22top\x22),10)+(k.position.top-k.originalPosition.top)||null,j.animate||this.element.css(a.extend(g,{top:i,left:h})),k.helper.height(k.size.height),k.helper.width(k.size.width),this._helper&&!j.animate&&this._proportionallyResize()),a(\x22body\x22).css(\x22cursor\x22,\x22auto\x22),this.element.removeClass(\x22ui-resizable-resizing\x22),this._propagate(\x22stop\x22,b),this._helper&&this.helper.remove(),!1},_updatePrevProperties:function(){this.prevPosition={top:this.position.top,left:this.position.left},this.prevSize={width:this.size.width,height:this.size.height}},_applyChanges:function(){var a={};return this.position.top!==this.prevPosition.top&&(a.top=this.position.top+\x22px\x22),this.position.left!==this.prevPosition.left&&(a.left=this.position.left+\x22px\x22),this.size.width!==this.prevSize.width&&(a.width=this.size.width+\x22px\x22),this.size.height!==this.prevSize.height&&(a.height=this.size.height+\x22px\x22),this.helper.css(a),a},_updateVirtualBoundaries:function(a){var b,c,d,e,f,g=this.options;f={minWidth:this._isNumber(g.minWidth)?g.minWidth:0,maxWidth:this._isNumber(g.maxWidth)?g.maxWidth:1/0,minHeight:this._isNumber(g.minHeight)?g.minHeight:0,maxHeight:this._isNumber(g.maxHeight)?g.maxHeight:1/0},(this._aspectRatio||a)&&(b=f.minHeight*this.aspectRatio,d=f.minWidth/this.aspectRatio,c=f.maxHeight*this.aspectRatio,e=f.maxWidth/this.aspectRatio,b\x3ef.minWidth&&(f.minWidth=b),d\x3ef.minHeight&&(f.minHeight=d),c\x3cf.maxWidth&&(f.maxWidth=c),e\x3cf.maxHeight&&(f.maxHeight=e)),this._vBoundaries=f},_updateCache:function(a){this.offset=this.helper.offset(),this._isNumber(a.left)&&(this.position.left=a.left),this._isNumber(a.top)&&(this.position.top=a.top),this._isNumber(a.height)&&(this.size.height=a.height),this._isNumber(a.width)&&(this.size.width=a.width)},_updateRatio:function(a){var b=this.position,c=this.size,d=this.axis;return this._isNumber(a.height)?a.width=a.height*this.aspectRatio:this._isNumber(a.width)&&(a.height=a.width/this.aspectRatio),\x22sw\x22===d&&(a.left=b.left+(c.width-a.width),a.top=null),\x22nw\x22===d&&(a.top=b.top+(c.height-a.height),a.left=b.left+(c.width-a.width)),a},_respectSize:function(a){var b=this._vBoundaries,c=this.axis,d=this._isNumber(a.width)&&b.maxWidth&&b.maxWidth\x3ca.width,e=this._isNumber(a.height)&&b.maxHeight&&b.maxHeight\x3ca.height,f=this._isNumber(a.width)&&b.minWidth&&b.minWidth\x3ea.width,g=this._isNumber(a.height)&&b.minHeight&&b.minHeight\x3ea.height,h=this.originalPosition.left+this.originalSize.width,i=this.position.top+this.size.height,j=/sw|nw|w/.test(c),k=/nw|ne|n/.test(c);return f&&(a.width=b.minWidth),g&&(a.height=b.minHeight),d&&(a.width=b.maxWidth),e&&(a.height=b.maxHeight),f&&j&&(a.left=h-b.minWidth),d&&j&&(a.left=h-b.maxWidth),g&&k&&(a.top=i-b.minHeight),e&&k&&(a.top=i-b.maxHeight),a.width||a.height||a.left||!a.top?a.width||a.height||a.top||!a.left||(a.left=null):a.top=null,a},_getPaddingPlusBorderDimensions:function(a){for(var b=0,c=[],d=[a.css(\x22borderTopWidth\x22),a.css(\x22borderRightWidth\x22),a.css(\x22borderBottomWidth\x22),a.css(\x22borderLeftWidth\x22)],e=[a.css(\x22paddingTop\x22),a.css(\x22paddingRight\x22),a.css(\x22paddingBottom\x22),a.css(\x22paddingLeft\x22)];b\x3c4;b++)c[b]=parseInt(d[b],10)||0,c[b]+=parseInt(e[b],10)||0;return{height:c[0]+c[2],width:c[1]+c[3]}},_proportionallyResize:function(){if(this._proportionallyResizeElements.length)for(var a,b=0,c=this.helper||this.element;b\x3cthis._proportionallyResizeElements.length;b++)a=this._proportionallyResizeElements[b],this.outerDimensions||(this.outerDimensions=this._getPaddingPlusBorderDimensions(a)),a.css({height:c.height()-this.outerDimensions.height||0,width:c.width()-this.outerDimensions.width||0})},_renderProxy:function(){var b=this.element,c=this.options;this.elementOffset=b.offset(),this._helper?(this.helper=this.helper||a(\x22\x3cdiv style=\x27overflow:hidden;\x27\x3e\x3c/div\x3e\x22),this.helper.addClass(this._helper).css({width:this.element.outerWidth()-1,height:this.element.outerHeight()-1,position:\x22absolute\x22,left:this.elementOffset.left+\x22px\x22,top:this.elementOffset.top+\x22px\x22,zIndex:++c.zIndex}),this.helper.appendTo(\x22body\x22).disableSelection()):this.helper=this.element},_change:{e:function(a,b){return{width:this.originalSize.width+b}},w:function(a,b){var c=this.originalSize,d=this.originalPosition;return{left:d.left+b,width:c.width-b}},n:function(a,b,c){var d=this.originalSize,e=this.originalPosition;return{top:e.top+c,height:d.height-c}},s:function(a,b,c){return{height:this.originalSize.height+c}},se:function(b,c,d){return a.extend(this._change.s.apply(this,arguments),this._change.e.apply(this,[b,c,d]))},sw:function(b,c,d){return a.extend(this._change.s.apply(this,arguments),this._change.w.apply(this,[b,c,d]))},ne:function(b,c,d){return a.extend(this._change.n.apply(this,arguments),this._change.e.apply(this,[b,c,d]))},nw:function(b,c,d){return a.extend(this._change.n.apply(this,arguments),this._change.w.apply(this,[b,c,d]))}},_propagate:function(b,c){a.ui.plugin.call(this,b,[c,this.ui()]),\x22resize\x22!==b&&this._trigger(b,c,this.ui())},plugins:{},ui:function(){return{originalElement:this.originalElement,element:this.element,helper:this.helper,position:this.position,size:this.size,originalSize:this.originalSize,originalPosition:this.originalPosition}}}),a.ui.plugin.add(\x22resizable\x22,\x22animate\x22,{stop:function(b){var c=a(this).resizable(\x22instance\x22),d=c.options,e=c._proportionallyResizeElements,f=e.length&&/textarea/i.test(e[0].nodeName),g=f&&c._hasScroll(e[0],\x22left\x22)?0:c.sizeDiff.height,h=f?0:c.sizeDiff.width,i={width:c.size.width-h,height:c.size.height-g},j=parseInt(c.element.css(\x22left\x22),10)+(c.position.left-c.originalPosition.left)||null,k=parseInt(c.element.css(\x22top\x22),10)+(c.position.top-c.originalPosition.top)||null;c.element.animate(a.extend(i,k&&j?{top:k,left:j}:{}),{duration:d.animateDuration,easing:d.animateEasing,step:function(){var d={width:parseInt(c.element.css(\x22width\x22),10),height:parseInt(c.element.css(\x22height\x22),10),top:parseInt(c.element.css(\x22top\x22),10),left:parseInt(c.element.css(\x22left\x22),10)};e&&e.length&&a(e[0]).css({width:d.width,height:d.height}),c._updateCache(d),c._propagate(\x22resize\x22,b)}})}}),a.ui.plugin.add(\x22resizable\x22,\x22containment\x22,{start:function(){var b,c,d,e,f,g,h,i=a(this).resizable(\x22instance\x22),j=i.options,k=i.element,l=j.containment,m=l instanceof a?l.get(0):/parent/.test(l)?k.parent().get(0):l;m&&(i.containerElement=a(m),/document/.test(l)||l===document?(i.containerOffset={left:0,top:0},i.containerPosition={left:0,top:0},i.parentData={element:a(document),left:0,top:0,width:a(document).width(),height:a(document).height()||document.body.parentNode.scrollHeight}):(b=a(m),c=[],a([\x22Top\x22,\x22Right\x22,\x22Left\x22,\x22Bottom\x22]).each(function(a,d){c[a]=i._num(b.css(\x22padding\x22+d))}),i.containerOffset=b.offset(),i.containerPosition=b.position(),i.containerSize={height:b.innerHeight()-c[3],width:b.innerWidth()-c[1]},d=i.containerOffset,e=i.containerSize.height,f=i.containerSize.width,g=i._hasScroll(m,\x22left\x22)?m.scrollWidth:f,h=i._hasScroll(m)?m.scrollHeight:e,i.parentData={element:m,left:d.left,top:d.top,width:g,height:h}))},resize:function(b){var c,d,e,f,g=a(this).resizable(\x22instance\x22),h=g.options,i=g.containerOffset,j=g.position,k=g._aspectRatio||b.shiftKey,l={top:0,left:0},m=g.containerElement,n=!0;m[0]!==document&&/static/.test(m.css(\x22position\x22))&&(l=i),j.left\x3c(g._helper?i.left:0)&&(g.size.width=g.size.width+(g._helper?g.position.left-i.left:g.position.left-l.left),k&&(g.size.height=g.size.width/g.aspectRatio,n=!1),g.position.left=h.helper?i.left:0),j.top\x3c(g._helper?i.top:0)&&(g.size.height=g.size.height+(g._helper?g.position.top-i.top:g.position.top),k&&(g.size.width=g.size.height*g.aspectRatio,n=!1),g.position.top=g._helper?i.top:0),e=g.containerElement.get(0)===g.element.parent().get(0),f=/relative|absolute/.test(g.containerElement.css(\x22position\x22)),e&&f?(g.offset.left=g.parentData.left+g.position.left,g.offset.top=g.parentData.top+g.position.top):(g.offset.left=g.element.offset().left,g.offset.top=g.element.offset().top),c=Math.abs(g.sizeDiff.width+(g._helper?g.offset.left-l.left:g.offset.left-i.left)),d=Math.abs(g.sizeDiff.height+(g._helper?g.offset.top-l.top:g.offset.top-i.top)),c+g.size.width\x3e=g.parentData.width&&(g.size.width=g.parentData.width-c,k&&(g.size.height=g.size.width/g.aspectRatio,n=!1)),d+g.size.height\x3e=g.parentData.height&&(g.size.height=g.parentData.height-d,k&&(g.size.width=g.size.height*g.aspectRatio,n=!1)),n||(g.position.left=g.prevPosition.left,g.position.top=g.prevPosition.top,g.size.width=g.prevSize.width,g.size.height=g.prevSize.height)},stop:function(){var b=a(this).resizable(\x22instance\x22),c=b.options,d=b.containerOffset,e=b.containerPosition,f=b.containerElement,g=a(b.helper),h=g.offset(),i=g.outerWidth()-b.sizeDiff.width,j=g.outerHeight()-b.sizeDiff.height;b._helper&&!c.animate&&/relative/.test(f.css(\x22position\x22))&&a(this).css({left:h.left-e.left-d.left,width:i,height:j}),b._helper&&!c.animate&&/static/.test(f.css(\x22position\x22))&&a(this).css({left:h.left-e.left-d.left,width:i,height:j})}}),a.ui.plugin.add(\x22resizable\x22,\x22alsoResize\x22,{start:function(){var b=a(this).resizable(\x22instance\x22),c=b.options;a(c.alsoResize).each(function(){var b=a(this);b.data(\x22ui-resizable-alsoresize\x22,{width:parseInt(b.width(),10),height:parseInt(b.height(),10),left:parseInt(b.css(\x22left\x22),10),top:parseInt(b.css(\x22top\x22),10)})})},resize:function(b,c){var d=a(this).resizable(\x22instance\x22),e=d.options,f=d.originalSize,g=d.originalPosition,h={height:d.size.height-f.height||0,width:d.size.width-f.width||0,top:d.position.top-g.top||0,left:d.position.left-g.left||0};a(e.alsoResize).each(function(){var b=a(this),d=a(this).data(\x22ui-resizable-alsoresize\x22),e={},f=b.parents(c.originalElement[0]).length?[\x22width\x22,\x22height\x22]:[\x22width\x22,\x22height\x22,\x22top\x22,\x22left\x22];a.each(f,function(a,b){var c=(d[b]||0)+(h[b]||0);c&&c\x3e=0&&(e[b]=c||null)}),b.css(e)})},stop:function(){a(this).removeData(\x22resizable-alsoresize\x22)}}),a.ui.plugin.add(\x22resizable\x22,\x22ghost\x22,{start:function(){var b=a(this).resizable(\x22instance\x22),c=b.options,d=b.size;b.ghost=b.originalElement.clone(),b.ghost.css({opacity:.25,display:\x22block\x22,position:\x22relative\x22,height:d.height,width:d.width,margin:0,left:0,top:0}).addClass(\x22ui-resizable-ghost\x22).addClass(\x22string\x22==typeof c.ghost?c.ghost:\x22\x22),b.ghost.appendTo(b.helper)},resize:function(){var b=a(this).resizable(\x22instance\x22);b.ghost&&b.ghost.css({position:\x22relative\x22,height:b.size.height,width:b.size.width})},stop:function(){var b=a(this).resizable(\x22instance\x22);b.ghost&&b.helper&&b.helper.get(0).removeChild(b.ghost.get(0))}}),a.ui.plugin.add(\x22resizable\x22,\x22grid\x22,{resize:function(){var b,c=a(this).resizable(\x22instance\x22),d=c.options,e=c.size,f=c.originalSize,g=c.originalPosition,h=c.axis,i=\x22number\x22==typeof d.grid?[d.grid,d.grid]:d.grid,j=i[0]||1,k=i[1]||1,l=Math.round((e.width-f.width)/j)*j,m=Math.round((e.height-f.height)/k)*k,n=f.width+l,o=f.height+m,p=d.maxWidth&&d.maxWidth\x3cn,q=d.maxHeight&&d.maxHeight\x3co,r=d.minWidth&&d.minWidth\x3en,s=d.minHeight&&d.minHeight\x3eo;d.grid=i,r&&(n+=j),s&&(o+=k),p&&(n-=j),q&&(o-=k),/^(se|s|e)$/.test(h)?(c.size.width=n,c.size.height=o):/^(ne)$/.test(h)?(c.size.width=n,c.size.height=o,c.position.top=g.top-m):/^(sw)$/.test(h)?(c.size.width=n,c.size.height=o,c.position.left=g.left-l):((o-k\x3c=0||n-j\x3c=0)&&(b=c._getPaddingPlusBorderDimensions(this)),o-k\x3e0?(c.size.height=o,c.position.top=g.top-m):(o=k-b.height,c.size.height=o,c.position.top=g.top+f.height-o),n-j\x3e0?(c.size.width=n,c.position.left=g.left-l):(n=j-b.width,c.size.width=n,c.position.left=g.left+f.width-n))}}),a.ui.resizable});'}