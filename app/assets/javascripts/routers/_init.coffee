
class AP.Routers.Main extends Backbone.Marionette.AppRouter
  routes:
    "": "home"
  # Private function

  _goToURL: (url) ->
    @navigate url, { trigger: true }