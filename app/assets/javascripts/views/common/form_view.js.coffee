define [
  'jquery'
  'backbone'
  'bootstrap'
  'views/common/alert_view'
], ($, Backbone, App, AlertView) ->

  class App.Views.Common.FormView extends AlertView
    events:
      "submit": "save"

    initialize: ->
      @model.on("change:errors", @renderErrors, this)

    cleanErrors: ->
      @form.find(".error").removeClass("error")
      @form.find(".help-block").remove()

    save: (e) ->
      e.preventDefault()
      e.stopPropagation()
      @model.unset("errors", silent: true)
      @model.save(null,
        success: (e) =>
          @success(e)

        error: (e, jqXHR) =>
          @error(e, jqXHR)
      )

    close: ->
      super
      @model.off("change:errors", @renderErrors, this)
      @remove()
      @off()

    error: (e, jqXHR) ->
      @model.set({errors: $.parseJSON(jqXHR.responseText)})

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
          @addErrorAlert(@errors.error)
          @renderAlerts()
        @markErrorField(name, error) for name, error of @errors
      return this

    render: ->
      $(@el).html(@template(@model.toJSON() ))
      @renderAlerts()
      this.$("form").backboneLink(@model)
      return this
