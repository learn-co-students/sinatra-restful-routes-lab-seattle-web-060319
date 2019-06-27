class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/new' do
    erb :new
  end

  post '/recipe' do
    @recipe = Recipe.create(params[:name], params[:ingredients], params[:cook_time])
    erb :show
  end

  #display a single recipe SHOW.ERB
  get '/show' do
    erb :show
  end
  #edit 1 recipe then redirect to show.erb
  get '/recipes/:id/edit' do  #load edit form
    @recipe = Article.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do #edit action
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.name = params[:name]
  @recipe.ingredients = params[:ingredients]
  @recipe.cook_time = params[:cook_time]
  @recipe.save
  redirect to "/recipes/#{@recipe.id}"
end
  #displays all recipes index.erb
  get '/recipes' do
  @recipes = Recipe.all
  erb :index
end

  #deletes a recipe then redirects to index.ERB
  delete '/recipes/:id/delete' do #delete action
   @recipe = Recipe.find_by_id(params[:id])
   @recipe.delete
   redirect to '/recipes'
 end

end
