require './models/game.coffee'

window.BGTrackr.Router.map ->
  @resource 'games',
    path: '/'

BGTrackr.GamesRoute = Ember.Route.extend
  model: ()->
    @store.find('game')