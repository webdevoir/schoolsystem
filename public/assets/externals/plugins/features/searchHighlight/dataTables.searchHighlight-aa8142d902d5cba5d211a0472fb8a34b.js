!function(t,i,h){h(i).on("init.dt.dth",function(t,i,n){var d=new h.fn.dataTable.Api(i),a=h(d.table().body());(h(d.table().node()).hasClass("searchHighlight")||i.oInit.searchHighlight||h.fn.dataTable.defaults.searchHighlight)&&d.on("draw.dt.dth column-visibility.dt.dth",function(){a.unhighlight(),d.rows({filter:"applied"}).data().length&&a.highlight(d.search().split(" "))}).on("destroy",function(){d.off("draw.dt.dth column-visibility.dt.dth")})})}(window,document,jQuery);