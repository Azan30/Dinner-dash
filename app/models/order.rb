# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user

  has_many :line_items
  has_many :items, through: :line_items, dependent: :destroy

  enum status: ['Pending', 'Canceled', 'Completed', 'In Progress']
  validates :status, presence: true
  validates :bill, numericality: { greater_than: 0 }
end
