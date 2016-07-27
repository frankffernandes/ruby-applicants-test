class Setting < ActiveRecord::Base
    def self.is_first_load?
        first_load = Setting.find_by_name("first_load")
        first_load.value == "true"
    end

    def self.update_first_load
        first_load = Setting.find_by_name("first_load")
        first_load.update_column(:value, "true")
    end
end
