getBGGGame = (id)->
  $.ajax
    type: 'GET'
    url: '/api/bgg/boardgame/'+id
    success: (body)->
      game = $(body)
      rtn =
        name: game.find('name[primary="true"]').text()
      rtn
    error: ()->
      console.log 'Could not load BGG Game with id '+id

window.BGTrackr.BggGame = DS.Model.extend
  name: ''