BackboneTwitterBootstrap.Views.Posts ||= {}

class BackboneTwitterBootstrap.Views.Posts.EditView extends Backbone.View
  template : JST["backbone/templates/posts/edit"]

  events :
    "submit #edit-post" : "update"

  initialize: ->
    @model.bind("change:errors", () =>
      @renderErrors()
    )

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors", silent: true)

    @model.save(null,
      success : (post) =>
        @model = post
        window.location.hash = "/posts/#{@model.id}"
      error: (post, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))
    this.$("form").backboneLink(@model)
    return this

  renderErrors: ->
    view = new BackboneTwitterBootstrap.Views.Common.ErrorView({model : @model})
    $("form").prepend(view.render().el)
    return this
