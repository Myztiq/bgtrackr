require './../models/game.coffee'
require './../controllers/games/index.coffee'

App.GamesIndexRoute = Ember.Route.extend
  model: ()->
    EmberFire.Array.create
      ref: new Firebase("https://bgtrackr.firebaseio.com/users/"+App.get('user').id+'/games')