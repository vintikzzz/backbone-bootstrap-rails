define [
  'jquery'
  'backbone'
  'bootstrap'
  'views/common/form_view'
  'templates/confirmations/new'
  'i18n'
], ($, Backbone, App, FormView) ->

  class App.Views.Confirmations.NewView extends FormView
    template: JST["templates/confirmations/new"]

    success: (session) ->
      @addSuccessAlert(I18n.t('devise.confirmations.send_instructions'))
      window.location.hash = "/posts"

    error: (post, jqXHR) ->
      @model.set($.parseJSON(jqXHR.responseText))
