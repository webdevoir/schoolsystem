jQuery.extend(jQuery.fn.dataTableExt.oSort,{"currency-pre":function(r){return r="-"===r?0:r.replace(/[^\d\-\.]/g,""),parseFloat(r)},"currency-asc":function(r,e){return r-e},"currency-desc":function(r,e){return e-r}});