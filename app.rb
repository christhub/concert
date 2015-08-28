ENV['RACK_ENV'] = 'development'
require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/bands/') do
  @bands = Band.all
  erb(:bands)
end

post('/bands/new-band/') do
  name = params.fetch('name')
  new_band = Band.create(name: name)
  redirect('/bands/')
end
