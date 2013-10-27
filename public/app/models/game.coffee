require './bggGame.coffee'

BGTrackr.Game = DS.Model.extend
  title: DS.attr('string')
  bggGame: DS.belongsTo('bggGame')