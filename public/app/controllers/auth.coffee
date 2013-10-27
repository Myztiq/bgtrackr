App.AuthController = Ember.Controller.extend Ember.Evented,

  authed: false

  init: ->
    @hasInited = Ember.RSVP.Promise (resolve)=>
      @one 'auth', ->
        resolve()

    this.authClient = new FirebaseSimpleLogin window.AppRef, (err, user)=>
      if !err and user
        @set("authed", true)
        App.set('user',user)
        @trigger 'auth', true
      else
        @set("authed", false)
        App.set('user',null)
        @trigger 'auth', false

  redirectAuth: ->
    @hasInited.then =>
      if !@get('authed')
        @transitionToRoute('login')

  login: ->
    @one 'auth', (loggedIn)=>
      if loggedIn

        user = App.get('user')
        userRecord = new Firebase("https://bgtrackr.firebaseio.com/users/"+user.id+'/user')
        userRecord.set
          first_name: user.first_name
          last_name: user.last_name
          displayName: user.displayName
          id: user.id


        @transitionToRoute('/')

    @authClient.login('facebook')

  logout: ->
    @one 'auth', (loggedIn)=>
      if !loggedIn
        @transitionToRoute('login')

    @authClient.logout()
