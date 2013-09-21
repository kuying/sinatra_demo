require 'sinatra'
require 'sinatra/reloader' if development?

require 'haml'
require 'mongoid'
Mongoid.load!("mongoid.yml")

require './song.rb'

set :public_folder, 'assets'
set :views, 'templates'

get '/' do
  haml :home
end

get '/about' do
  haml :about
end

get '/contact' do
  haml :contact
end

not_found do
  haml :not_found
end

get '/songs' do
  @songs = Song.all
  haml :songs
end

get '/songs/new' do
  @song = Song.new
  haml :new_song
end

post '/songs' do
  song = Song.create(params[:song])
  redirect to("/songs/#{song._id}")
end

get '/songs/:id' do 
  @song = Song.find(params[:id])
  haml :show_song
end

get '/songs/:id/edit' do
  @song = Song.find(params[:id])
  haml :edit_song
end

put '/songs/:id' do
  song = Song.find(params[:id])
  song.update_attributes(params[:song])
  redirect to("/songs/#{song._id}")
end

delete '/songs/:id' do
  Song.find(params[:id]).destroy
  redirect to('/songs')
end