class User < ApplicationRecord
   
   before_save { self.email = email.downcase } #Makes sure email is low case
   validates :author, presence: true, length: { maximum: 30 } #Author msut be present and length max 30
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i   
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    #Tests with the format, string comparison
                    uniqueness: { case_sensitive: false }
                    #Uniqueness not case senitive
                    
                    
   has_many :articles
  
    
end