class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :type, inclusion: { in: ['Doctor', 'Patient', 'Pharmacist'], message: "%{value} can be doctor, patient or pharmacist!" }
  validates_presence_of :name, message: 'Please provide name of user'

  has_many :permissions,  dependent: :destroy
end
