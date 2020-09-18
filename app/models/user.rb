class User < ApplicationRecord

    has_secure_password

    validates   :name, presence: true
    validates   :email_address, uniqueness: true, presence: true

    has_many    :prayers
    has_many    :gatherings, :through => :prayers

end
