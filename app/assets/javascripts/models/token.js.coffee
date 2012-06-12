define ['backbone', 'bootstrap'], (Backbone, App) ->
  class App.Models.Token extends Backbone.Model
    paramRoot: 'token'
    url: '/tokens/show.json'
