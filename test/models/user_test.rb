require 'test_helper'

class UserTest < ActiveSupport::TestCase
    
    def setup
      @user = User.create!(author: "Michael", email: "Michael@example.com", password: "newpassword", password_confirmation: "newpassword")
    
    end
      
      test "password should be present" do
        @user.password = @user.password_confirmation = " "
        assert_not @user.valid?
      end
    
      test "password should be atleast 5 character" do
        @user.password = @user.password_confirmation = "x" * 4
        assert_not @user.valid?
      end
      
      test "test should be valid" do
          
          assert @user.valid?
          
      end
      
      test "author should be present" do 
         
         @user.author = " "
         assert_not @user.valid?
         #test should not pass if the condition is true, if pass means we have correct model
          
      end
      
      test "author should be less than 30 characters" do
         
          @user.author = "a" * 31
          assert_not @user.valid?
          
      end
      
      test "email should be present" do
      @user.email = " "
      assert_not @user.valid?
    end
    
    test "email should not be too long" do
      @user.email = "a" * 245 + "@example.com"
      assert_not @user.valid?
    end
    
    test "email should accept correct format" do
      valid_emails = %w[user@example.com MASHRUR@gmail.com M.first@yahoo.ca john+smith@co.uk.org] 
      #%w creates a word array seperated by white spaces
      valid_emails.each do |valids|
        @user.email = valids
        #Loop and stores all above email address in the test database
        assert @user.valid?, "#{valids.inspect} should be valid"
        # #{valids.inspect} just converts the objcet into string representation and displays, this will output all of objects data , pw, id etc
      end
    end
    
    test "should reject invalid addresses" do
      invalid_emails = %w[mashrur@example mashrur@example,com mashrur.name@gmail. joe@bar+foo.com]
      invalid_emails.each do |invalids|
        @user.email = invalids
        assert_not @user.valid?, "#{invalids.inspect} should be invalid"
      end
    end 
    
    test "email should be unique and case insensitive" do
      duplicate_author = @user.dup
      #created a duplicate of the object (uniqueness)
      duplicate_author.email = @user.email.upcase
      #assigned duplicate email to object email uppercase (case insensitive)
      @user.save
      #see if save
      assert_not duplicate_author.valid?
    end
      
      test "email should be lower case before hitting db" do
    mixed_email = "JohN@ExampLe.com" #Email with uppercase letter
    @user.email = mixed_email #Assigned databse email to uppercase mixed email
    @user.save #save email to database
    assert_equal mixed_email.downcase, @user.reload.email #compares the 2 emails
  end
      
      
end