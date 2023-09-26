class AddGmailToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :gmail, :string
  end
end
