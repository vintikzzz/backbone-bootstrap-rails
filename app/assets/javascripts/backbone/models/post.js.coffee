class BackboneTwitterBootstrap.Models.Post extends Backbone.Model
  paramRoot: 'post'

  defaults:
    title: null
    content: null

class BackboneTwitterBootstrap.Collections.PostsCollection extends Backbone.Collection
  model: BackboneTwitterBootstrap.Models.Post
  url: '/posts'
