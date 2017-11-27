require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )
require('date')
require_relative( './models/animal' )
require_relative( './models/owner' )

# working
get '/animals' do # index
  @animals = Animal.all()
  erb( :index )
end

# working :)
get '/animals/show' do # show
  @animals = Animal.all()
  erb( :show )
end

get '/animals/new' do # new
  @animals = Animal.all
  erb( :new )
end

get '/animals/adopt' do
  @animals = Animal.all_adoptable
  @owners = Owner.all
  erb( :adopt)
end

get '/animals/:id' do # search
  @animal = Animal.find( params[:id] )
  erb( :search )
end

post '/animals' do # create
  @animal = Animal.new( params )
  @animal.save()
  redirect to "/animals"
end

get '/animals/:id/edit' do # edit
  @animal = Animal.find( params[:id] )
  @owners = Owner.all
  erb( :edit )
end

put '/animals/:id' do # update
  params[:admission] = Date.parse(params[:admission])
  animal = Animal.new(params)
  animal.update
  redirect to '/animals'
end

get '/animals/:id/profile' do # profile
  @animal = Animal.find( params[:id] )
  erb( :profile )
end
