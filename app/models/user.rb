class User < ApplicationRecord
  enum type: { Admin: 'Admin', Customer: 'Customer'}

  validates :email, presence: true, uniqueness: true
  validates :fullname, presence: true
  validates_length_of :display_name, minimum: 2, maximum: 32, presence: true
end
