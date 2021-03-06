class CategoriesController < ApplicationController
  
    before_action :set_category, only: [:edit, :update]
    before_action :require_admin, except: [:show, :index]
    
        def new
            @category = Category.new
        end
  
        def create
            @category = Category.new(category_params)
            if @category.save
                flash[:success] = "Category successfully created!"
                redirect_to category_path(@category)
            else
                render 'new'
            end
        end
      
        def edit
            
        end
      
        def update
            if @category.update(category_params)
              flash[:success] = "Category name was updated successfully"
              redirect_to @category
            else
              render 'edit'
            end
        end
      
        def show
          @category = Category.find(params[:id])
          @category_articles = @category.articles.paginate(page: params[:page], per_page: 5)
        end
      
        def index
          @categories = Category.paginate(page: params[:page], per_page: 5)
        end
        
        
        def destroy
        
        end
        
        private
        
        def set_category
            @category = Category.find(params[:id])
        end
        
        def category_params
            params.require(:category).permit(:name)
        end
        
        def require_admin
            if !logged_in? || (logged_in? and !current_user.admin?)
              flash[:danger] = "Only admin users can perform that action"
              redirect_to categories_path
            end
        end
  
    
end