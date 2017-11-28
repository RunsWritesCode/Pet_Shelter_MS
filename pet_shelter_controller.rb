require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )
require('date')
require_relative( './models/animal' )
require_relative( './models/owner' )


get '/animals' do # index
  @animals = Animal.all()
  erb( :index )
end

get '/animals/new' do
  @animals = Animal.all()
  erb( :new )
end

get '/animals/adopt' do
  @animals = Animal.all_adoptable
  @owners = Owner.all
  erb( :adopt)
end

get '/animals/owners' do
  @animals = Animal.all
  @owners = Owner.all
  erb( :owners)
end

get '/animals/:id' do #show
  @animal = Animal.find( params[:id])
  erb( :show )
end

get '/animals/:id/edit' do # edit
  @animal = Animal.find( params[:id] )
  @owners = Owner.all
  erb( :edit )
end

post '/animals' do # create
  @animal = Animal.new( params )
  @animal.save()
  redirect to "/animals"
end

put '/animals/adopt' do # update
  animal = Animal.find( params[:animal_id].to_i)
  animal.owner_id = params[:owner_id].to_i
  animal.update
  redirect to "/animals"
end

put '/animals/:id' do # update
  params[:admission] = Date.parse(params[:admission])
  animal = Animal.new(params)
  animal.update
  redirect to '/animals'
end

delete '/animals/:id' do
  redirect to '/animals'
end
