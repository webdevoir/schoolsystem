jQuery.extend(jQuery.fn.dataTableExt.oSort,{"signed-num-pre":function(n){return"-"==n||""===n?0:1*n.replace("+","")},"signed-num-asc":function(n,e){return e>n?-1:n>e?1:0},"signed-num-desc":function(n,e){return e>n?1:n>e?-1:0}});