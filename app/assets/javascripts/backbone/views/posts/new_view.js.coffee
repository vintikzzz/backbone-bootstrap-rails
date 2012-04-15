BackboneTwitterBootstrap.Views.Posts ||= {}

class BackboneTwitterBootstrap.Views.Posts.NewView extends BackboneTwitterBootstrap.Views.Common.ErrorView
  template: JST["backbone/templates/posts/new"]

  events:
    "submit #new-post": "save"

  constructor: (options) ->
    super(options)

    @model = new @collection.model()
    @model.bind("change:errors", () =>
      @renderErrors()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors", silent: true)

    @model.save(null,
      success: (post) =>
        @model = post
        window.location.hash = "/posts/#{@model.id}"
        @collection.add(@model, at: 0)

      error: (post, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    this.$("form").backboneLink(@model)
    return this
