class Article < ApplicationRecord
    
    validates :name, presence: true, length: { minimum: 5, maximum: 100 }
    validates :description, presence: true, length: { minimum: 5, maximum: 500 }
    validates :user_id, presence: true


belongs_to :user

end