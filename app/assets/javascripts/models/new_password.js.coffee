define ['backbone', 'bootstrap'], (Backbone, App) ->
  class App.Models.NewPassword extends Backbone.Model
    paramRoot: 'user'
    defaults:
      password: ""
      password_confirmation: ""
      reset_password_token: ""

    isNew: ->
      false

    methodUrl: {
      'update': '/users/password.json',
    }

    sync: (method, model, options) ->
      if model.methodUrl && model.methodUrl[method.toLowerCase()]
        options = options || {}
        options.url = model.methodUrl[method.toLowerCase()]
      Backbone.sync(method, model, options)
