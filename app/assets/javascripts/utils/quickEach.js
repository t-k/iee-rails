(function($) {
  $.fn.quickEach = function(f) {
    var j = $([0]), i = -1, l = this.length, c;
    while (
      ++i < l
      && (c = j[0] = this[i])
      && f.call(j, i, c) !== false
    );
    return this;
  };
})(jQuery);