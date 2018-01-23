module PatientHelper
  def get_doctor_name(permission)
    User.find(permission.user_id) rescue nil
  end
end
