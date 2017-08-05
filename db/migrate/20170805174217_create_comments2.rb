class CreateComments2 < ActiveRecord::Migration[5.0]
  def change
    create_table :comments2s do |t|
      
    t.text :description
    t.integer :user_id
    t.integer :article_id
    t.timestamps
      
    end
  end
end
