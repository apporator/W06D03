class NewChanges < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :username, :text, unique: true
    
  end
end
