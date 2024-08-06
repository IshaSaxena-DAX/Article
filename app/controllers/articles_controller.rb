class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]  

   def show
    # @article = Article.find(params[:id]) # we need to create instance variable
   end

   def index
    @articles = Article.all
   end

   def new
    @article= Article.new
   end

   def edit
    # @article = Article.find(params[:id]) #Finds the specific article record by its ID
   end

   def create
   # @article = Article.new(params.require(:article).permit(:title, :description))
   @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article 
    else
      render 'new'
    end
  end
  
  def update
    # @article = Article.find(params[:id])
    #if @article.update(params.require(:article).permit(:title, :description))
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article #This Rails path helper generates the URL for the show action of the ArticlesController
    else
      
      render 'edit', status: :unprocessable_entity  # This should render the `edit.html.erb` view with errors
    end
  end
  

   def destroy
    # @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path #This Rails path helper generates the URL for the index action of the ArticlesController
   end


   private

   #DRY 
   def set_article
     @article = Article.find(params[:id])
   end
 
   def article_params
     params.require(:article).permit(:title, :description)
   end
 

end
=begin
controllerr file: 
     It typically contains actions (methods) that correspond to different routes.
     the controller file is responsible for handling the incoming HTTP requests, 
     interacting with the model, and determining which view to render.
params:
    A method to access the full set of parameters from the request.
    It returns a hash-like object containing all request data.
    Params allows you to access request data directly within your controller actions.
    This includes data sent via URL, form submissions, and query strings.
=end