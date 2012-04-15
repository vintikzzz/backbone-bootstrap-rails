BackboneTwitterBootstrap.Views.Common ||= {}

class BackboneTwitterBootstrap.Views.Common.ErrorView extends Backbone.View
  template: JST["backbone/templates/common/error"]

  render: ->
    @errors = @model.get('errors')
    if @errors?
      if @errors.error?
        $(@el).html(@template(@errors))
      @markErrorField(name, error) for name, error of @errors

    return this

  markErrorField: (name, error) ->
    field = $(":input[name=" + name + "]")
    field.parent().append("<div class='help-block'>" + error + "</div>")
    field.parent().parent().addClass("error")
