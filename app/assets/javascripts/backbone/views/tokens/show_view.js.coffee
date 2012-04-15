BackboneTwitterBootstrap.Views.Tokens ||= {}

class BackboneTwitterBootstrap.Views.Tokens.ShowView extends Backbone.View
  template: JST["backbone/templates/tokens/show"]

  initialize: () ->
    @model.set('token', $('meta[name="csrf-token"]').attr('content'))
    @model.bind('change', @render, this)

  render: ->
    $('meta[name="csrf-token"]').attr('content', @model.get('token')) 
    return this
