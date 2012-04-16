BackboneTwitterBootstrap.Views.Sessions ||= {}

class BackboneTwitterBootstrap.Views.Sessions.NewView extends BackboneTwitterBootstrap.Views.Common.ErrorView
  template: JST["backbone/templates/sessions/new"]

  events:
    "submit #new-session": "save"

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors", silent: true)

    @model.save(null,
      success: (session) =>
        @options.user.id = session.id
        @options.user.fetch()
        @options.token.fetch()
        @session = new BackboneTwitterBootstrap.Models.Session(@options.user)
        window.location.hash = "/posts"

      error: (post, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
