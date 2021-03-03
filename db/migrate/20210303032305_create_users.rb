class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, limit: 60

      t.timestamps null: false

      t.index :email, unique: true
    end
  end
end
