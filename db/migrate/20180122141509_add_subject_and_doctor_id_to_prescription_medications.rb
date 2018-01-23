class AddSubjectAndDoctorIdToPrescriptionMedications < ActiveRecord::Migration
  def change
    add_column :prescription_medications, :subject, :string
    add_column :prescription_medications, :doctor_id, :integer
  end
end
