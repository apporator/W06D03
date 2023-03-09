class CreateUsers2 < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :username, null: false, unique: true

      
      t.timestamps
    end
  end
end
