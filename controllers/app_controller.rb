# encoding: UTF-8
require 'sinatra/base'

class AppController < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), "..")
  set :public_folder, Proc.new { File.join(root, "public") }
  set :views, Proc.new { File.join(root, "views") }
  
  enable :logging, :method_override
  
  register Sinatra::Reloader if development?
  
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

end

