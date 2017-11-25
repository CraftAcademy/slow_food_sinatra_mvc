class Order < ActiveRecord::Base
  VALID_STATUS = ['pending', 'confirmed']
  belongs_to :user
  has_many :order_items

  validates_inclusion_of :status, in: VALID_STATUS


  def total
    self.order_items.reduce(0) do |sum, obj|
      sum + obj.product.price
    end
  end

  def confirmed?
    self.status == 'confirmed'
  end

  def pending?
    self.status == 'pending'
  end

end
