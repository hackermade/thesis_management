class AddStudentToTheses < ActiveRecord::Migration[6.0]
  def change
    add_reference :theses, :student, null: false, foreign_key: true
  end
end
