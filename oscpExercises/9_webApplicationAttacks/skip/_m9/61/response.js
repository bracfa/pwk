var res = {'data':'HTTP/1.1 200 Partial Content\x0aDate: Sun, 20 Sep 2020 14:58:10 GMT\x0aServer: Apache/2.4.29 (Ubuntu)\x0aLast-Modified: Wed, 25 Apr 2018 22:35:21 GMT\x0aETag: \x22359-56ab3e2d73c40-gzip\x22\x0aAccept-Ranges: bytes\x0aVary: Accept-Encoding\x0aContent-Encoding: gzip\x0aContent-Range: bytes 0-453/454\x0aContent-Length: 454\x0aKeep-Alive: timeout=5, max=100\x0aConnection: Keep-Alive\x0aContent-Type: application/javascript\x0a\x0a!function(){\x22use strict\x22;var t=tinymce.util.Tools.resolve(\x22tinymce.PluginManager\x22),c=tinymce.util.Tools.resolve(\x22tinymce.util.Tools\x22),e=function(t,e){var i,n=t.dom,o=t.selection.getSelectedBlocks();o.length&&(i=n.getAttrib(o[0],\x22dir\x22),c.each(o,function(t){n.getParent(t.parentNode,\x27*[dir=\x22\x27+e+\x27\x22]\x27,n.getRoot())||n.setAttrib(t,\x22dir\x22,i!==e?e:null)}),t.nodeChanged())},i=function(t){t.addCommand(\x22mceDirectionLTR\x22,function(){e(t,\x22ltr\x22)}),t.addCommand(\x22mceDirectionRTL\x22,function(){e(t,\x22rtl\x22)})},n=function(e){var i=[];return c.each(\x22h1 h2 h3 h4 h5 h6 div p\x22.split(\x22 \x22),function(t){i.push(t+\x22[dir=\x22+e+\x22]\x22)}),i.join(\x22,\x22)},o=function(t){t.addButton(\x22ltr\x22,{title:\x22Left to right\x22,cmd:\x22mceDirectionLTR\x22,stateSelector:n(\x22ltr\x22)}),t.addButton(\x22rtl\x22,{title:\x22Right to left\x22,cmd:\x22mceDirectionRTL\x22,stateSelector:n(\x22rtl\x22)})};t.add(\x22directionality\x22,function(t){i(t),o(t)})}();'}