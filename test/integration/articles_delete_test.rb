require 'test_helper'

class ArticlesDeleteTest < ActionDispatch::IntegrationTest
  
  
  def setup
  @user = User.create!(author: "mashrur", email: "mashrur@example.com")
  @article = Article.create(name: "vegetable saute", description: "great vegetable sautee, add vegetable and oil", user: @user)
  end

      test "successfully delete a article" do
            get article_path(@article)
            assert_template 'articles/show'
            assert_select 'a[href=?]', article_path(@article), text: "Delete this article"
            assert_difference 'article.count', -1 do
              delete article_path(@article)
        end
            assert_redirected_to articles_path
            assert_not flash.empty?
      end
      

  
end
