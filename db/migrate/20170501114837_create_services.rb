class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.string :periodicity, null: false
      t.belongs_to :account, foreign_key: true, index: true, null: false
      t.timestamps
    end
  end
end
