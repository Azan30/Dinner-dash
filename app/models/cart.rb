class Cart < ApplicationRecord
  belongs_to :user, dependent: :destroy

  has_many :line_items, dependent: :destroy
end
