class Gathering < ApplicationRecord

    #has_many     :addresses
    has_one    :address
    belongs_to  :host, :class_name => "User", :foreign_key => "host_id"
    has_many    :prayers
    has_many    :users, through: :prayers

    validate    :future_event

    validates :name, presence: true
    default_scope { order('meeting_date ASC') }

    scope :active_gatherings, -> {where("meeting_date > ?", Time.now)}

    before_validation do
        self.meeting_date = set_in_timezone(self.meeting_date, self.timezone)
    end


    def set_in_timezone(time, zone)
        Time.use_zone(zone) { time.to_datetime.change(offset: Time.zone.now.strftime("%z")) }
    end

    def address_attributes=(attributes)

        if self.address
            #binding.pry
            self.address.address_1 = attributes[:address_1]
            self.address.address_2 = attributes[:address_2]
            self.address.city = attributes[:city]
            self.address.state = attributes[:state]
            self.address.zipcode = attributes[:zipcode]
            #binding.pry
        else
            self.build_address(attributes)
        end
        
    end


    def gathering_display
        
        "#{self.meeting_date.in_time_zone(self.timezone).strftime("%B %e, %Y %l:%M%p") + " " + self.timezone} meeting at #{self.name}"
    end


    def future_event
        if meeting_date != nil
            #binding.pry
            errors.add(:meeting_date, "cannot be in the past.") if self.meeting_date.in_time_zone < Time.zone.now
        end
        
    end    


end
