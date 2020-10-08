# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_one :cart

  enum type: %w[Admin Customer]

  validates :full_name, presence: true
  validates_length_of :display_name, minimum: 2, maximum: 32, presence: true

  before_create :set_type

  def admin?
    type == 'Admin'
  end

  def customer?
    type == 'Customer'
  end

  private

  def set_type
    self.type = 'Customer'
  end
end
