class AddFileToThesis < ActiveRecord::Migration[6.0]
  def change
    add_column :theses, :file, :binary
  end
end
