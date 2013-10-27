App.LoginController = Ember.ArrayController.extend
  actions:
    login: ->
      window.firebaseAuth.login('facebook')
