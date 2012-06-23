
define [
  'jquery'
  'backbone'
  'bootstrap'
], ($, Backbone, App) ->
  class Layout
    setContent: (content) ->
      do @currentContent.close if @currentContent?
      @currentContent = content
      ($ '#content').html content.render().el

  App.Helpers.Layout = new Layout
