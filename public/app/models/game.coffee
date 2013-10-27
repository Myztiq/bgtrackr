require './bggGame.coffee'

App.Game = DS.Model.extend
  title: DS.attr('string')
  bggGame: DS.belongsTo('bggGame')