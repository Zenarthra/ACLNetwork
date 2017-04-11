class Article < ApplicationRecord
    
    validates :name, presence: true, length: { minimum: 5, maximum: 100 }
    validates :description, presence: true, length: { minimum: 5, maximum: 3000 }


end