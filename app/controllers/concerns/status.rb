module Status
  extend ActiveSupport::Concern

  def orders_statuses
    status = ['All','Pending', 'Canceled','Completed', 'In Progress']
    status.freeze
    status
  end
end
