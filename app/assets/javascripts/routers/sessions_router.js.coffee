define [
  'jquery'
  'backbone'
  'bootstrap'
  'models/session'
  'helpers/layout'
  'helpers/alert_queue'
  'views/sessions/new_view'
  'models/password'
  'views/passwords/new_view'
  'models/new_password'
  'views/passwords/edit_view'
  'views/registrations/new_view'
  'models/registration'
  'models/confirmation'
  'views/confirmations/new_view'
  'models/new_confirmation'
  'views/common/alert_view'
  'i18n'
],
  
($, Backbone, App, Session, Layout, AlertQueue) ->
  class App.Routers.SessionsRouter extends Backbone.Router
    initialize: (options) ->
      @root  = $("#content")
      @user  = options.user
      @guest = options.guest
      @token = options.token
      @session = new Session(@user)
      @user.on('change', =>
        @session = new Session(@user)
        @token.fetch()
      )

    routes:
      "signup":               "newRegistration"
      "signin":               "newSession"
      "signout":              "destroy"
      "forgot":               "forgot"
      "forgot?token=:token":  "changePassword"
      "confirm?token=:token": "confirm"
      "confirm":              "newConfirmation"

    confirm: (token) ->
      Model = require 'models/confirmation'
      m = new Model()
      m.set('confirmation_token', token)
      m.save(null,
        success: (e) =>
          @user.id = e.id
          @user.fetch()
          AlertQueue.add({type: 'success', message: I18n.t('devise.confirmation.confirmed')})
          window.location.hash = "/posts"

        error: (e, jqXHR) =>
          AlertQueue.add({type: 'error', message: I18n.t('devise.failure.invalid_token')})
          window.location.hash = "/confirm"
      )

    newConfirmation: ->
      View = require 'views/confirmations/new_view'
      Model = require 'models/new_confirmation'
      @view = new View(model: new Model())
      Layout.setContent(@view)

    forgot: ->
      View = require 'views/passwords/new_view'
      Model = require 'models/password'
      @view = new View(model: new Model())
      Layout.setContent(@view)

    changePassword: (token) ->
      View = require 'views/passwords/edit_view'
      Model = require 'models/new_password'
      m = new Model()
      m.set('reset_password_token', token)
      @view = new View(model: m)
      Layout.setContent(@view)

    newRegistration: ->
      View = require 'views/registrations/new_view'
      Model = require 'models/registration'
      @view = new View(model: new Model(), user: @user)
      Layout.setContent(@view)

    newSession: ->
      View = require 'views/sessions/new_view'
      @view = new View(model: @session, user: @user, token: @token)
      Layout.setContent(@view)

    destroy: ->
      @session.destroy(
        success: (session, response) =>
          @user.set(@guest.attributes)
          AlertQueue.add({type: 'info', message: I18n.t('devise.sessions.signed_out')})
          window.location.hash = "/posts"
      )

