class CreateTheses < ActiveRecord::Migration[6.0]
  def change
    create_table :theses do |t|
      t.string :title
      t.date :start_date
      t.string :implementation_languages
      t.string :technologies
      t.string :status
      t.string :zip_file
      t.integer :professor_id

      t.timestamps
    end
  end
end
