require('sinatra')
require('sinatra/reloader')
require('./lib/contact')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/contacts') do
  # @title = (params.fetch('title1')).rps()
  erb(:contacts)
end
