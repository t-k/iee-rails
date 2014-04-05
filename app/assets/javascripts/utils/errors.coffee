@showInfo = (data, target=null) ->
  showError data, "alert-info", target

@showError = (data, _type="alert-danger", target=null) ->
  data = [data] if typeof data == "string"
  checkFlash = ->
    f = $(document.getElementById('flash-container'))
    f.remove() if f.length > 0
  removeFlash = ->
    f = $(document.getElementById('flash-container'))
    f.unbind()
    f.fadeOut 'fast', ->
      $(this).remove()
  checkFlash()
  l = data.length
  messages = ''
  i = 0
  while i < l
    messages += "<div class=\"flash-messages\">" + data[i] + "</div>"
    i++
  el = $("""<div id="flash-container" class="flash-container">
<div data-alert="alert" class="alert #{_type} fade in">
<span id="close" class="close" data-dismiss="alert">&times;</span>
<strong>#{messages}</strong></div></div>""")
  el.find("#close").one 'click', ->
    removeFlash()
  if target != null
    target.prepend el
  else
    $(document.getElementById('container')).prepend el

@createFlash = (data, type) ->
  if type == 'alert-error'
    toastr.error errors.join("\n")
  else
    toastr.success errors.join("\n")

@handleError = (data, target=null) ->
  catchError = (errors, target=null) ->
    # createFlash errors, 'alert-error', target
    # errors =
    toastr.error errors.join("\n")
  if data.status == 422
    json = JSON.parse(data.responseText)
    errors = json.errors
    catchError errors, target
  else if data.status == 401
    if window.session && window.session.isSignedIn()
      window.session.signOut()
    toastr.error I18n.t("messages.need_login")
    # catchError errors, target