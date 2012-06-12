define [
  'jquery'
  'backbone'
  'bootstrap'
  'views/posts/index_view'
  'views/posts/show_view'
  'views/posts/new_view'
  'views/posts/edit_view'
],
  
($, Backbone, App) ->
  class App.Routers.PostsRouter extends Backbone.Router
    initialize: (options) ->
      @root = $("#content")
      @user = options.user
      @posts = options.posts

    routes:
      "posts/new"              : "newPost"
      "posts/index"            : "index"
      "posts/index?page=:page" : "index"
      "posts/:id/edit"         : "edit"
      "posts/:id"              : "show"
      "posts.*"                : "index"

    newPost: ->
      View = require 'views/posts/new_view'
      @view = new View(collection: @posts, model: new @posts.model())
      @root.html(@view.render().el)

    index: (page) ->
      @posts.setPage(page) if page?
      View = require 'views/posts/index_view'
      @view = new View(posts: @posts, user: @user)
      @root.html(@view.render().el)

    show: (id) ->
      View = require 'views/posts/show_view'
      post = this.getPost(id)
      @view = new View(model: post)
      @root.html(@view.render().el)

    edit: (id) ->
      View = require 'views/posts/edit_view'
      post = this.getPost(id)
      @view = new View(model: post)
      @root.html(@view.render().el)

    getPost: (id) ->
      post = @posts.get(id)
      unless post?
        post = new @posts.model()
        post.id = id
        post.fetch()
      post

