BGTrackr.GamesController = Ember.ArrayController.extend
  actions:
    createGame: ->
      # Get the game title set by the "New Title" text field
      title = @get('newTitle');
      if !title.trim() then return

      @pushObject
        title: title

      @set('newTitle', '')