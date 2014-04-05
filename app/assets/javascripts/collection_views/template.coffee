class AP.CompositeViews.Template extends Backbone.Marionette.CompositeView
  template: JST['templates/template_composite']
  itemView: AP.Views.Template
  itemViewContainer: '#template_item'
  initialize: ()->
    @collection ||= new AP.Collections.Template()
    @model ||= new AP.Models.Template()
    @loadJson()
  loadJson: ->
    jQuery.getJSON "/template_list", {}, (json, textStatus) =>
      @collection.add json.templates
      @model.set("category", json.category)
      @render()
