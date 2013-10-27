App.AuthController = Ember.Controller.extend Ember.Evented,

  authed: false

  init: ->
    @hasInited = Ember.RSVP.Promise (resolve)=>
      @one 'auth', ->
        resolve()

    this.authClient = new FirebaseSimpleLogin window.AppRef, (err, user)=>
      if !err and user
        @set("authed", true)
        @trigger 'auth', true
      else
        @set("authed", false)
        @trigger 'auth', false

  redirectAuth: ->
    @hasInited.then =>
      if !@get('authed')
        @transitionToRoute('login')

  login: ->
    @one 'auth', (loggedIn)=>
      if loggedIn
        @transitionToRoute('/')

    @authClient.login('facebook')

  logout: ->
    @one 'auth', (loggedIn)=>
      if !loggedIn
        @transitionToRoute('login')

    @authClient.logout()
