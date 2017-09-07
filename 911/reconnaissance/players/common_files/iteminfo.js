var iteminfo_tag;
var iteminfo_cache = [];
var iteminfo_current = 0;
var iteminfo_timer = 0;

function loadItemInfo() {
	iteminfo_timer = 0;
	if ($('#tooltip').is(':hidden')) return;
	iteminfo_cache[iteminfo_current] = '';
	var e = iteminfo_current.split('|');
	var url = "/?c=market&a=iteminfo&id=" + e[0];
	if (e[1]) url += '&e=' + e[1];
	$.get(url, null, itemInfoLoaded);
}

function itemInfoLoaded(data) {
	var url = parseURL(this.url);
	if (url && url.params && url.params.id) {
		var cache_id = url.params.id;
		if (url.params.e) cache_id += '|' + url.params.e;
		iteminfo_cache[cache_id] = data;
		if (iteminfo_current == cache_id) iteminfo_tag.html(data);
	}
}

function tooltipBodyHandler() {
	if (iteminfo_timer > 0) {
		clearTimeout(iteminfo_timer);
		iteminfo_timer = 0;
	}
	
	var item_id = this.getAttribute('iteminfo');
	iteminfo_current = item_id;
	
	if (iteminfo_cache[item_id] == null) {
		iteminfo_tag.html("загрузка информации...");
		iteminfo_timer = setTimeout(loadItemInfo, 600);
	}
	else iteminfo_tag.html(iteminfo_cache[item_id]);
	return iteminfo_tag;
}

function bindItemInfo(where, direct) {
	var obj;
	if (direct) obj = where;
	else obj = typeof(where) == 'undefined' ? $('[iteminfo]') : $(where).find('[iteminfo]');
	obj.tooltip({
		track: true,
		delay: 500,
		showURL: false,
		bodyHandler: tooltipBodyHandler,
		extraClass: "iteminfo"
	});
}

$(document).ready(function() {
	iteminfo_tag = $('<span id="iteminfo_tag"></span>');
	bindItemInfo();
});
