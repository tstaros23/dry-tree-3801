require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end
  describe 'instance methods' do
    describe '.doctor_count' do
      it "can count the number of doctors at the hospital" do
        hospital = Hospital.create!(name:'Hells Pass')
        doctor = Doctor.create!(name: 'Ted', specialty: 'Hambones', university: 'Mizzou', hospital_id: hospital.id)
        doctor2 = Doctor.create!(name: 'Bob', specialty: 'Brains', university: 'New Jersey', hospital_id: hospital.id)
        doctor2 = Doctor.create!(name: 'Chuck', specialty: 'Brains', university: 'New Jersey', hospital_id: hospital.id)

        expect(hospital.doctor_count).to eq(3)
      end
    end
    describe '.universities_distinct' do
      it "can show a unique list of universities that the doctor's attended" do
        hospital = Hospital.create!(name:'Hells Pass')
        doctor = Doctor.create!(name: 'Ted', specialty: 'Hambones', university: 'Mizzou', hospital_id: hospital.id)
        doctor2 = Doctor.create!(name: 'Bob', specialty: 'Brains', university: 'New Jersey', hospital_id: hospital.id)
        doctor2 = Doctor.create!(name: 'Chuck', specialty: 'Brains', university: 'New Jersey', hospital_id: hospital.id)

        expect(hospital.universities_distinct).to eq(['Mizzou', 'New Jersey'])
      end
    end
  end
end
