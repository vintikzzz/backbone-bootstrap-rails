define [
  'jquery'
  'backbone'
  'bootstrap'
  'templates/common/error'
], ($, Backbone, App) ->

  class App.Views.Common.ErrorView extends Backbone.View
    initialize: ->
      @model.on("change:errors", () =>
        @renderErrors()
      )

    cleanErrors: ->
      @form.find(".error").removeClass("error")
      @form.find(".help-block").remove()


    markErrorField: (name, error) ->
      field = @form.find(":input[name=" + name + "]")
      field.parent().append("<div class='help-block'>" + error + "</div>")
      field.parent().parent().addClass("error")

    renderErrors: ->
      @errors = @model.get('errors')
      @form = this.$el.find("form")
      @cleanErrors()
      if @errors?
        if @errors.error?
          $(JST["templates/common/error"](@errors)).insertBefore(@form)
        @markErrorField(name, error) for name, error of @errors
      return this
