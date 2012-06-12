define ['backbone', 'bootstrap'], (Backbone, App) ->
  class App.Models.Session extends Backbone.Model
    paramRoot: 'user'
    defaults:
      email: ""
      password: ""

    methodUrl: {
      'create': '/users/sign_in.json',
      'delete': '/users/sign_out.json'
    }
    isNew: ->
      @user.get('abilities').signin

    sync: (method, model, options) ->
      if model.methodUrl && model.methodUrl[method.toLowerCase()]
        options = options || {}
        options.url = model.methodUrl[method.toLowerCase()]
      Backbone.sync(method, model, options)

    constructor: (user) ->
      super()
      @user = user
