define [
  'backbone'
  'bootstrap'
  'models/post'
  'collections/paginated'
],
(Backbone, App, Post, PaginatedCollection) ->
  class App.Collections.Posts extends PaginatedCollection
    model: Post
    baseUrl: '/posts'
