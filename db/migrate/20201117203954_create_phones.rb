class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
      t.string :brand
      t.string :model
      t.string :size
      t.string :colour
      t.text :specifications
      t.string :image_url
      t.decimal :price, precision: 8, scale: 2
    end
  end
end
