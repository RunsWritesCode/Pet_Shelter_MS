require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )
require('date')
require_relative( './models/animal' )
require_relative( './models/owner' )


get '/animals' do # index
  @animals = Animal.all()
  erb( :"animals/index" )
end

get '/animals/available' do
  @animals = Animal.all_adoptable
  erb( :"animals/available" )
end

get '/animals/arrivals' do
  @animals = Animal.all_not_adoptable
  erb( :"animals/new_arrivals" )
end

get '/animals/new' do
  erb( :"animals/new" )
end

get '/owners/new' do
  erb( :"owners/new" )
end

get '/animals/adopted' do
  @owners = Owner.all
  erb( :"owners/index")
end

get '/animals/adopt' do
  @animals = Animal.all_adoptable
  @owners = Owner.all
  erb( :"animals/adopt")
end


get '/animals/:id' do #show
  @animal = Animal.find( params[:id])
  erb( :"animals/show" )
end

get '/animals/:id/edit' do # edit
  @animal = Animal.find( params[:id] )
  @owners = Owner.all
  erb( :"animals/edit" )
end


post '/animals' do # create
  @animal = Animal.new( params )
  @animal.save()
  redirect to "/animals"
end

post '/owners' do # create
  @owner = Owner.new( params )
  @owner.save()
  redirect to "/animals"
end

put '/animals/adopt' do # update
  animal = Animal.find( params[:animal_id].to_i)
  animal.adopt(params[:owner_id].to_i)
  animal.update
  redirect to "/animals"
end



put '/animals/:id' do # update
  params[:admission] = Date.parse(params[:admission])
  animal = Animal.new(params)
  animal.update
  redirect to '/animals'
end


delete '/animals/:id' do # delete
  animal = Animal.find( params[:id] )
  animal.delete()
  redirect to '/animals'
end
