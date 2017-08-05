class ArticlesController < ApplicationController
    
       before_action :set_article, only: [:show, :edit, :update]
       before_action :require_user, only: [:index, :show]
       before_action :require_same_user, only: [:edit, :update, :require_same_user, :destroy]
    
      def index
         
         @articles = Article.all.order("created_at DESC")
         @articles = Article.paginate(page: params[:page], per_page: 5)
         
      end
      
      def show
         @comment = Comment.new
         @comments = @article.comments.paginate(page: params[:page], per_page: 5)
      end
      
      def new
         @article = Article.new #Create a new new article object and store in the isntance variable
      end
      
      def create
         @article = Article.new(article_params)
         @article.user = current_user
         if @article.save
            flash[:success] = "Article was created successfully!"
            redirect_to article_path(@article)
         else
            render 'new'
         end
      end
      
         def edit 
            
         end
   
         def update
            
            if @article.update(article_params)
               flash[:success] = "Article was updated successfully!"
               redirect_to article_path(@article)
               else
               render 'edit'
            end
         end
         
         def destroy
                    Article.find(params[:id]).destroy
                    flash[:success] = "Article deleted successfully"
                    redirect_to articles_path
         end
   
      private #White listing, telling what we will pass in
         def article_params
            params.require(:article).permit(:name, :description, category_ids: []) 
            #article hash contains information from the form in view
            #in view, the form defines no hash called article but the form helper connects with the article model
            #Therefore we can get a hash called article same as model name with key and value info from form
         end
         
         def set_article
             @article = Article.find(params[:id])
         end
         
         def require_same_user
               @article = Article.find(params[:id])
            if current_user != @article.user and !current_user.admin?
               flash[:danger] = "You can only edit your own articles"
               redirect_to articles_path
               
            end
         end
         
end
