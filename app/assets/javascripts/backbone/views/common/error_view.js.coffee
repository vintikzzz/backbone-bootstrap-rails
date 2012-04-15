BackboneTwitterBootstrap.Views.Common ||= {}

class BackboneTwitterBootstrap.Views.Common.ErrorView extends Backbone.View
  template: JST["backbone/templates/common/error"]

  render: ->
    @errors = @model.get('errors')
    @form = $("form[name=" + @model.paramRoot + "]")
    @cleanErrors()
    if @errors?
      if @errors.error?
        $(@el).html(@template(@errors))
      @markErrorField(name, error) for name, error of @errors

    return this

  cleanErrors: ->
    @form.find(".error").removeClass("error")
    @form.find(".help-block").remove()


  markErrorField: (name, error) ->
    field = @form.find(":input[name=" + name + "]")
    field.parent().append("<div class='help-block'>" + error + "</div>")
    field.parent().parent().addClass("error")
