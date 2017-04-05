require 'test_helper'

class PagesTest < ActionDispatch::IntegrationTest
  
  test "This is testing the root" do
    
    get root_url
    assert_response :success
    
  end
  
end
