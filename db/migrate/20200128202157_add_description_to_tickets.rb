class AddDescriptionToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :description, :string
  end
end
