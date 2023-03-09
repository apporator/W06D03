class CreateUsers2 < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :username, null: false
      t.timestamps
    end

    add_index :users, :username, unique: true
  end
end
