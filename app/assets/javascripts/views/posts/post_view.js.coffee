define ['jquery', 'backbone', 'bootstrap', 'views/common/confirm_view', 'templates/posts/post'], ($, Backbone, App, ConfirmView) ->
  class App.Views.Posts.PostView extends Backbone.View
    template: JST["templates/posts/post"]

    events:
      "click .destroy" : "destroy"

    tagName: "tr"

    destroy: ->
      view = new ConfirmView()
      view.on('accept', ->
        @model.destroy()
        this.remove()
        # @addSuccessAlert('Post removed!')
      , this)
      $(@el).append(view.render().el)

      return false

    render: ->
      $(@el).html(@template(post: @model.toJSON()))
      return this
