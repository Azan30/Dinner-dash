# frozen_string_literal: true

module Status
  extend ActiveSupport::Concern

  def orders_statuses
    ['All', 'Pending', 'Canceled', 'Completed', 'In Progress']
  end
end
