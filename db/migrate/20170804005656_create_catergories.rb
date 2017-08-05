class CreateCatergories < ActiveRecord::Migration[5.0]
  def change
    create_table :catergories do |t|
      
      t.string :name
      
    end
  end
end
