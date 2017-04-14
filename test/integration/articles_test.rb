require 'test_helper'

class ArticlesTest < ActionDispatch::IntegrationTest
  
  def setup
  @user = User.create!(author: "mashrur", email: "mashrur@example.com")
  @article = Article.create(name: "vegetable saute", description: "great vegetable sautee, add vegetable and oil", user: @user)
  @article2 = @user.articles.build(name: "chicken saute", description: "great chicken dish")
  @article2.save
  end
  
  test "should get articles show" do
  get article_path(@article)  #instance variable with the id of the object
  assert_template 'articles/show' #Show up in show
  assert_match @article.name, response.body #Check for the name of the article
  assert_match @article.description, response.body
  assert_match @user.author, response.body
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
