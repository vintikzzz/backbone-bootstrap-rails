define ['without-my-bootstrap', 'i18n'], (App)->
  I18n.defaultLocale = App.Params.I18n.defaultLocale
  I18n.locale = App.Params.I18n.locale
  I18n.pluralizationRules = {}
  I18n.pluralization.ru = (n) ->
    type = if n % 10 == 1 && n % 100 != 11
      "one"
    else if [2, 3, 4].indexOf(n % 10) >= 0 && [12, 13, 14].indexOf(n % 100) < 0
      "few"
    else if n % 10 == 0 || [5, 6, 7, 8, 9].indexOf(n % 10) >= 0 || [11, 12, 13, 14].indexOf(n % 100) >= 0
      "many"
    else
      "other"
    [type]

  App.Views.Posts = {}
  App.getParameterByName = (name, query) ->
    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]")
    regexS = name + "=([^&#]*)"
    regex = new RegExp(regexS)
    results = regex.exec(query)
    if results == null
      return null
    else
      return decodeURIComponent(results[1].replace(/\+/g, " "))
  App
