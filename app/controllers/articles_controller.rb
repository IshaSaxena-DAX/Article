class ArticlesController < ApplicationController
    #Actions are methods defined within the controller class
   def show
     # byebug= Execution will pause here, allowing you to inspect variables and step through code
    @article = Article.find(params[:id]) # we need to create instance variable
   end
   def index
    @articles = Article.all
   end
   def new
    @article= Article.new
   end
   def edit
    @article = Article.find(params[:id])
   end
   def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article 
    else
      render 'new'
    end
  end
  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'  # This should render the `edit.html.erb` view with errors
    end
  end
  

   def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
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