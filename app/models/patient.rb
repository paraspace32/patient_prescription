class Patient < User
  has_many :prescription_medications, dependent: :destroy
  has_many :permissions,  dependent: :destroy
end