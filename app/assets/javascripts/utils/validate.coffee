@validEmail = (str) ->
  return (/\S+@\S+\.\S+/).test str

@validZip = (str) ->
  (/^\d{3}-?\d{4}$/).test(str) || (/^\d{7}$/).test(str)