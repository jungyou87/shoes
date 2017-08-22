class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :product
      t.references :user, index: true, foreign_key: true
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
