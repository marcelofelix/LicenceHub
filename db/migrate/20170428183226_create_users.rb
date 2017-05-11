class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :role, null: false, default: :client_user
      t.belongs_to :client, foreign_key: true, index: true, null: false
      t.timestamps
      t.index :email, unique: true
    end
  end
end
