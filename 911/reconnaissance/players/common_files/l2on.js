function parseURL(url) {
	var obj = {params:{}};
	url = url.split('#', 2);
	obj.fragment = url[1] ? url[1] : null;
	url = url[0].split('?', 2);
	obj.script = url[0];
	if (url[1]) {
		var pairs = url[1].split('&');
		for (var i in pairs) {
			var kv = pairs[i].split('=');
			obj.params[kv[0]] = kv[1];
		}
	}
	return obj;
}
function toggle_spoiler() {
	$(this.parentNode).find('div:first').toggle();
	return false;
}

(function($) {
  var cache = [];
  $.preloadImages = function() {
    var args_len = arguments.length;
    for (var i = args_len; i--;) {
      var cacheImage = document.createElement('img');
      cacheImage.src = arguments[i];
      cache.push(cacheImage);
    }
  }
})(jQuery)

var notifyTimer = null;
function showMessage(msg, error)
{
var IE = $.browser.msie;
var main = $('#l2on-notify');
var notify = $('#l2on-notify-text');
main.css({width: IE ? document.body.clientWidth : '100%', position: IE ? 'absolute' : 'fixed', 'left': 0, 'top': IE ? document.body.scrollTop : 0});
notify.css({'background-color': error ? '#ed6060' : '#6690c9', 'opacity': 0.95});
notify.html(msg);
notify.click(function(){closeMessage()});
main.show();
clearTimeout(notifyTimer);
notifyTimer = setTimeout(function(){closeMessage()}, 3000);
}
function closeMessage()
{
clearTimeout(notifyTimer);
var main = $('#l2on-notify');
main.fadeOut('fast', function(){main.hide()});
}

$(document).ready(function() {
	$("div.spoiler a:first").click(toggle_spoiler);
	$("table.tablesorter").tablesorter();//{widthFixed: true}
	//$("input.datepick").datepicker();
	currentURL = parseURL(window.location.href);
});
var currentURL = null;

function hideBigImage()
{
document.getElementById('faded-screen').style.display='none';
document.getElementById('big-image-display').style.display='none';
return false;
}

function showBigImage(img)
{
var d = document.getElementById("big-image-display");
var dt = document.getElementById("big-image-container");
var f = document.getElementById("faded-screen");

d.style.display = "block";
d.style.top = document.body.scrollTop;
d.style.height = document.body.clientHeight;
d.style.left = document.body.scrollLeft;
d.style.width = document.body.clientWidth;
dt.innerHTML = "<img src='" + img + "' alt='Image' style='border: 10px solid #eee; background-color: #777'>";
f.style.height = document.body.scrollHeight;
f.style.width = document.body.scrollWidth;
f.style.display = "block";
return false;
}