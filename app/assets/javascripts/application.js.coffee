require ['i18n'], () ->
  I18n.defaultLocale = vars.defaultLocale
  I18n.locale = vars.locale

require [
  'collections/posts'
  'routers/app_router'
  'routers/posts_router'
  'tbone'
  'tbone-devise'
  'i18n'
],

(Posts, AppRouter, PostsRouter, Tbone, TboneDevise) ->
  posts = new Posts(vars.posts)
  new AppRouter()
  new PostsRouter(user: TboneDevise.currentUser, posts: posts)
  Backbone.history.start()
