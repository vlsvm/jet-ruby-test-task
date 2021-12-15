class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :patronymic
      t.string :phone_number
      t.string :email
      t.integer  :weight
      t.integer  :lenght
      t.integer  :width
      t.integer  :height
      t.string :from
      t.string :to
      t.float :distance
      t.float :price

      t.timestamps
    end
  end
end
