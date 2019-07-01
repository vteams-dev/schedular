class CreateCalenders < ActiveRecord::Migration[6.0]
  def change
    create_table :calenders do |t|
      t.string :title
      t.integer :owner_id
      t.string :owner_type

      t.timestamps
    end
    add_index :Calenders, [:owner_type, :owner_id]
  end
end
