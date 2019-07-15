class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :email
      t.string :name
      t.integer :phone

      t.timestamps
    end
  end
end
