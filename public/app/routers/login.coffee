require '../controllers/login.coffee'

App.LoginRoute = Ember.Route.extend
  beforeModel: ->
    if @controllerFor('auth').get('authed')
      @transitionToRoute('games')
