ENV['RACK_ENV'] = 'development'
require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end


####### VENUES #######

get('/venues/') do
  @venues = Venue.all
  erb(:venues)
end

post('/venues/new-venue/') do
  name = params.fetch('name')
  new_venue = Venue.new(name: name)
  if new_venue.save
    redirect('/venues/')
  else
    erb(:errors)
  end
end

get('/venues/:id/') do
  @bands = Band.all
  @venues = Venue.all
  @venue = Venue.find(params.fetch('id').to_i)
  erb(:venue)
end

delete('/venues/delete-venue/') do
  venue = Venue.find(params.fetch('id').to_i)
  venue.destroy
  redirect('/venues/')
end

###### BANDS #######

get('/bands/') do
  @bands = Band.all
  erb(:bands)
end

get('/bands/:id/') do
  @bands = Band.all
  @band = Band.find(params.fetch('id').to_i)
  @venues = Venue.all
  erb(:band)
end

post('/bands/new-band/') do
  name = params.fetch('name')
  new_band = Band.new(name: name)
  if new_band.save
    redirect('/bands/')
  else
    erb(:errors)
  end
end

delete('/bands/delete-band/') do
  band = Band.find(params.fetch('id').to_i)
  band.destroy
  redirect('/bands/')
end

patch('/bands/update-band/') do
  band = Band.find(params.fetch('id').to_i)
  name = params.fetch('updated_band_name')
  if name == ""
    redirect("/bands/#{band.id}/")
  end
  band.update({name: name})
  redirect("/bands/#{band.id}/")
end

patch('/bands/update-venue/') do
  band = Band.find(params.fetch('id').to_i)
  band_venues = band.venues
  saved_venues = []
  band_venues.each do |band_venue|
    saved_venues << band_venue.id.to_s
  end
  venue_ids = params.fetch('venue')
  venue_ids = venue_ids - saved_venues
  venue_ids.each do |venue_id|
    venue = Venue.find(venue_id.to_i)
    band.venues.push(venue)
  end
  redirect("/bands/#{band.id}/")
end
