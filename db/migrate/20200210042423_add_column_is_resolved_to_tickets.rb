class AddColumnIsResolvedToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :is_resolved, :boolean, default: false
  end
end
