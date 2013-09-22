require './boot.rb'

map '/songs' do
  run SongsController.new
end

map '/pages' do
  run PagesController.new
end

map '/' do
  run AppController.new
end
