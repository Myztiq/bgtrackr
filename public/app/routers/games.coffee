require './../models/game.coffee'
require './../controllers/games.coffee'

App.GamesRoute = Ember.Route.extend
  beforeModel: ->
    if !window.user?
      @transitionTo('login')

  model: ()->
    EmberFire.Array.create
      ref: new Firebase("https://bgtrackr.firebaseio.com/games")