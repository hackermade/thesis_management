# db/migrate/2023XXXXXXXX_add_encrypted_password_to_professors.rb

class AddEncryptedPasswordToProfessors < ActiveRecord::Migration[6.0]
  def change
    add_column :professors, :encrypted_password, :string, null: false, default: ""
  end
end
