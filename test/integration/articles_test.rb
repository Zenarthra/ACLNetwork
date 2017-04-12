require 'test_helper'

class ArticlesTest < ActionDispatch::IntegrationTest
  
  def setup
  @user = User.create!(author: "mashrur", email: "mashrur@example.com")
  @article = Article.create(name: "vegetable saute", description: "great vegetable sautee, add vegetable and oil", user: @user)
  @article2 = @user.articles.build(name: "chicken saute", description: "great chicken dish")
  @article2.save
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
