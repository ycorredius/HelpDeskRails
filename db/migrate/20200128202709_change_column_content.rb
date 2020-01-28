class ChangeColumnContent < ActiveRecord::Migration[6.0]
  def change
    change_column :tickets, :content, :text
  end
end
