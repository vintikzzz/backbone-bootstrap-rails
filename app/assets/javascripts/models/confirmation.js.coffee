define ['backbone', 'bootstrap'], (Backbone, App) ->
  class App.Models.Confirmation extends Backbone.Model
    defaults:
      confirmation_token: ""

    sync: (method, model, options) ->
      method = 'read'
      options.url = '/users/confirmation.json?confirmation_token=' + model.get('confirmation_token')
      Backbone.sync(method, model, options)
