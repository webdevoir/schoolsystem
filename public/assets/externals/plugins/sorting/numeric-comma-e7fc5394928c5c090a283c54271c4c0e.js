jQuery.extend(jQuery.fn.dataTableExt.oSort,{"numeric-comma-pre":function(e){var r="-"==e?0:e.replace(/,/,".");return parseFloat(r)},"numeric-comma-asc":function(e,r){return r>e?-1:e>r?1:0},"numeric-comma-desc":function(e,r){return r>e?1:e>r?-1:0}});