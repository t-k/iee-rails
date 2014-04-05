

class AP.Routers.Main extends Backbone.Marionette.AppRouter
  routes:
    "": "home"
    "templates/:id": "templatesShow"
    "schema/new": "schemasNew"

  # Private function

  _goToURL: (url) ->
    @navigate url, { trigger: true }