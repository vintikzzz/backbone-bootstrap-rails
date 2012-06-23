define [
  'jquery'
  'backbone'
  'bootstrap'
  'models/session'
  'views/common/form_view'
  'templates/sessions/new'
  'i18n'
], ($, Backbone, App, Session, FormView) ->

  class App.Views.Sessions.NewView extends FormView
    template: JST["templates/sessions/new"]

    success: (session) ->
      @options.user.id = session.id
      @options.user.fetch()
      @addSuccessAlert(I18n.t('devise.sessions.signed_in'))
      window.location.hash = "/posts"
