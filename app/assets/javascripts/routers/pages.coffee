AP.Routers.Main::home = ->
  AP.header.show(new AP.Views.LayoutsHeader())
  AP.main.show(new AP.CompositeViews.Template())
