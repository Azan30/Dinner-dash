# frozen_string_literal: true

class Item < ApplicationRecord
  include Avatar

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
    get_avatar('item_avatar.jpeg')
  end
end
