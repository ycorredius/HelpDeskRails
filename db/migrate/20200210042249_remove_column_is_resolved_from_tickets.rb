class RemoveColumnIsResolvedFromTickets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tickets, :is_resolved
  end
end
