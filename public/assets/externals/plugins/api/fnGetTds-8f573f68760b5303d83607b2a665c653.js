jQuery.fn.dataTableExt.oApi.fnGetTds=function(o,e){var a,n,t,d=[],s=[],i=0,l="object"==typeof e?o.oApi._fnNodeToDataIndex(o,e):e,p=o.aoData[l].nTr;for(n=0,t=p.childNodes.length;t>n;n++)a=p.childNodes[n],"TD"==a.nodeName.toUpperCase()&&s.push(a);for(n=0,t=o.aoColumns.length;t>n;n++)o.aoColumns[n].bVisible?d.push(s[n-i]):(d.push(o.aoData[l]._anHidden[n]),i++);return d};