class AddNameToGatherings < ActiveRecord::Migration[6.0]
  def change
    add_column :gatherings, :name, :string
  end
end
