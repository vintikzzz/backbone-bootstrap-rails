define ['backbone', 'bootstrap'], (Backbone, App) ->
  class App.Routers.AppRouter extends Backbone.Router
    routes:
      ""        : "posts"

    posts: ->
      window.location.hash = "/posts"

