!function(t,e,a){function o(e){var a=t("<th>"+e.title+"</th>");return t.isPlainObject(e.data)&&a.data(e.data),t.isPlainObject(e.style)&&a.css(e.style),e.className&&a.addClass(e.className),a}function i(e,a){var i=e.find("thead");0===i.size()&&(i=t("<thead>").appendTo(e));for(var n=t("<tr>").appendTo(i),r=0,d=a.cols.length;d>r;r++)n.append(o(a.cols[r]))}function n(e){var a=e.find("tbody");0===a.size()&&(a=t("<tbody>").appendTo(e))}function r(e,a,o){if(o){e.attr("data-page-size",o["page-size"]);var i=e.find("tfoot");0===i.size()&&(i=t('<tfoot class="hide-if-no-paging"></tfoot>').appendTo(e)),i.append("<tr><td colspan="+a.length+"></td></tr>");var n=t("<div>").appendTo(i.find("tr:last-child td"));n.addClass(o["pagination-class"])}}function d(e){for(var a=e[0],o=0,i=e.length;i>o;o++){var n=e[o];if(n.data&&(n.data.toggle===!0||"true"===n.data.toggle))return}a.data=t.extend(a.data,{toggle:!0})}function s(t,e,a){0===t.find("tr.emptyInfo").size()&&t.find("tbody").append('<tr class="emptyInfo"><td colspan="'+e.length+'">'+a+"</td></tr>")}function l(e,a,o,i){e.find("tr:not(."+o+")").each(function(){var e=t(this),o=a.data("index"),n=parseInt(e.data("index"),0),r=n+i;n>=o&&this!==a.get(0)&&e.attr("data-index",r).data("index",r)})}function f(){function e(e,a,o){var i=t("<td>");return e.formatter?i.html(e.formatter(a,i,o)):i.html(a||""),i}var o=this;o.name="Footable Grid",o.init=function(e){var l=e.options.classes.toggle,f=e.options.classes.detail,c=e.options.grid;if(c.cols){o.footable=e;var p=t(e.table);p.data("grid",o),t.isPlainObject(c.data)&&p.data(c.data),o._items=[],d(c.cols),c.showCheckbox&&(c.multiSelect=!0,c.cols.unshift({title:c.checkboxFormatter(!0),name:"",data:{"sort-ignore":!0},formatter:c.checkboxFormatter})),c.showIndex&&c.cols.unshift({title:"#",name:"index",data:{"sort-ignore":!0},formatter:c.indexFormatter}),i(p,c),n(p),r(p,c.cols,c.pagination),p.off(".grid").on({"footable_initialized.grid":function(){c.url||c.ajax?t.ajax(c.ajax||{url:c.url}).then(function(t){o.newItem(t),e.raise(c.events.loaded)},function(){throw"load data from "+(c.url||c.ajax.url)+" fail"}):(o.newItem(c.items||[]),e.raise(c.events.loaded))},"footable_sorted.grid footable_grid_created.grid footable_grid_removed.grid":function(){c.showIndex&&o.getItem().length>0&&p.find("tbody tr:not(."+f+")").each(function(e){var a=t(this).find("td:first");a.html(c.indexFormatter(null,a,e))})},"footable_redrawn.grid footable_row_removed.grid":function(){0===o.getItem().length&&c.showEmptyInfo&&s(p,c.cols,c.emptyInfo)}}).on({"click.grid":function(o){if(t(o.target).closest("td").find(">."+l).size()>0)return!0;var i=t(o.currentTarget);return i.hasClass(f)?!0:(c.multiSelect||i.hasClass(c.activeClass)||p.find("tbody tr."+c.activeClass).removeClass(c.activeClass),i.toggleClass(c.activeClass),c.showCheckbox&&i.find("input:checkbox.check").prop("checked",function(t,e){return o.target===this?e:!e}),e.toggleDetail(i),a)}},"tbody tr").on("click.grid","thead input:checkbox.checkAll",function(t){var e=!!t.currentTarget.checked;e?p.find("tbody tr").addClass(c.activeClass):p.find("tbody tr").removeClass(c.activeClass),p.find("tbody input:checkbox.check").prop("checked",e)})}},o.getSelected=function(){var e=o.footable.options.grid,a=t(o.footable.table).find("tbody>tr."+e.activeClass);return a.map(function(){return t(this).data("index")})},o.getItem=function(e){return e!==a?t.isArray(e)?t.map(e,function(t){return o._items[t]}):o._items[e]:o._items},o._makeRow=function(a,i){var n,r=o.footable.options.grid;if(t.isFunction(r.template))n=t(r.template(t.extend({},{__index:i},a)));else{n=t("<tr>");for(var d=0,s=r.cols.length;s>d;d++){var l=r.cols[d];n.append(e(l,a[l.name]||"",i))}}return n.attr("data-index",i),n},o.newItem=function(e,i,n){var r=t(o.footable.table).find("tbody"),d=o.footable.options.classes.detail;if(r.find("tr.emptyInfo").remove(),t.isArray(e)){for(var s;s=e.pop();)o.newItem(s,i,!0);return o.footable.redraw(),o.footable.raise(o.footable.options.grid.events.created,{item:e,index:i}),a}if(t.isPlainObject(e)){var f,c=o._items.length;if(i===a||0>i||i>c)f=o._makeRow(e,c++),o._items.push(e),r.append(f);else{if(f=o._makeRow(e,i),0===i)o._items.unshift(e),r.prepend(f);else{var p=r.find("tr[data-index="+(i-1)+"]");o._items.splice(i,0,e),p.data("detail_created")===!0&&(p=p.next()),p.after(f)}l(r,f,d,1)}n||(o.footable.redraw(),o.footable.raise(o.footable.options.grid.events.created,{item:e,index:i}))}},o.setItem=function(e,a){if(t.isPlainObject(e)){var i=t(o.footable.table).find("tbody"),n=o._makeRow(e,a);t.extend(o._items[a],e);var r=i.find("tr").eq(a);r.html(n.html()),o.footable.redraw(),o.footable.raise(o.footable.options.grid.events.updated,{item:e,index:a})}},o.removeItem=function(e){var i=t(o.footable.table).find("tbody"),n=o.footable.options.classes.detail,r=[];if(t.isArray(e)){for(var d;d=e.pop();)r.push(o.removeItem(d));return o.footable.raise(o.footable.options.grid.events.removed,{item:r,index:e}),r}if(e===a)i.find("tr").each(function(){r.push(o._items.shift()),o.footable.removeRow(this)});else{var s=i.find("tr[data-index="+e+"]");r=o._items.splice(e,1)[0],o.footable.removeRow(s),l(i,s,n,-1)}return o.footable.raise(o.footable.options.grid.events.removed,{item:r,index:e}),r}}if(e.footable===a||null===e.foobox)throw Error("Please check and make sure footable.js is included in the page and is loaded prior to this script.");var c={grid:{enabled:!0,data:null,template:null,cols:null,items:null,url:null,ajax:null,activeClass:"active",multiSelect:!1,showIndex:!1,showCheckbox:!1,showEmptyInfo:!1,emptyInfo:'<p class="text-center text-warning">No Data</p>',pagination:{"page-size":20,"pagination-class":"pagination pagination-centered"},indexFormatter:function(t,e,a){return a+1},checkboxFormatter:function(t){return'<input type="checkbox" class="'+(t?"checkAll":"check")+'">'},events:{loaded:"footable_grid_loaded",created:"footable_grid_created",removed:"footable_grid_removed",updated:"footable_grid_updated"}}};e.footable.plugins.register(f,c)}(jQuery,window);