class AP.Views.TemplatesShow extends Backbone.Marionette.ItemView
  template: JST['templates/show']
  className: "templates templates-show"
  id: ""

  ui:
    editable: ".editable"
    output: "#output"
    email: "#email"

  events:
    "click #submit": "showCode"

  onRender: ->
    el = @ui.editable
    editor = new MediumEditor(el)

  onClose: ->
    $(".editable").unbind()

  showCode: (event) ->
    html = @ui.email.html()
    # console.log html
    el = JST["mails/2-equal-width-columns"](body: html)
    @ui.output.text el