require './../models/game.coffee'
require './../controllers/games.coffee'

BGTrackr.Router.map ->
  @resource 'games',
    path: '/'

BGTrackr.GamesRoute = Ember.Route.extend
  model: ()->
    EmberFire.Array.create
      ref: new Firebase("https://bgtrackr.firebaseio.com/games")