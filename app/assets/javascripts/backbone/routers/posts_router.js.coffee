class BackboneTwitterBootstrap.Routers.PostsRouter extends Backbone.Router
  initialize: (options) ->
    @root = $("#content")
    @user = options.user

  routes:
    "posts/new"      : "newPost"
    "posts/index"    : "index"
    "posts/:id/edit" : "edit"
    "posts/:id"      : "show"
    "posts.*"        : "index"

  newPost: ->
    @view = new BackboneTwitterBootstrap.Views.Posts.NewView(collection: this.getPosts())
    @root.html(@view.render().el)

  index: ->
    @view = new BackboneTwitterBootstrap.Views.Posts.IndexView(posts: this.getPosts(), user: @user)
    @root.html(@view.render().el)

  show: (id) ->
    post = this.getPosts().get(id)
    @view = new BackboneTwitterBootstrap.Views.Posts.ShowView(model: post, user: @user)
    @root.html(@view.render().el)

  edit: (id) ->
    post = this.getPosts().get(id)
    @view = new BackboneTwitterBootstrap.Views.Posts.EditView(model: post)
    @root.html(@view.render().el)

  getPosts: ->
    return @posts if @posts?
    @posts = new BackboneTwitterBootstrap.Collections.PostsCollection()
    @posts.fetch()
    @posts
