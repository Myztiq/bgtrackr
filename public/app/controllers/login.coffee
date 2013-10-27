App.LoginController = Ember.Controller.extend
  needs: 'auth'
  actions:
    login: ->
      @get('controllers.auth').login()