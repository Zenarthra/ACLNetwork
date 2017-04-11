class AddUserIdToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :user_id, :integer #This is the foreign key which is always type integer
    
  end
end
