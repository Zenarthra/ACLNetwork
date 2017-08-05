require 'test_helper'

class ArticlesTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = User.create!(author: "Michael", email: "mashrur@example.com", password: "password", password_confirmation: "password")
    @article = Article.create!(name: "vegetable saute", description: "great vegetable sautee, add vegetable and oil", user: @user)
    @article2 = @user.articles.build(name: "chicken saute", description: "great chicken dish")
    @article2.save
  end
  
  test "reject invalid article submissions" do
    get new_article_path
    assert_template 'articles/new'
    assert_no_difference 'Article.count' do
    post article_path, params: { Article: { name: " ", description: " " } } #post to article path with hash key and value
  end
    assert_template 'articles/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  
  
   test "create new valid article" do
      get new_article_path
      assert_template 'articles/new'
      name_of_article = "Random article"
      description_of_article = "This is the description of the random article"
      assert_difference 'Article.count', 1 do
          post article_path, params: { Article: { name: name_of_article, description: description_of_article}}
      end
    
      follow_redirect!
      assert_match name_of_article.capitalize, response.body
      assert_match description_of_article, response.body
    end
  
  
  test "should get articles show" do
    get article_path(@article)  #instance variable with the id of the object
    assert_template 'articles/show' #Show up in show
    assert_match @article.name, response.body #Check for the name of the article
    assert_match @article.description, response.body
    assert_match @user.author, response.body
    assert_select 'a[href=?]', edit_article_path(@article), text: "Edit this article"
    assert_select 'a[href=?]', article_path(@article), text: "Delete this article"
    assert_select 'a[href=?]', articles_path, text: "Return to articles listing"
  end

  test "should get articles index" do
    
    get articles_url #Want to get to articles url
    assert_response :success
    
  end
  
  test "should get Articles listing" do
    get articles_path
    assert_template 'articles/index' #Want the listing to show up in index
    assert_match @article.name, response.body #Show up in the body of the index
    assert_match @article2.name, response.body
  end

end
