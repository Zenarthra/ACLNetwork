require 'test_helper'

class ArticlesEditTest < ActionDispatch::IntegrationTest
  
    def setup
        @user = User.create!(author: "mashrur", email: "mashrur@example.com", password: "newpassword", password_confirmation: "newpassword")
        @article = Article.create(name: "vegetable saute", description: "great vegetable sautee, add vegetable and oil", user: @user)
    end

    test "reject invalid article update" do
        get edit_article_path(@article)
        assert_template 'articles/edit'
        patch article_path(@article), params: { article: { name: " ", description: "some description" } } 
        assert_template 'articles/edit'
        assert_select 'h2.panel-title'
        assert_select 'div.panel-body'
    end
    
    test "successfully edit a article" do
        get edit_article_path(@article)
        assert_template 'articles/edit'
        updated_name = "updated article name"
        updated_description = "updated article description"
        patch article_path(@article), 
    
                           params: { article: { name: updated_name, 
    
                                       description: updated_description } }
        assert_redirected_to @article
        #follow_redirect!
        assert_not flash.empty?
        @article.reload
        assert_match updated_name, @article.name
        assert_match updated_description, @article.description
  end
end
