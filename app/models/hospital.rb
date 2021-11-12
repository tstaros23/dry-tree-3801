class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_count
    doctors.count
  end

  def universities_distinct
    doctors.select(:university).distinct
    require pry; binding.pry
  end
end
