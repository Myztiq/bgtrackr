express = require 'express'
http = require 'http'
path = require 'path'
browserify = require('browserify-middleware')
coffeeify = require('coffeeify')
ember_handlebars = require('express-ember-handlebars')
request = require 'request'
{parseString} = require('xml2js')

browserify.settings('transform', [coffeeify])

app = express()

serverURL = 'localhost:3000'
if process.env.serverURL?
  serverURL = process.env.serverURL

app.configure ->
  app.use express.errorHandler()

  app.use(require('less-middleware')({ src: path.join __dirname, 'public' }));

  app.use express.favicon __dirname + '/public/images/favicon.ico'

  app.use('/components', express.static(__dirname + '/bower_components'))

  app.get '/app/app.js', browserify(__dirname + '/public/app/app.coffee')


  app.use "/templates.js", ember_handlebars __dirname + "/public/app/templates",
    exts: ['hbs','handlebars']

  app.use express.static __dirname + '/public'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router


app.options '/api/bgg/*', (req, res, next)->
  res.header 'Access-Control-Allow-Origin', '*'
  res.send 201

app.get '/api/bgg/*', (req, res, next)->
  request.get('http://www.boardgamegeek.com/xmlapi/'+req.params[0]).pipe(res)

app.get '*.html', (req, res)->
  res.sendfile(__dirname + '/public/index.html')

app.use (req, res)->
  res.status 404
  res.send '404 - Could not find resource'

http.createServer(app).listen process.env.PORT or 3000

console.log "Server running - on port " +(process.env.PORT or 3000)
