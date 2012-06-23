require [
  'jquery'
  'models/user'
  'models/token'
  'collections/posts'
  'routers/app_router'
  'routers/posts_router'
  'routers/sessions_router'
  'views/sessions/login_bar_view'
  'views/tokens/show_view'
  'helpers/alert_queue'
  'i18n'
  'backbone-rails'
],

($, User, Token, Posts, AppRouter, PostsRouter, SessionsRouter, LoginBar, TokensView, AlertQueue) ->
    I18n.defaultLocale = vars.defaultLocale
    I18n.locale = vars.locale
    currentUser = new User(vars.currentUser)
    guest = new User(vars.guestUser)
    token = new Token()
    posts = new Posts(vars.posts)
    new TokensView(model: token)
    new AppRouter()
    new PostsRouter(user: currentUser, posts: posts)
    view = new LoginBar(model: currentUser)
    $("#add-bar").html(view.render().el)
    new SessionsRouter(user: currentUser, guest: guest, token: token)
    Backbone.history.start()
