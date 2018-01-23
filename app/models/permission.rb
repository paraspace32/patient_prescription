class Permission < ActiveRecord::Base
  belongs_to :patient
  belongs_to :user

  before_validation :user_type, on: :create

  class << self
    def create_new(patient_id, user_id)
      permission = Permission.where(patient_id: patient_id, user_id: user_id).first

      if permission.nil?
        Permission.create(patient_id: patient_id, user_id: user_id)
      else
        return 'Request already raised'
      end
    end
  end

  private

  def user_type
    user = User.where(id: user_id)
    if user.empty? || user.first.type == 'Patient'
      self.errors[:base] << 'Permission is granted for doctor and pharmacist only'
    end
  end
end