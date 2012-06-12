define ['backbone', 'underscore', 'bootstrap'], (Backbone, _, App) ->
  class App.Models.User extends Backbone.Model
    paramRoot: 'user'
    urlRoot: '/users'
    hasRole: (role) ->
      _(@get("roles")).include(role)
