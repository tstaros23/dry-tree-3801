hospital = Hospital.create(name: "Grey Sloan Memorial Hospital")
dr_bailey = hospital.doctors.create(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
ted = dr_bailey.patients.create(name: 'Ted', age: 29)
DoctorPatient.create!(patient_id: ted.id, doctor_id: dr_bailey.id)
