var res = {'data':'HTTP/1.1 200 Partial Content\x0aDate: Sun, 20 Sep 2020 15:04:32 GMT\x0aServer: Apache/2.4.29 (Ubuntu)\x0aLast-Modified: Fri, 15 Nov 2013 05:16:09 GMT\x0aETag: \x22e92-4eb304bc4f840-gzip\x22\x0aAccept-Ranges: bytes\x0aVary: Accept-Encoding\x0aContent-Encoding: gzip\x0aContent-Range: bytes 0-1120/1121\x0aContent-Length: 1121\x0aKeep-Alive: timeout=5, max=100\x0aConnection: Keep-Alive\x0aContent-Type: application/javascript\x0a\x0a(function($){\x0a\x09$.fn.filter_visible = function(depth) {\x0a\x09\x09depth = depth || 3;\x0a\x09\x09var is_visible = function() {\x0a\x09\x09\x09var p = $(this), i;\x0a\x09\x09\x09for(i=0; i\x3cdepth-1; ++i) {\x0a\x09\x09\x09\x09if (!p.is(\x27:visible\x27)) return false;\x0a\x09\x09\x09\x09p = p.parent();\x0a\x09\x09\x09}\x0a\x09\x09\x09return true;\x0a\x09\x09};\x0a\x09\x09return this.filter(is_visible);\x0a\x09};\x0a\x09$.table_hotkeys = function(table, keys, opts) {\x0a\x09\x09opts = $.extend($.table_hotkeys.defaults, opts);\x0a\x09\x09var selected_class, destructive_class, set_current_row, adjacent_row_callback, get_adjacent_row, adjacent_row, prev_row, next_row, check, get_first_row, get_last_row, make_key_callback, first_row;\x0a\x09\x09\x0a\x09\x09selected_class = opts.class_prefix + opts.selected_suffix;\x0a\x09\x09destructive_class = opts.class_prefix + opts.destructive_suffix;\x0a\x09\x09set_current_row = function (tr) {\x0a\x09\x09\x09if ($.table_hotkeys.current_row) $.table_hotkeys.current_row.removeClass(selected_class);\x0a\x09\x09\x09tr.addClass(selected_class);\x0a\x09\x09\x09tr[0].scrollIntoView(false);\x0a\x09\x09\x09$.table_hotkeys.current_row = tr;\x0a\x09\x09};\x0a\x09\x09adjacent_row_callback = function(which) {\x0a\x09\x09\x09if (!adjacent_row(which) && $.isFunction(opts[which+\x27_page_link_cb\x27])) {\x0a\x09\x09\x09\x09opts[which+\x27_page_link_cb\x27]();\x0a\x09\x09\x09}\x0a\x09\x09};\x0a\x09\x09get_adjacent_row = function(which) {\x0a\x09\x09\x09var first_row, method;\x0a\x09\x09\x09\x0a\x09\x09\x09if (!$.table_hotkeys.current_row) {\x0a\x09\x09\x09\x09first_row = get_first_row();\x0a\x09\x09\x09\x09$.table_hotkeys.current_row = first_row;\x0a\x09\x09\x09\x09return first_row[0];\x0a\x09\x09\x09}\x0a\x09\x09\x09method = \x27prev\x27 == which? $.fn.prevAll : $.fn.nextAll;\x0a\x09\x09\x09return method.call($.table_hotkeys.current_row, opts.cycle_expr).filter_visible()[0];\x0a\x09\x09};\x0a\x09\x09adjacent_row = function(which) {\x0a\x09\x09\x09var adj = get_adjacent_row(which);\x0a\x09\x09\x09if (!adj) return false;\x0a\x09\x09\x09set_current_row($(adj));\x0a\x09\x09\x09return true;\x0a\x09\x09};\x0a\x09\x09prev_row = function() { return adjacent_row(\x27prev\x27); };\x0a\x09\x09next_row = function() { return adjacent_row(\x27next\x27); };\x0a\x09\x09check = function() {\x0a\x09\x09\x09$(opts.checkbox_expr, $.table_hotkeys.current_row).each(function() {\x0a\x09\x09\x09\x09this.checked = !this.checked;\x0a\x09\x09\x09});\x0a\x09\x09};\x0a\x09\x09get_first_row = function() {\x0a\x09\x09\x09return $(opts.cycle_expr, table).filter_visible().eq(opts.start_row_index);\x0a\x09\x09};\x0a\x09\x09get_last_row = function() {\x0a\x09\x09\x09var rows = $(opts.cycle_expr, table).filter_visible();\x0a\x09\x09\x09return rows.eq(rows.length-1);\x0a\x09\x09};\x0a\x09\x09make_key_callback = function(expr) {\x0a\x09\x09\x09return function() {\x0a\x09\x09\x09\x09if ( null == $.table_hotkeys.current_row ) return false;\x0a\x09\x09\x09\x09var clickable = $(expr, $.table_hotkeys.current_row);\x0a\x09\x09\x09\x09if (!clickable.length) return false;\x0a\x09\x09\x09\x09if (clickable.is(\x27.\x27+destructive_class)) next_row() || prev_row();\x0a\x09\x09\x09\x09clickable.click();\x0a\x09\x09\x09};\x0a\x09\x09};\x0a\x09\x09first_row = get_first_row();\x0a\x09\x09if (!first_row.length) return;\x0a\x09\x09if (opts.highlight_first)\x0a\x09\x09\x09set_current_row(first_row);\x0a\x09\x09else if (opts.highlight_last)\x0a\x09\x09\x09set_current_row(get_last_row());\x0a\x09\x09$.hotkeys.add(opts.prev_key, opts.hotkeys_opts, function() {return adjacent_row_callback(\x27prev\x27);});\x0a\x09\x09$.hotkeys.add(opts.next_key, opts.hotkeys_opts, function() {return adjacent_row_callback(\x27next\x27);});\x0a\x09\x09$.hotkeys.add(opts.mark_key, opts.hotkeys_opts, check);\x0a\x09\x09$.each(keys, function() {\x0a\x09\x09\x09var callback, key;\x0a\x09\x09\x09\x0a\x09\x09\x09if ($.isFunction(this[1])) {\x0a\x09\x09\x09\x09callback = this[1];\x0a\x09\x09\x09\x09key = this[0];\x0a\x09\x09\x09\x09$.hotkeys.add(key, opts.hotkeys_opts, function(event) { return callback(event, $.table_hotkeys.current_row); });\x0a\x09\x09\x09} else {\x0a\x09\x09\x09\x09key = this;\x0a\x09\x09\x09\x09$.hotkeys.add(key, opts.hotkeys_opts, make_key_callback(\x27.\x27+opts.class_prefix+key));\x0a\x09\x09\x09}\x0a\x09\x09});\x0a\x0a\x09};\x0a\x09$.table_hotkeys.current_row = null;\x0a\x09$.table_hotkeys.defaults = {cycle_expr: \x27tr\x27, class_prefix: \x27vim-\x27, selected_suffix: \x27current\x27,\x0a\x09\x09destructive_suffix: \x27destructive\x27, hotkeys_opts: {disableInInput: true, type: \x27keypress\x27},\x0a\x09\x09checkbox_expr: \x27:checkbox\x27, next_key: \x27j\x27, prev_key: \x27k\x27, mark_key: \x27x\x27,\x0a\x09\x09start_row_index: 2, highlight_first: false, highlight_last: false, next_page_link_cb: false, prev_page_link_cb: false};\x0a})(jQuery);\x0a\xe1'}