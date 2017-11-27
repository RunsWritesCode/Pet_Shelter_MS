require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )

require_relative( './models/animal' )
require_relative( './models/owner' )

get '/animals' do # index
  @animals = Animal.all()
  erb( :index )
end

get '/animals' do # show
  @animals = Animal.all()
  erb( :show )
end

get '/animals/new' do # new
  @name = Name.all
  @owner = Owner.all
  erb( :new )
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
  # @owner = Owner.all
  erb( :edit )
end

put '/animals/:id' do # update
  Animal.new( params ).update
  redirect to '/animals'
end
