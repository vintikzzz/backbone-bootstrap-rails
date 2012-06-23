define [
  'jquery'
  'backbone'
  'bootstrap'
  'views/common/confirm_view'
  'views/common/alert_view'
  'templates/posts/show'
], ($, Backbone, App, ConfirmView, AlertView) ->

  class App.Views.Posts.ShowView extends AlertView
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
        @addSuccessAlert('Post removed!')
        window.location.hash = "/posts/index"
      , this)
      $(@el).append(view.render().el)

      return false

    render: ->
      $(@el).html(@template(post: @model.toJSON()))
      @renderAlerts()
      return this

    close: ->
      super
      @model.off('change', @render, this)
      @remove()
      @off()
