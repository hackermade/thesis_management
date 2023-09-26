class AddGradesToTheses < ActiveRecord::Migration[6.0]
  def change
    add_column :theses, :grades, :string
  end
end
