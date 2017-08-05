require 'test_helper' #Requires the test helper in test models


class ArticleTest < ActiveSupport::TestCase
  
  def setup #This is the intial conditions
    @user = User.create!(author: "mashrur", email: "Michael@Hotmail.co.uk", password: "newpassword", password_confirmation: "newpassword") #Add this after belongs to and has many
    @article = @user.articles.build(name: "Random article", description: "This is a random article")  #Making the association between tables and build i used for that instead of new
  end
  
  test "article without user should be invalid" do
      @article.user_id = nil
      assert_not @article.valid?
    end
  
  test "article should be valid" do #This is the name of the test and assertion type
    assert @article.valid? #When belongs to and has many are assigned, this test will fail because article depends on users, so we add user and make association in table in above setup
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
  
  test "description shouldn't be more than 10000 characters" do
    @article.description = "a" * 10001
    assert_not @article.valid?
  end
end