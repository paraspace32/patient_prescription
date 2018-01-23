class PrescriptionMedication < ActiveRecord::Base
  belongs_to :patient
  belongs_to :doctor

  before_validation :check_doctor, on: :create
  before_validation :check_patient, on: :create

  private

  def check_doctor
    if Doctor.where(id: doctor_id).empty?
      self.errors[:base] << 'Doctor is invalid'
    end
  end

  def check_patient
    if Patient.where(id: patient_id).empty?
      self.errors[:base] << 'Patient is invalid'
    end
  end
end
