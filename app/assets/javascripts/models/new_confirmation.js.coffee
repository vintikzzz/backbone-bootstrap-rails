define ['backbone', 'bootstrap'], (Backbone, App) ->
  class App.Models.NewConfirmation extends Backbone.Model
    paramRoot: 'user'
    defaults:
      email: ""

    sync: (method, model, options) ->
      options.url = '/users/confirmation.json'
      Backbone.sync(method, model, options)
