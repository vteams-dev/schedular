class CreateCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :calendars do |t|
      t.string :title
      t.string :color
      t.references :owner, polymorphic: true, index: true

      t.timestamps
    end
  end
end