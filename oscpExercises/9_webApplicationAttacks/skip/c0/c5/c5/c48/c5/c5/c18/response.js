var res = {'data':'HTTP/1.1 200 Partial Content\x0aDate: Sun, 20 Sep 2020 15:05:06 GMT\x0aServer: Apache/2.4.29 (Ubuntu)\x0aLast-Modified: Fri, 14 Dec 2018 04:41:57 GMT\x0aETag: \x22213-57cf40d168f40-gzip\x22\x0aAccept-Ranges: bytes\x0aVary: Accept-Encoding\x0aContent-Encoding: gzip\x0aContent-Range: bytes 0-283/284\x0aContent-Length: 284\x0aKeep-Alive: timeout=5, max=18\x0aConnection: Keep-Alive\x0aContent-Type: application/javascript\x0a\x0a(function() {\x0a\x0a\x09function contains(node) {\x0a\x09\x09if (!(0 in arguments)) {\x0a\x09\x09\x09throw new TypeError(\x271 argument is required\x27);\x0a\x09\x09}\x0a\x0a\x09\x09do {\x0a\x09\x09\x09if (this === node) {\x0a\x09\x09\x09\x09return true;\x0a\x09\x09\x09}\x0a\x09\x09} while (node = node && node.parentNode);\x0a\x0a\x09\x09return false;\x0a\x09}\x0a\x0a\x09// IE\x0a\x09if (\x27HTMLElement\x27 in this && \x27contains\x27 in HTMLElement.prototype) {\x0a\x09\x09try {\x0a\x09\x09\x09delete HTMLElement.prototype.contains;\x0a\x09\x09} catch (e) {}\x0a\x09}\x0a\x0a\x09if (\x27Node\x27 in this) {\x0a\x09\x09Node.prototype.contains = contains;\x0a\x09} else {\x0a\x09\x09document.contains = Element.prototype.contains = contains;\x0a\x09}\x0a\x0a}());\x0a'}