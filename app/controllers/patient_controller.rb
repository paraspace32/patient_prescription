class PatientController < ApplicationController
  before_action :authenticate_user!, only: [:access_request, :permit_access, :show, :permit]
  before_action :set_patient, only: [:show, :permit_access]
  before_action :set_patient_for_index, only: [:index]
  before_action :check_patient_for_permit, only: [:permit]
  before_action :check_patient_for_permit_access, only: [:permit_access, :show]
  before_action :check_access_user, only: [:access_request]

  def index
    @patients = Patient.all
  end

  def show
    @access = Permission.where(user_id: current_user.id, patient_id: params[:id]).first
  end

  def access_request
    @rv = Permission.create_new(params[:id], current_user)
    redirect_to :back, notice: 'Request has been raised'
  end

  def permit_access
    @rv = Permission.where(patient_id: params[:id], permit: false)
  end

  def permit
    @permission.update_attributes(permit: true)
    redirect_to :back, notice: 'Request has been approved'
  end

  private

  def set_patient
    @patient = Patient.find(params[:id]) rescue nil
    if @patient.nil?
      redirect_to root_path, notice: 'Patient not present'
    end
  end

  def check_patient_for_permit_access
    if current_user.id != params[:id].to_i and current_user.type == 'Patient'
      redirect_to root_path, notice: 'You are not authorized'
    end
  end

  def check_access_user
    if current_user.type == 'Patient'
      redirect_to root_path, notice: 'You are not authorized'
    end
  end

  def check_patient_for_permit
    @permission = Permission.find(params[:id]) rescue nil

    if @permission.nil?
      redirect_to root_path, notice: 'No permission found'
    end

    if current_user.id != @permission.patient_id
      redirect_to root_path, notice: 'You are not authorized'
    end
  end

  def set_patient_for_index
    if current_user and current_user.type == 'Patient'
      @patient = Patient.find(current_user.id)
    end
  end
end