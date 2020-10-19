# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :line_items
  has_many :orders, through: :line_items, dependent: :destroy

  has_many :item_categories
  has_many :categories, through: :item_categories

  has_many :cart_items
  has_many :carts, through: :cart_items, dependent: :destroy

  has_one_attached :image

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  after_commit :add_default_image, on: %i[create update]

  private

  def add_default_image
    unless image.attached?
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'avatar.jpeg')), filename: 'avatar.jpeg', content_type: 'image/jpeg')
    end
  end
end
