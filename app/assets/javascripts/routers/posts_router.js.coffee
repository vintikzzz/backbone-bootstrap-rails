define [
  'jquery'
  'backbone'
  'bootstrap'
  'helpers/layout'
  'views/posts/index_view'
  'views/posts/show_view'
  'views/posts/new_view'
  'views/posts/edit_view'
],
  
($, Backbone, App, Layout) ->
  class App.Routers.PostsRouter extends Backbone.Router
    initialize: (options) ->
      @user = options.user
      @posts = options.posts
      @user.on('change', => @posts.fetch())

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
      Layout.setContent(@view)

    index: (page) ->
      @posts.setPage(page) if page?
      View = require 'views/posts/index_view'
      @view = new View(posts: @posts, user: @user)
      Layout.setContent(@view)

    show: (id) ->
      View = require 'views/posts/show_view'
      post = this.getPost(id)
      @view = new View(model: post)
      Layout.setContent(@view)

    edit: (id) ->
      View = require 'views/posts/edit_view'
      post = this.getPost(id)
      @view = new View(model: post)
      Layout.setContent(@view)

    getPost: (id) ->
      post = @posts.get(id)
      unless post?
        post = new @posts.model()
        post.id = id
        post.fetch()
      post

