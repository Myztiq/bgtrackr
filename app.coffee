express = require 'express'
http = require 'http'
path = require 'path'
coffeescript = require('connect-coffee-script')

app = express()

serverURL = 'localhost:3000'
if process.env.serverURL?
  serverURL = process.env.serverURL


app.configure ->
  app.use express.errorHandler()

  app.use coffeescript(src: path.join __dirname, 'public')

  app.use(require('less-middleware')({ src: path.join __dirname, 'public' }));

  app.use express.favicon __dirname + '/public/images/favicon.ico'

  app.use('/components', express.static(__dirname + '/bower_components'))

  app.use express.static __dirname + '/public'

  app.use require('connect-assets')
      src: path.join __dirname, 'public'

  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router

app.use (req, res)->
  res.status 404
  res.send '404 - Could not find resource'

http.createServer(app).listen process.env.PORT or 3000

console.log "Server running - on port " +(process.env.PORT or 3000)
