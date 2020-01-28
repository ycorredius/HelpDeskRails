class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :content
      t.boolean :is_resolved
      t.integer :response_id

      t.timestamps
    end
  end
end
