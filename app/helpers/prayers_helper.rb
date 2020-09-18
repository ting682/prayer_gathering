module PrayersHelper

    def gathering_id_field(prayer)
        if prayer.gathering.nil?
            collection_select(:prayer, :gathering_id, Gathering.where("meeting_date > ?", Time.now), :id, :gathering_display)
        else
            hidden_field_tag "prayer[gathering_id]", prayer.gathering_id
        end
    end

end
