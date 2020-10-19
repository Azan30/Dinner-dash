# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :orders
  has_one :cart

  has_one_attached :avatar

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
    unless avatar.attached?
      avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'user_avatar.jpeg')), filename: 'avatar.jpeg', content_type: 'image/jpeg')
    end
  end
end
