class Car < ApplicationRecord
    validates :plate_number, uniqueness: true
    validates :year, numericality: {
        only_integer: true,
        in: 1900..Time.zone.now.year,
        message: "must be between 1900 and #{Time.zone.now.year}"
    }
end
