require [
  'bootstrap'
  'tbone'
  'tbone-devise'
  'routers/app_router'
  'routers/posts_router'
  'collections/posts'
],

(App, Tbone, TboneDevise, AppRouter, PostsRouter, Posts) ->
  new PostsRouter(user: TboneDevise.currentUser, posts: new Posts(App.Params.posts))
  new AppRouter()
  Backbone.history.start()
