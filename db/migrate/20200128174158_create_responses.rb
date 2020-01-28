class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.string :content
      t.integer :user_id
      t.integer :ticket_id

      t.timestamps
    end
  end
end
