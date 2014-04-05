@getParams = ->
  if 1 < win.location.search.length
    query = win.location.search.substring(1)
    parameters = query.split("&")
    result = new Object()
    i = 0
    while i < parameters.length
      element = parameters[i].split("=")
      paramName = decodeURIComponent(element[0])
      paramValue = decodeURIComponent(element[1])
      result[paramName] = decodeURIComponent(paramValue)
      i++
    return result
  null