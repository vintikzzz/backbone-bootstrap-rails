BackboneTwitterBootstrap.Views.Devise ||= {}

class BackboneTwitterBootstrap.Views.Devise.LoginBar extends Backbone.View
  template: JST["backbone/templates/devise/login_bar"]

  initialize: () ->
    @model.bind('change', @render, this)

  render: ->
    return unless @model?
    $(@el).html(@template(@model.toJSON()))
    return this
