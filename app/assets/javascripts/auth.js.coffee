$ ->
  @view = new BackboneTwitterBootstrap.Views.Devise.LoginBar(model: window.currentUser)
  $("#add-bar").html(@view.render().el)
