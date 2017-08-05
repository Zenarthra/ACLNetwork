class DropTableComments2 < ActiveRecord::Migration[5.0]
  def change
    
    drop_table :comments2s
    
  end
end
