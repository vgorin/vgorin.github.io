$.tablesorter.addParser({
    id: "chance",
    is: function(s) {
        return /(^\d{1,3}([.,]\d{1,2})?%)|(\d+\/\d+)$/.test(s);
    },
    format: function(s) {
        var r = new RegExp(/%/g);
        if (!r.test(s)) {
            var d = s.split('/');
            s = d[0] / d[1];
        }
        else {
            s = s.replace('%', '');
        }
        return $.tablesorter.formatFloat((s != "") ? s : "0");
    },
    type: "numeric" 
});
$.tablesorter.addParser({
    id: "order",
    is: function(s) {
        return false;
    },
    format: function(s,table,cell) {
        return parseInt($(cell).attr('order'));
    },
    type: "numeric" 
});
$.tablesorter.addParser({
    id: "link",
    is: function(s) {
        return false;
    },
    format: function(s,table,cell) {
        var a = $(cell).find('a')[0];
        return a ? a.textContent : '';
    },
    type: "text" 
});
$.tablesorter.addParser({
    id: "range",
    is: function(s) {
        return false;
    },
    format: function(s) {
        if (!/-/.test(s)) return parseInt(s);
        var a = s.split('-');
        var min = parseInt(a[0]);
        var max = parseInt(a[1]);
        return (max - min) / 2 + min;
    },
    type: "numeric" 
});
$.tablesorter.addParser({
    id: "cost",
    is: function(s) {
        return false;
    },
    format: function(s) {
        return parseInt(s.replace(/[^0-9\-]/g, '')) | 0;
    },
    type: "numeric" 
});