class CreatePrescriptionMedications < ActiveRecord::Migration
  def change
    create_table :prescription_medications do |t|
      t.text :medication
      t.integer :patient_id
      t.string :doctor_name

      t.timestamps null: false
    end
  end
end
