class AddEncryptedPasswordToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :encrypted_password, :string
  end
end
