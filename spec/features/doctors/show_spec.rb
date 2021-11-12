require 'rails_helper'

'User Story 1, Doctors Show Page
​
As a visitor
When I visit a doctors show page
I see all of that doctors information including:
 - name
 - specialty
 - university where they got their doctorate
And I see the name of the hospital where this doctor works
And I see the names of all of the patients this doctor has'

RSpec.describe 'show page' do
  it "shows the doctor's attributes, patient's names, and hosptital they work for" do
    hospital = Hospital.create!(name:'Hells Pass')
    doctor = Doctor.create!(name: 'Ted', specialty: 'Hambones', university: 'Mizzou', hospital_id: hospital.id)
    patient = Patient.create!(name: 'Joe', age: 29)
    patient2 = Patient.create!(name: 'Clark', age: 30)
    DoctorPatient.create!(patient_id: patient.id, doctor_id: doctor.id)
    DoctorPatient.create!(patient_id: patient2.id, doctor_id: doctor.id)

    doctor2 = Doctor.create!(name: 'Bob', specialty: 'Brains', university: 'New Jersey', hospital_id: hospital.id)

    visit "/doctors/#{doctor.id}"

    expect(page).to have_content(doctor.name)
    expect(page).to have_content(doctor.specialty)
    expect(page).to have_content(doctor.university)
    expect(page).to have_content(hospital.name)
    expect(page).to have_content(patient.name)
    expect(page).to have_content(patient2.name)


    expect(page).not_to have_content(doctor2.name)
    expect(page).not_to have_content(doctor2.specialty)
    expect(page).not_to have_content(doctor2.university)
  end
end
