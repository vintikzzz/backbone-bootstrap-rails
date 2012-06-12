define [
  'jquery'
  'backbone'
  'bootstrap'
  'models/session'
  'views/sessions/new_view'
],
  
($, Backbone, App, Session) ->
  class App.Routers.SessionsRouter extends Backbone.Router
    initialize: (options) ->
      @root  = $("#content")
      @user  = options.user
      @guest = options.guest
      @token = options.token
      @session = new Session(@user)

    routes:
      "signin"  :"newSession"
      "signout" :"destroy"

    newSession: ->
      View = require 'views/sessions/new_view'
      @view = new View(model: @session, user: @user, token: @token)
      @root.html(@view.render().el)

    destroy: ->
      @session.destroy(
        success: (session, response) =>
          @user.set(@guest.attributes)
          @session = new Session(@user)
          window.location.hash = "/posts"
      )

