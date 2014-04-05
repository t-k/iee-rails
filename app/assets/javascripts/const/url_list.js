var linkTo, api;

(function() {
  var URLs,
    baseURL,
    __slice = [].slice;

  URLs = {
    root: function() {
      return "";
    },
    templates: function() {
      return "templates";
    },
    templatesShow: function(id) {
      return this.templates() + "/" + id;
    },
    schema: function() {
      return "schema";
    },
    schemaNew: function() {
      return this.schema() + "/new";
    }
  };

  var baseURL = function(type, args) {
    return URLs[type].apply(URLs, args);
  };

  linkTo = function() {
    var args, type;
    type = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
    return "/" + baseURL(type, args);
  };

  api = function() {
    var args, type;
    type = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
    return "/api/v1/" + baseURL(type, args);
  };

}).call(this);