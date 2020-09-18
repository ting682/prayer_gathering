class AddTimezoneToGathering < ActiveRecord::Migration[6.0]
  def change
    add_column :gatherings, :timezone, :string
  end
end
