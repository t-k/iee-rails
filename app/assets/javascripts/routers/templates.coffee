AP.Routers.Main::templatesShow = (id)->
  AP.header.close()
  AP.main.show(new AP.Views.TemplatesShow())