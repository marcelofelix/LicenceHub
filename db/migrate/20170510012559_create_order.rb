class CreateOrder < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.date :valid_until, null: false
      t.belongs_to :unity, foreign_key: true, index: true, null: false
      t.belongs_to :service, foreign_key: true, index: true, null: false
      t.timestamps
    end
  end
end
