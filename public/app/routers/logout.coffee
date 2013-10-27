App.LogoutRoute = Ember.Route.extend
  beforeModel: ->
    delete window.user
    window.firebaseAuth.logout()
    @transitionTo('login')
