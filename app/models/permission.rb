class Permission < ActiveRecord::Base
  belongs_to :patient
  belongs_to :user

  validates_presence_of :user_id

  class << self
    def create_new(patient_id, user)
      permission = Permission.where(patient_id: patient_id, user_id: user.id).first

      if permission.nil?
        Permission.create(patient_id: patient_id, user_id: user.id , requestee: user.name, requestee_type: user.type)
      else
        return permission
      end
    end
  end
end