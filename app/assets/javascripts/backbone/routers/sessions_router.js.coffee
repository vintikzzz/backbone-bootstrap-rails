class BackboneTwitterBootstrap.Routers.SessionsRouter extends Backbone.Router
  initialize: (options) ->
    @root  = $("#content")
    @user  = options.user
    @guest = options.guest
    @token = options.token
    @session = new BackboneTwitterBootstrap.Models.Session(@user)

  routes:
    "signin"  :"newSession"
    "signout" :"destroy"

  newSession: ->
    @view = new BackboneTwitterBootstrap.Views.Sessions.NewView(model: @session, user: @user, token: @token)
    @root.html(@view.render().el)

  destroy: ->
    @session.destroy(
      success: (session, response) =>
        @user.set(@guest.attributes)
        @session = new BackboneTwitterBootstrap.Models.Session(@user)
        window.location.hash = "/posts"
    )

