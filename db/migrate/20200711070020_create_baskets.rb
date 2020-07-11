class CreateBaskets < ActiveRecord::Migration[6.0]
  def change
    create_table :baskets do |t|
      t.text :description
      t.boolean :availability
      t.string :title
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
