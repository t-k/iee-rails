AP.Routers.Main::schemasNew = ->
  AP.header.close()
  AP.main.show(new AP.Views.SchemasNew())