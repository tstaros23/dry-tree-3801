require 'rails_helper'

RSpec.describe 'Show page' do
  it "shows the hospital's name, number of doctors that work at the hospital and a unique list of universities that the doctor's attended" do

    hospital = Hospital.create!(name:'Hells Pass')
    doctor = Doctor.create!(name: 'Ted', specialty: 'Hambones', university: 'Mizzou', hospital_id: hospital.id)
    doctor2 = Doctor.create!(name: 'Bob', specialty: 'Brains', university: 'New Jersey', hospital_id: hospital.id)
    doctor2 = Doctor.create!(name: 'Chuck', specialty: 'Brains', university: 'New Jersey', hospital_id: hospital.id)

    visit "/hospitals/#{hospital.id}"

    expect(page).to have_content(hospital.name)
    expect(page).to have_content('3')
    expect(page).to have_content('New Jersey', :count => 1)
    expect(page).to have_content('Mizzou')
  end
end
