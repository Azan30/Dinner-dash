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

  after_create :set_type

  private

  def set_type
    if self.type.nil?
      self.update_attributes!(type: 'Customer')
    end
  end
end
