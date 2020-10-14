# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :line_items
  has_many :orders, through: :line_items, dependent: :destroy

  has_many :item_categories
  has_many :categories, through: :item_categories

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
