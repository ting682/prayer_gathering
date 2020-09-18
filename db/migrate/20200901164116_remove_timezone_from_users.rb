class RemoveTimezoneFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :timezone, :string
  end
end
