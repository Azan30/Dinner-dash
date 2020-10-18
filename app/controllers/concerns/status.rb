module Status
  extend ActiveSupport::Concern

  def orders_statuses
    ['All','Pending', 'Canceled','Completed', 'In Progress'].freeze
  end
end
