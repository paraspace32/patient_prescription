class PrescriptionMedicationsController < ApplicationController
  before_action :set_prescription_medication, only: [:destroy, :show]
  before_action :set_patient, only: [:create, :new, :show, :destroy]
  before_action :authenticate_user!
  before_action :set_doctor_for_prescription, only: [:create, :new]
  before_action :destroy_personal_prescription, only: [:destroy]

  def show
  end

  def new
    @prescription_medication = PrescriptionMedication.new
  end

  def create
    @prescription_medication = PrescriptionMedication.new(prescription_medication_params)
    @prescription_medication.patient_id = @patient.id
    @prescription_medication.doctor_name = current_user.name
    @prescription_medication.doctor_id = current_user.id

    respond_to do |format|
      if @prescription_medication.save
        format.html { redirect_to @patient, notice: 'Prescription was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @prescription_medication.destroy
    respond_to do |format|
      format.html { redirect_to @patient, notice: 'Prescription was successfully destroyed.' }
    end
  end

  private

  def set_prescription_medication
    @prescription_medication = PrescriptionMedication.find(params[:id])
  end

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def prescription_medication_params
    params.require(:prescription_medication).permit(:medication, :subject)
  end

  def set_doctor_for_prescription
    if current_user.type != 'Doctor'
      redirect_to root_path, notice: 'You are not authorized'
    end
  end

  def destroy_personal_prescription
    if current_user.id != @patient.id
      redirect_to root_path, notice: 'You are not authorized'
    end
  end
end
