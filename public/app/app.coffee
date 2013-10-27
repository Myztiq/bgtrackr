window.BGTrackr = Ember.Application.create()

bgTrackrRef = new Firebase('https://bgtrackr.firebaseIO.com')
auth = new FirebaseSimpleLogin bgTrackrRef, (err, user)->
  if user
    console.log user
  else
    console.log 'Not logged in'

#auth.login('facebook')

require './routers/games.coffee'