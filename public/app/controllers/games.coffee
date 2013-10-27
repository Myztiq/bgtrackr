BGTrackr.GamesController = Ember.ArrayController.extend
  actions:
    createGame: ->
      # Get the game title set by the "New Title" text field
      title = @get('newTitle');
      if !title.trim() then return

      # Create the new Todo model
      game = @store.createRecord 'game',
        title: title

      @set('newTitle', '')
      game.save();