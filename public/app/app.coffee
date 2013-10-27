window.AppRef = new Firebase('https://bgtrackr.firebaseIO.com')

window.App = Ember.Application.create()

require './controllers/auth.coffee'
require './routers/games.coffee'
require './routers/login.coffee'
require './routers/logout.coffee'

App.Router.reopen
  location: 'history'

App.Router.map ->
  @resource 'games', ->
    @route 'search'
  @resource 'login'
  @resource 'logout'

App.ApplicationController = Ember.Controller.extend
  needs: 'auth'

App.ApplicationRoute = Ember.Route.extend
  beforeModel: (transition)->
    if transition.targetName != 'login'
      @controllerFor('auth').redirectAuth()

