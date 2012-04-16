class BackboneTwitterBootstrap.Routers.PostsRouter extends Backbone.Router
  initialize: (options) ->
    @root = $("#content")
    @user = options.user
    @posts = options.posts

  routes:
    "posts/new"      : "newPost"
    "posts/index"    : "index"
    "posts/:id/edit" : "edit"
    "posts/:id"      : "show"
    "posts.*"        : "index"

  newPost: ->
    @view = new BackboneTwitterBootstrap.Views.Posts.NewView(collection: @posts, model: new @posts.model())
    @root.html(@view.render().el)

  index: ->
    @view = new BackboneTwitterBootstrap.Views.Posts.IndexView(posts: @posts, user: @user)
    @root.html(@view.render().el)

  show: (id) ->
    post = @posts.get(id)
    @view = new BackboneTwitterBootstrap.Views.Posts.ShowView(model: post, user: @user)
    @root.html(@view.render().el)

  edit: (id) ->
    post = @posts.get(id)
    @view = new BackboneTwitterBootstrap.Views.Posts.EditView(model: post)
    @root.html(@view.render().el)
