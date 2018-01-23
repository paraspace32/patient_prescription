require 'test_helper'

class PrescriptionMedicationsControllerTest < ActionController::TestCase
  setup do
    @prescription_medication = prescription_medications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prescription_medications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prescription_medication" do
    assert_difference('PrescriptionMedication.count') do
      post :create, prescription_medication: { doctor_name: @prescription_medication.doctor_name, medication: @prescription_medication.medication, patient_id: @prescription_medication.patient_id }
    end

    assert_redirected_to prescription_medication_path(assigns(:prescription_medication))
  end

  test "should show prescription_medication" do
    get :show, id: @prescription_medication
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prescription_medication
    assert_response :success
  end

  test "should update prescription_medication" do
    patch :update, id: @prescription_medication, prescription_medication: { doctor_name: @prescription_medication.doctor_name, medication: @prescription_medication.medication, patient_id: @prescription_medication.patient_id }
    assert_redirected_to prescription_medication_path(assigns(:prescription_medication))
  end

  test "should destroy prescription_medication" do
    assert_difference('PrescriptionMedication.count', -1) do
      delete :destroy, id: @prescription_medication
    end

    assert_redirected_to prescription_medications_path
  end
end
