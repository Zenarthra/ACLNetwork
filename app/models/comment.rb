class Comment < ApplicationRecord
    
    validates :description, presence: true, length: { minimum: 4, maximum: 140 }
    validates :user_id, presence: true
    validates :article_id, presence: true
    
    belongs_to :user
    belongs_to :article 
    default_scope -> { order(updated_at: :desc)}
    
end