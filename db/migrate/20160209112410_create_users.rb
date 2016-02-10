class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.index  :email
      t.string :password
      t.string :password_digest
      t.integer :role, null: false, default: 0
      t.index  :role

      t.timestamps
    end
  end
end
