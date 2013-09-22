# encoding: UTF-8
require 'sinatra/base'

class SongsController < AppController
  get '' do
    @songs = Song.all
    haml :songs
  end

  get '/new' do
    @song = Song.new
    haml :new_song
  end

  post '' do
    song = Song.create(params[:song])
    redirect to("/#{song._id}")
  end

  get '/:id' do 
    @song = Song.find(params[:id])
    haml :show_song
  end

  get '/:id/edit' do
    @song = Song.find(params[:id])
    haml :edit_song
  end

  put '/:id' do
    song = Song.find(params[:id])
    song.update_attributes(params[:song])
    redirect to("/#{song._id}")
  end

  delete '/:id' do
    Song.find(params[:id]).destroy
    redirect to('')
  end
end