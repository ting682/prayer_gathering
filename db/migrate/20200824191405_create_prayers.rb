class CreatePrayers < ActiveRecord::Migration[6.0]
  def change
    create_table :prayers do |t|
      t.integer   :gathering_id
      t.integer   :user_id
      t.string    :title
      t.string    :content
      t.timestamps
    end
  end
end
