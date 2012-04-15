BackboneTwitterBootstrap.Views.Posts ||= {}

class BackboneTwitterBootstrap.Views.Posts.IndexView extends Backbone.View
  template: JST["backbone/templates/posts/index"]

  initialize: () ->
    @options.posts.bind('reset', @addAll)
    @options.user.bind('change', @render, this)

  addAll: () =>
    @options.posts.each(@addOne)

  addOne: (post) =>
    view = new BackboneTwitterBootstrap.Views.Posts.PostView({model : post, user: @options.user })
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(posts: @options.posts.toJSON(), user: @options.user.toJSON() ))
    @addAll()

    return this
