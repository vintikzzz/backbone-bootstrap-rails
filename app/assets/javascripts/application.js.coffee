require [
  'jquery'
  'models/user'
  'models/token'
  'collections/posts'
  'routers/app_router'
  'routers/posts_router'
  'routers/sessions_router'
  'views/sessions/login_bar_view'
  'backbone-rails'
],

($, User, Token, Posts, AppRouter, PostsRouter, SessionsRouter, LoginBar) ->
    currentUser = new User(vars.currentUser)
    guest = new User(vars.guestUser)
    token = new Token()
    posts = new Posts(vars.posts)
    new AppRouter()
    new PostsRouter(user: currentUser, posts: posts)
    view = new LoginBar(model: currentUser)
    $("#add-bar").html(view.render().el)
    new SessionsRouter(user: currentUser, guest: guest, token: token)
    currentUser.on('change', => posts.fetch())
    Backbone.history.start()
