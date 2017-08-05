require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create!(author: "Michael", email: "mashrur@example.com", password: "password", password_confirmation: "password")
    @article = Article.create(name: "vegetable saute", description: "great vegetable sautee, add vegetable and oil", user: @user)
    @article2 = @user.articles.build(name: "chicken saute", description: "great chicken dish")
    @article2.save
  end
  
  test "should get users show" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select "a[href=?]", article_path(@article), text: @article.name
    assert_select "a[href=?]", article_path(@article2), text: @article2.name
    assert_match @article.description, response.body
    assert_match @article2.description, response.body
    assert_match @user.username, response.body
  end


end
