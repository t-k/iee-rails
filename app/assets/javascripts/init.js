var doc = document, win = window, title = doc.getElementsByTagName("title");

if (typeof console === "undefined") {
  console = {};
  console.log = function() {
    return;
  }
}

// HBT = HandlebarsTemplates;

//User Agent Class
var uaType = function() {
  var self = this;
  var ua = win.navigator.userAgent;
  var msie = ua.indexOf ("MSIE ");
  self.iPhone = ( ua.indexOf('iPhone') !== -1 || ua.indexOf('iPod') !== -1 );
  self.iPad = ua.indexOf('iPad') !== -1;
  self.Android2 = (ua.indexOf('Android 2.') !== -1);
  self.Android4 = (ua.indexOf('Android 4.') !== -1);
  self.Android = ((ua.indexOf('Android') !== -1) && (ua.indexOf('Mobile') !== -1)) && (ua.indexOf('SC-01C') == -1);
  self.AndroidTab = (ua.indexOf('Android') !== -1) && ((ua.indexOf('Mobile') == -1) || (ua.indexOf('SC-01C') !== -1));
  self.WindowsPhone = ( ua.indexOf('IEMobile') !== -1 || ua.indexOf('ZuneWP') !== -1 );
  self.PC = ( typeof win.orientation === "undefined" );
  self.IE = ( ua.indexOf("MSIE ") !== -1 );
  self.IEver = ( parseInt (ua.substring (msie+5, ua.indexOf (".", msie ))) );
  self.MOBILE = ( self.iPhone || self.iPad || (ua.indexOf('Android') !== -1) || self.WindowsPhone );
  self.SMART = ( self.iPhone || self.Android || self.WindowsPhone );
  self.ua = ua;
}
ua = new uaType();

// added trim function
if (typeof(String.prototype.trim) === "undefined") {
  String.prototype.trim = function() {
    return String(this).replace(/^\s+|\s+$/g, '');
  };
}

var setTitle, setDescription, setImage;
setTitle = function() {
  var $source, $title, base, source, title;
  base = I18n.t("common.site_name");
  $title = $("#title");
  $source = $(".meta-title-source", "#container");
  source = $source && $source.text() || document.metaTitle;
  if (source) {
    title = source + " | " + base;
    return $title.text(title.trim());
  }
};

setDescription = function() {
  var $desc, $source, base, desc, source;
  base = I18n.t("common.site_desc");
  $desc = $("#meta-og-desc,#meta-desc");
  $source = $(".meta-desc-source", "#container");
  if ($source.length > 0) {
    source = "";
    _.each($source, function(v, k) {
      return source = source + " " + $(v).text();
    });
  } else {
    source = document.metaDescSource;
  }
  if (source) {
    desc = source + " | " + base;
  } else {
    desc = base;
  }
  return $desc.attr("content", desc);
};

setImage = function() {
  var $image, $source, base, source, url;
  base = "";
  $image = $("#meta-og-image");
  $source = $(".meta-image-source", "#container");
  source = $source && $source.attr("src") || document.metaImageSource;
  if (source) {
    url = source;
  } else {
    url = base;
  }
  return $image.attr("content", url);
};
// $.ajaxSetup({
//   converters: {
//     'text msgpack': function(packed) {
//       if(packed != '') return msgpack.unpack(packed);
//       return '';
//     }
//   }
// });
Backbone.History.prototype.loadUrl = function (fragment) {
  fragment = this.fragment = this.getFragment(fragment);
  return _.any(this.handlers, function(handler) {
    if (handler.route.test(fragment)) {
      handler.callback(fragment);
      if (typeof window._gaq !== "undefined") {
        window._gaq.push(['_trackPageview', fragment]);
      }
      return true;
    }
  });
}