define ['backbone', 'bootstrap'], (Backbone, App) ->
  class App.Models.Post extends Backbone.Model
    paramRoot: 'post'
    urlRoot: '/posts'

    defaults:
      title: null
      content: null

