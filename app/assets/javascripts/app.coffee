I18n.defaultLocale = "ja"
I18n.fallbacks = true
I18n.locale = "ja"
window.AP = new Backbone.Marionette.Application
  Models: {}
  Collections: {}
  Views: {}
  Layouts: {}
  Routers: {}
  initialize: ->
    AP.addInitializer ->
      AP.addRegions
      #   header: "#header"
      #   navi: "#myModal"
      #   menu: "#menu"
        main: "#container"
        header: "#header"
        footer: "#footer"
      #   footer: "#footer"
      # # set views
      AP.header.show(new AP.Views.LayoutsHeader())
      # AP.navi.show(new AP.Views.LayoutsNav())
      # AP.menu.show(new AP.Views.LayoutsMenu())
      AP.footer.show(new AP.Views.LayoutsFooter())
      # set router
      AP.router = new AP.Routers.Main()
      Backbone.history.start({pushState: true, root: '/'})
      $(document).on 'click', "a[href^='/']", (e) ->
        url = $(this).attr('href').substr(1)
        AP.router.navigate url, {trigger: true}
        e.preventDefault()
    AP.start({pushState: true, root: '/'})


$ ->
  AP.initialize()
