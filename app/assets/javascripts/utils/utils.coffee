@initReturn = ->
  $.removeCookie('return_to')

@setReturn = (url) ->
  $.cookie('return_to', url, { expires: 1, path: '/' })

@getReturn = ->
  $.cookie 'return_to'

# $ ->
#   initReturn()

@gotToURL = (url, fn) ->
  AP.router.gotToURL url
  fn() if fn

jQuery.fn.autolink = ->
  @each ->
    re = /((http|https|ftp):\/\/[\w?=&.\/-;#~%-]+(?![\w\s?&.\/;#~%"=-]*>))/g
    $(this).html $(this).html().replace(re, "<a href=\"$1\" target=\"_blank\">$1</a> ")


@scrollToError = ->
  el = $(".error-message", doc.getElementsByTagName("form")).first()
  main = $(doc.getElementById("main-container"))
  if el.length > 0
    $(doc.getElementsByTagName("body")).animate({
      scrollTop: el.parent().parent().offset().top - main.offset().top + main.scrollTop()
    }, 20);

@removeErrorMessage = (element) ->
  element.nextAll(".error-message").remove()

@showErrorRequired = (element) ->
  removeErrorMessage(element)
  $("""<div class="error-message help-block">#{I18n.t("errors.need_input")}</div>""").insertAfter element

@showErrorTipRequired = (element) ->
  removeErrorMessage(element)
  $("""<span class="hint--left hint--mid hint--error hint--always error-message" data-hint="#{I18n.t("errors.need_input")}"></span>""").insertAfter element

@errorWithMessage = (element, message) ->
  removeErrorMessage(element)
  $("""<div class="error-message help-block">#{message}</div>""").insertAfter element

@initError = (target) ->
  target.find(".error-message").remove() if target

@getCurrentPath = ->
  Backbone.history.fragment.replace(/\?.+/, "")


@castNum = (a) ->
  a.replace /[０１２３４５６７８９]/g, (a) ->
    b = "０１２３４５６７８９".indexOf(a)
    (if (b isnt -1) then b else a)
