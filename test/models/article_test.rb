require 'test_helper' #Requires the test helper in test models


class ArticleTest < ActiveSupport::TestCase
  
  def setup #This is the intial conditions
    @article = Article.new(name: "Random article", description: "This is a random article")  
  end
  
  test "article should be valid" do #This is the name of the test and assertion type
    assert @article.valid?
  end  
  
  test "name should be present" do
    @article.name = " "
    assert_not @article.valid? #This just means that we dont want it to be valid if the above condiiton is true
  end
  
  test "description should be present" do
    @article.description = " "
    assert_not @article.valid?
  end
  
  test "description shouldn't be less than 5 characters" do
    @article.description = "a" * 3
    assert_not @article.valid?
  end
  
  test "description shouldn't be more than 500 characters" do
    @article.description = "a" * 501
    assert_not @article.valid?
  end
end