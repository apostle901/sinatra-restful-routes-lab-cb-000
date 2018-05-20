class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end
  get '/recipes' do
    @recipes = Recipe.all
    erb :"/recipe/index"
  end
  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :"/recipe/show"
  end
  delete "/recipes/:id/delete" do
    Recipe.delete(params[:id])
    redirect to("/recipes")
  end
end
