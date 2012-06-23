define [
  'jquery'
  'backbone'
  'bootstrap'
  'models/password'
  'views/common/form_view'
  'templates/registrations/new'
  'i18n'
], ($, Backbone, App, Password, FormView) ->

  class App.Views.Passwords.NewView extends FormView
    template: JST["templates/registrations/new"]

    success: (session) ->
      @options.user.id = session.id
      @options.user.fetch()
      @addSuccessAlert(I18n.t('devise.registrations.signed_up'))
      window.location.hash = "/posts"

    error: (post, jqXHR) ->
      @model.set($.parseJSON(jqXHR.responseText))
