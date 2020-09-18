class CreateGatherings < ActiveRecord::Migration[6.0]
  def change
    create_table :gatherings do |t|
      t.datetime  :meeting_date
      t.string    :phone_number
      t.integer   :host_id
      t.integer   :address_id
      t.string    :picture_url
      t.string    :url

      t.timestamps
    end
  end
end
