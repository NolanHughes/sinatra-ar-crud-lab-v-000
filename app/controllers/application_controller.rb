require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    "First page"
  end

  get '/posts/new' do
    erb :'new'
  end

  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:content])

    erb :'show'
  end

  get '/posts' do
    @posts = Post.all

    erb :'index'
  end

  get '/posts/:id' do
    @post = Post.find_by(params[:id])

    erb :'show'
  end

  get '/posts/:id/edit' do
    binding.pry
    @post_id = params(:id]
    # @post = params[:id])
    erb :'edit'
  end
end
