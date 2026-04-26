class Order < ApplicationRecord
  enum status: { accepted: 0, in_progress: 1, ready: 2, completed: 3 }

  before_create :generate_order_number
  after_create :notify_created

  validates :customer_phone, presence: true
  validates :service_type, presence: true

  def generate_order_number
    self.order_number = "FS#{Time.now.to_i.to_s.last(6)}"
  end

  def notify_created
    Rails.logger.info "SMS: Замовлення №#{order_number} прийнято"
  end

  def mark_ready!
    update(status: :ready)
    Rails.logger.info "SMS: Замовлення №#{order_number} готове"
  end
end
