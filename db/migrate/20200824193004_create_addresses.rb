class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.belongs_to  :gathering
      t.string    :address_1
      t.string    :address_2
      t.string    :city
      t.string    :state
      t.integer   :zipcode

      t.timestamps
    end
  end
end
