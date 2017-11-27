require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )

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
  erb( :edit )
end

put '/animals/:id' do # update
  Animal.new( params ).update
  redirect to '/animals'
end
