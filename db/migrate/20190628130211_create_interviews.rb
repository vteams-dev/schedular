class CreateInterviews < ActiveRecord::Migration[6.0]
  def change
    create_table :interviews do |t|
      t.string :description
      t.string :interviewee
      t.string :interviewers
      t.string :methods
      t.references  :event, foreign_key: true
      t.timestamps
    end

  end
end
