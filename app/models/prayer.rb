class Prayer < ApplicationRecord

    belongs_to  :user
    belongs_to  :gathering

    validates :title, presence: true
    validates :content, presence: true
end
