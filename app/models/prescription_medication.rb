class PrescriptionMedication < ActiveRecord::Base
  belongs_to :patient
  belongs_to :doctor

  validates_presence_of :doctor_id
  validates_presence_of :patient_id
end
