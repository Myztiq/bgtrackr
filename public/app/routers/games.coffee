require './../models/game.coffee'
require './../controllers/games.coffee'

App.GamesRoute = Ember.Route.extend
  model: ()->
    EmberFire.Array.create
      ref: new Firebase("https://bgtrackr.firebaseio.com/users/"+App.get('user').id+'/games')