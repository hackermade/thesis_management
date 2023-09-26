class CreateGrades < ActiveRecord::Migration[6.0]
  def change
    create_table :grades do |t|
      t.integer :student_id
      t.integer :professor_id
      t.string :grade
      t.date :meeting_date

      t.timestamps
    end
  end
end
