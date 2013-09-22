require 'sinatra'
require 'sinatra/reloader' if development?

require 'haml'
require 'mongoid'

configure do
  Mongoid.load!("./mongoid.yml")
end

require './song'
require './page'

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

get '/pages' do
  @pages = Page.all
  @title = "Simple CMS: Page List"
  haml :pages
end

get '/pages/new' do
  @page = Page.new
  haml :new_page
end

post '/pages' do
   page = Page.create(params[:page])
   redirect to("/pages/#{page._id}")
end

get '/pages/:id' do
  @page = Page.find(params[:id])
  @title = @page.title
  haml :show_page
end

get '/pages/:id/edit' do
  @page = Page.find(params[:id])
  haml :edit_page
end

put '/pages/:id' do
  page = Page.find(params[:id])
  page.update_attributes(params[:page])
  redirect to("/pages/#{page._id}")
end

delete '/pages/:id' do
  Page.find(params[:id]).destroy
  redirect to('/pages')
end
