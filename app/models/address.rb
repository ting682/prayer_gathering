class Address < ApplicationRecord

    belongs_to :gathering

    validates :address_1, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :zipcode, presence: true

end
