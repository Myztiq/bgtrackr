window.AppRef = new Firebase('https://bgtrackr.firebaseIO.com')

initd = false
init = ()->
  if initd then return
  initd = true

  window.App = Ember.Application.create()
  App.Router.reopen
    location: 'history'

  App.Router.map ->
    @resource 'games', ->
      @route 'search'
    @resource 'login'
    @resource 'logout'

  require './routers/games.coffee'
  require './routers/login.coffee'
  require './routers/logout.coffee'


window.firebaseAuth = new FirebaseSimpleLogin AppRef, (err, user)->
  console.log user
  window.user = user
  init()
