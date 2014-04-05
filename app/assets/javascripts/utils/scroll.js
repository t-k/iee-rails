var nearBottom = function() {
  var w = $(window);
  return w.scrollTop() > $(document).height() - w.height() - 50;
}