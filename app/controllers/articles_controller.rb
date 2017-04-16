class ArticlesController < ApplicationController
    
      def index
         
         @articles = Article.all.order("created_at DESC")
         
      end
      
      def show
         
         @article = Article.find(params[:id]) #Params finds id from browser url request, eg when you click a link on article gets that id
      
      end
      
      def new
         
         @article = Article.new #Create a new new article object and store in the isntance variable
         
      end
      
      def create
         @article = Article.new(article_params)
         @article.user = User.first
         if @article.save
            flash[:success] = "Article was created successfully!"
            redirect_to article_path(@article)
         else
            render 'new'
         end
      end
      
         def edit
               @article = Article.find(params[:id])
         end
   
         def update
               @article = Article.find(params[:id])
            if @article.update(article_params)
               flash[:success] = "Article was updated successfully!"
               redirect_to article_path(@article)
               else
               render 'edit'
            end
         end
         
         def destroy
                    Article.find(params[:id]).destroy
                    flash[:success] = "article deleted successfully"
                    redirect_to articles_path
         end
   
      private #White listing, telling what we will pass in
         def article_params
            params.require(:article).permit(:name, :description) 
            #article hash contains information from the form in view
            #in view, the form defines no hash called article but the form helper connects with the article model
            #Therefore we can get a hash called article same as model name with key and value info from form
         end
end