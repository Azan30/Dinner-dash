# frozen_string_literal: true

class User < ApplicationRecord
  include Avatar
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :orders
  has_one :cart

  has_one_attached :image

  validates :full_name, presence: true
  validates_length_of :display_name, minimum: 2, maximum: 32, presence: true
  attribute :type, :integer, default: 1
  enum type: {
    Admin: 0,
    Customer: 1
  }

  after_commit :add_default_image, on: %i[create update]

  def admin?
    self.Admin?
  end

  def customer?
    self.Customer?
  end

  private

  def add_default_image
    get_avatar('user_avatar.jpeg')
  end
end
