class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders

  enum type: [ 'Admin', 'Customer' ]
  validates :full_name, presence: true
  validates_length_of :display_name, minimum: 2, maximum: 32, presence: true
end
