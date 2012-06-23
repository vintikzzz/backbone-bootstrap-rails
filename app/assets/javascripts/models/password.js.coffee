define ['backbone', 'bootstrap'], (Backbone, App) ->
  class App.Models.Password extends Backbone.Model
    paramRoot: 'user'
    defaults:
      email: ""

    methodUrl: {
      'create': '/users/password.json',
    }

    sync: (method, model, options) ->
      if model.methodUrl && model.methodUrl[method.toLowerCase()]
        options = options || {}
        options.url = model.methodUrl[method.toLowerCase()]
      Backbone.sync(method, model, options)
