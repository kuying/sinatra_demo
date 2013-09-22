# encoding: UTF-8
require 'sinatra/base'

class PagesController < AppController
  get '' do
    @pages = Page.all
    @title = "Simple CMS: Page List"
    haml :pages
  end

  get '/new' do
    @page = Page.new
    haml :new_page
  end

  post '' do
     page = Page.create(params[:page])
     redirect to("/#{page._id}")
  end

  get '/:id' do
    @page = Page.find(params[:id])
    @title = @page.title
    haml :show_page
  end

  get '/:id/edit' do
    @page = Page.find(params[:id])
    haml :edit_page
  end

  put '/:id' do
    page = Page.find(params[:id])
    page.update_attributes(params[:page])
    redirect to("/#{page._id}")
  end

  delete '/:id' do
    Page.find(params[:id]).destroy
    redirect to('')
  end

end