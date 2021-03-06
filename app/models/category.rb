# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :item_categories
  has_many :items, through: :item_categories, dependent: :destroy

  validates :title, presence: true, uniqueness: true
end
