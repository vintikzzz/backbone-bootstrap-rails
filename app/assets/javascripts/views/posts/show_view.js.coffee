define [
  'jquery'
  'backbone'
  'bootstrap'
  'templates/posts/show'
  'views/common/confirm_view'
], ($, Backbone, App, PostView, ConfirmView) ->

  class App.Views.Posts.ShowView extends Backbone.View
    template: JST["templates/posts/show"]

    events:
      "click .destroy" : "destroy"

    initialize: () ->
      @model.on('change', @render, this)

    destroy: () ->
      view = new ConfirmView()
      view.on('accept', ->
        @model.destroy()
        this.remove()
        window.location.hash = "/posts/index"
      , this)
      $(@el).append(view.render().el)

      return false

    render: ->
      $(@el).html(@template(post: @model.toJSON()))
      return this
