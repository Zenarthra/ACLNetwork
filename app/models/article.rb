class Article < ApplicationRecord
    
    
    validates :name, presence: true, length: { minimum: 5, maximum: 100 }
    validates :description, presence: true, length: { minimum: 5, maximum: 10000 }
    validates :user_id, presence: true
    default_scope -> {order(updated_at: :desc )}


belongs_to :user
has_many :article_categories
has_many :categories, through: :article_categories
has_many :comments

end