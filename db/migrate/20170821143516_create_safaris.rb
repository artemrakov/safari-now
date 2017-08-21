class CreateSafaris < ActiveRecord::Migration[5.0]
  def change
    create_table :safaris do |t|
      t.string :title
      t.string :location
      t.integer :price
      t.text :description
      t.integer :capacity
      t.references :user, foreign_key: true
      t.string :date

      t.timestamps
    end
  end
end
