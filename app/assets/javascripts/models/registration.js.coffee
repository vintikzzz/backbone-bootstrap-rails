define ['backbone', 'bootstrap'], (Backbone, App) ->
  class App.Models.Registration extends Backbone.Model
    paramRoot: 'user'
    defaults:
      email: ""
      password: ""
      password_confirmation: ""

    methodUrl: {
      'create': '/users',
    }

    sync: (method, model, options) ->
      if model.methodUrl && model.methodUrl[method.toLowerCase()]
        options = options || {}
        options.url = model.methodUrl[method.toLowerCase()]
      Backbone.sync(method, model, options)
