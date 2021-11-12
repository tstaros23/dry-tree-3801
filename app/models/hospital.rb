class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_count
    doctors.count
  end

  def universities_distinct
    doctors.distinct.pluck(:university)
  end
end
