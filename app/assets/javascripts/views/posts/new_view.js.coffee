define [
  'jquery'
  'backbone'
  'bootstrap'
  'views/common/form_view'
  'templates/posts/form'
], ($, Backbone, App) ->

  class App.Views.Posts.NewView extends App.Views.Common.FormView
    template: JST["templates/posts/form"]

    success: (post) ->
      @model = post
      @addSuccessAlert('Post created!')
      window.location.hash = "/posts/#{@model.id}"
      @collection.add(@model, at: 0)
