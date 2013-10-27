App.LogoutRoute = Ember.Route.extend
  beforeModel: ->
    delete window.user
    @controllerFor('auth').logout()