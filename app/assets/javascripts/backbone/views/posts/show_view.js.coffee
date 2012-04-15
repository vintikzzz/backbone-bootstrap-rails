BackboneTwitterBootstrap.Views.Posts ||= {}

class BackboneTwitterBootstrap.Views.Posts.ShowView extends Backbone.View
  template: JST["backbone/templates/posts/show"]

  events:
    "click .destroy" : "destroy"

  initialize: () ->
    @options.user.bind('change', @render, this)
    @model.bind('change', @render, this)

  destroy: () ->
    @model.destroy()
    this.remove()
    window.location.hash = "/posts/index"

    return false

  render: ->
    $(@el).html(@template(post: @model.toJSON(), user: @options.user))
    return this
