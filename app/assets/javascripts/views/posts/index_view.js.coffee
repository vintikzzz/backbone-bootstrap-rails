define [
  'jquery',
  'backbone',
  'bootstrap',
  'views/posts/post_view',
  'views/common/pager_view',
  'views/common/alert_view'
  'templates/posts/index'
], ($, Backbone, App, PostView, PagerView, AlertView) ->

  class App.Views.Posts.IndexView extends AlertView
    template: JST["posts/index"]

    initialize: () ->
      @options.posts.on('reset', @render, @)
      @options.user.on('change', @render, @)

    addAll: () ->
      @options.posts.each(@addOne, this)

    addPager: ()->
      view = new PagerView({collection: @options.posts, urlPrefix: '#/posts/index?page='})
      $(@el).find("table").after(view.render().el)


    addOne: (post) ->
      view = new PostView({model: post})
      $(@el).find("tbody").append(view.render().el)

    render: ->
      $(@el).html(@template(posts: @options.posts.toJSON(), user: @options.user.toJSON() ))
      @addAll()
      @addPager()
      @renderAlerts()
      @


    close: ->
      super
      @options.posts.off('reset', @render, this)
      @options.user.off('change', @render, this)
      @remove()
      @off()
