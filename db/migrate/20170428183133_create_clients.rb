class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.boolean :provider, null: false, index: true, default: false
      t.timestamps
    end
  end
end
