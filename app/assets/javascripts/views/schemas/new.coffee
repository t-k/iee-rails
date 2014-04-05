class AP.Views.SchemasNew extends Backbone.Marionette.ItemView
  template: JST['schemas/new']
  className: "schemas schemas-new"
  id: ""

  ui:
    name: "#name"
    method: "#method"
    action: "#action"
    url: "#url"
    output: "#output"

  events:
    "submit #form": "createSchema"

  createSchema: (event) ->
    event.preventDefault()
    target = $(event.target)
    name = @ui.name.val()
    url = @ui.url.val()
    method = @ui.method.val()
    action = @ui.action.val()
    el = JST["schemas/output"](name: name, url: url, action: action, method: method)
    @ui.output.text el