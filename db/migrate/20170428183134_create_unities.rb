class CreateUnities < ActiveRecord::Migration[5.0]
  def change
    create_table :unities do |t|
      t.string :name, null: false
      t.belongs_to :client, foreign_key: true, index: true, null: false
      t.timestamps
    end
  end
end
