require 'test_helper'

class TestUsername < ActionDispatch::IntegrationTest
    
    def setup
       @user = User.create!(username: "test", email: "test@example.com", password: "password", password_confirmation: "password")
    end
        
    test "username should be present and equal to test" do
        
        if @user.username = "test"
            puts "true"
        end
    end
    

    
    
end