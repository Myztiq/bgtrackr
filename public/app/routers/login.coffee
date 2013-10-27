require '../controllers/login.coffee'

App.LoginRoute = Ember.Route.extend
  beforeModel: ->
    if window.user?
      @transitionTo('games')
