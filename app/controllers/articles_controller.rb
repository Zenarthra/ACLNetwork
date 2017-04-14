class ArticlesController < ApplicationController
    
   def index
      
      @articles = Article.all
      
   end
   
   def show
      @article = Article.find(params[:id]) #Params finds id from browser url request, eg when you click a link on article gets that id
   end
    
end