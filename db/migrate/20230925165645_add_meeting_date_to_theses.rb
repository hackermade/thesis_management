class AddMeetingDateToTheses < ActiveRecord::Migration[6.0]
  def change
    add_column :theses, :meeting_date, :string
  end
end
